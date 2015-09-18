#!/bin/bash
mkdir 2014
cd 2014
touch log2014
chmod 777 log2014
cp ../osm2pg.sh .
cp ../index.js .
nohup ./osm2pg.sh 476 840 2014 > log2014  2>&1 &

cd ..

mkdir 2013
cd 2013
touch log2013
chmod 777 log2013
cp ../osm2pg.sh .
cp ../index.js .
nohup ./osm2pg.sh 11 475 2013 > log2013  2>&1 &





