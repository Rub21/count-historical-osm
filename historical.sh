#!/bin/bash
#2010
#1262304000 = 01/01/2010
mkdir 2010
cd 2010
wget http://planet.openstreetmap.org/cc-by-sa/planet-101229.osm.bz2
touch pro2010
touch pro2010log
chmod 777 pro2010
chmod 777 pro2010log
cp ../boundary/gb.poly .
cp ../index.js .
echo "bzcat planet-101229.osm.bz2 | osmconvert - -B=boundary/gb.poly -o=gb-planet-101229.osm
node index.js --osmfile=gb-planet-101229.osm --timestamp=1262304000" > pro2012
nohup ./pro2011 > pro2011log  2>&1 &
cd ..

#2011
#1293840000 = 01/01/2012
mkdir 2011
cd 2011
wget http://planet.openstreetmap.org/cc-by-sa/planet-111228.osm.bz2
touch pro2011
touch pro2011log
chmod 777 pro2011
chmod 777 pro2011log
cp ../boundary/gb.poly .
cp ../index.js .
echo "bzcat planet-111228.osm.bz2 | osmconvert - -B=boundary/gb.poly -o=gb-planet-111228.osm
node index.js --osmfile=gb-planet-111228.osm --timestamp=1293840000" > pro2012
nohup ./pro2011 > pro2011log  2>&1 &
cd ..

#2012
#1325376000 = 01/01/2012
mkdir 2012
cd 2012
wget http://planet.openstreetmap.org/planet/2012/planet-121226.osm.bz2
touch pro2012
touch pro2012log
chmod 777 pro2012
chmod 777 pro2012log
cp ../boundary/gb.poly .
cp ../index.js .
echo "bzcat planet-121226.osm.bz2 | osmconvert - -B=boundary/gb.poly -o=gb-planet-121226.osm
node index.js --osmfile=gb-planet-121226.osm --timestamp=1325376000" > pro2012
nohup ./pro2012 > pro2012log  2>&1 &
cd ..

#2013
#1356998400 = 01/01/2013
mkdir 2013
cd 2013
wget http://planet.openstreetmap.org/planet/2013/planet-131225.osm.bz2
touch pro2013
touch pro2013log
chmod 777 pro2013
chmod 777 pro2013log
cp ../boundary/gb.poly .
cp ../index.js .
echo "bzcat planet-131225.osm.bz2 | osmconvert - -B=gb.poly -o=gb-planet-131225.osm
node index.js --osmfile=gb-planet-131225.osm --timestamp=1356998400" > pro2013
nohup ./pro2013 > pro2013log  2>&1 &
cd ..

#2014
#1388534400 = 01/01/2014
mkdir 2014
cd 2014
wget http://planet.openstreetmap.org/planet/2014/planet-141229.osm.bz2
touch pro2014
touch pro2014log
chmod 777 pro2014
chmod 777 pro2014log
cp ../boundary/gb.poly .
cp ../index.js .
echo "bzcat planet-141229.osm.bz2 | osmconvert - -B=boundary/gb.poly -o=gb-planet-141229.osm
node index.js --osmfile=gb-planet-141229.osm --timestamp=1388534400" > pro2014
nohup ./pro2014 > pro2014log  2>&1 &
cd ..