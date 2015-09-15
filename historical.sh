#!/bin/bash
#2010
#1262304000 = 01/01/2010
wget http://planet.openstreetmap.org/cc-by-sa/planet-101229.osm.bz2
bzcat planet-101229.osm.bz2 | osmconvert - -B=boundary/gb.poly -o=gb-planet-101229.osm
node index.js --osmfile=gb-planet-101229.osm --timestamp=1262304000


#2011
#1293840000 = 01/01/2012
wget http://planet.openstreetmap.org/cc-by-sa/planet-111228.osm.bz2
bzcat planet-111228.osm.bz2 | osmconvert - -B=boundary/gb.poly -o=gb-planet-111228.osm
node index.js --osmfile=gb-planet-111228.osm --timestamp=1293840000

#2012
#1325376000 = 01/01/2012
wget http://planet.openstreetmap.org/planet/2012/planet-121226.osm.bz2
bzcat planet-121226.osm.bz2 | osmconvert - -B=boundary/gb.poly -o=gb-planet-121226.osm
node index.js --osmfile=gb-planet-121226.osm --timestamp=1325376000


#2013
#1356998400 = 01/01/2013
wget http://planet.openstreetmap.org/planet/2013/planet-131225.osm.bz2
bzcat planet-131225.osm.bz2 | osmconvert - -B=boundary/gb.poly -o=gb-planet-131225.osm
node index.js --osmfile=gb-planet-131225.osm --timestamp=1356998400


#2014
#1388534400 = 01/01/2014
wget http://planet.openstreetmap.org/planet/2014/planet-141229.osm.bz2
bzcat planet-141229.osm.bz2 | osmconvert - -B=boundary/gb.poly -o=gb-planet-141229.osm
node index.js --osmfile=gb-planet-141229.osm--timestamp=1388534400




#while read -r line; do
 #   echo wget $line
  #  base=${line##*/}
   # bzcat ${base%.*} | osmconvert - -B=boundary/gb.poly -o=gb-${base%.*}

    #osmfilter gb-${base%.*} --keep="highway=" -o=highway-gb-${base%.*}
    #osmfilter gb-${base%.*} --keep="building=" -o=building-highway-gb-${base%.*}
    #osmfilter gb-${base%.*} --keep="leisure= amenity=" -o=pois-highway-gb-${base%.*}
    # merger
    #osmconvert highway-gb-${base%.*} building-highway-gb-${base%.*} pois-highway-gb-${base%.*} -o=result-gb-${base%.*}
#done < historical-list
