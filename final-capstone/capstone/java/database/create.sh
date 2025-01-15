#!/bin/bash
set -e  # Exit on any error
set -x  # Print commands as they are executed

export PGPASSWORD='Damien1331'
BASEDIR=$(dirname $0)
DATABASE=final_capstone

echo "Dropping database and roles if they exist..."
psql -U postgres -f "$BASEDIR/dropdb.sql"

echo "Creating database $DATABASE..."
createdb -U postgres $DATABASE

echo "Running schema.sql..."
psql -U postgres -d $DATABASE -f "$BASEDIR/schema.sql"

echo "Running data.sql..."
psql -U postgres -d $DATABASE -f "$BASEDIR/data.sql"

echo "Running user.sql..."
psql -U postgres -d $DATABASE -f "$BASEDIR/user.sql"
