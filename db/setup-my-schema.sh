#!/bin/bash -xe
gosu postgres postgres --single <<- EOSQL
   CREATE DATABASE $DB;
   CREATE USER plone WITH PASSWORD '$PASS';
   GRANT ALL PRIVILEGES ON DATABASE $USER to $DB;
EOSQL
