-- **************************************************************
-- This script destroys the database and associated users
-- **************************************************************

-- The following line terminates any active connections to the database so that it can be destroyed
SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname = 'final_capstone';

DROP DATABASE final_capstone;

REASSIGN OWNED BY final_capstone_owner TO postgres;
REASSIGN OWNED BY final_capstone_appuser TO postgres;

DROP OWNED BY final_capstone_owner;
DROP OWNED BY final_capstone_appuser;

DROP ROLE IF EXISTS final_capstone_owner;
DROP ROLE IF EXISTS final_capstone_appuser;
