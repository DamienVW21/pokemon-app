#!/bin/bash
set -ex  # Enable debugging (-x) and stop on error (-e)
export PGPASSWORD='postgres1'
BASEDIR=$(dirname $0)
DATABASE=final_capstone

echo "Starting database setup..."

echo "Dropping the database (if it exists)..."
psql -U postgres -f "$BASEDIR/dropdb.sql"

echo "Creating the database..."
createdb -U postgres $DATABASE

echo "Running schema.sql..."
psql -U postgres -d $DATABASE -f "$BASEDIR/schema.sql"

echo "Running data.sql..."
psql -U postgres -d $DATABASE -f "$BASEDIR/data.sql"

echo "Running user.sql..."
psql -U postgres -d $DATABASE -f "$BASEDIR/user.sql"

echo "Database setup complete!"
