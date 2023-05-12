#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTRGES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER $NEWUSER;
    CREATE DATABASE $NEWDB;
    GRANT ALL PRIVILEGES ON DATABASE $NEWDB TO $NEWUSER;
    \c mytestdb postgres
    GRANT ALL ON SCHEMA public TO simple_user;
EOSQL