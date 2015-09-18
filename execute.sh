#!/bin/bash
psql -U postgres -c "DROP database dbosm"
psql -U postgres -c "create database dbosm";
psql -U postgres -d dbosm -f /usr/share/postgresql/9.3/contrib/postgis-2.1/postgis.sql
psql -U postgres -d dbosm -f /usr/share/postgresql/9.3/contrib/postgis-2.1/spatial_ref_sys.sql
psql --host=localhost --port=5432 --username=postgres --dbname=dbosm -f query/tables.sql

mkdir 2014
cd 2014
touch log2014
chmod 777 log2014
cp ../osm2pg.sh .
cp ../index.js .
mkdir boundary
cp ../boundary/gb.poly boundary/
nohup ./osm2pg.sh 476 840 2014 > log2014  2>&1 &

cd ..

mkdir 2013
cd 2013
touch log2013
chmod 777 log2013
cp ../osm2pg.sh .
cp ../index.js .
mkdir boundary
cp ../boundary/gb.poly boundary/
nohup ./osm2pg.sh 11 475 2013 > log2013  2>&1 &





