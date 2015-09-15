#!/bin/bash
while read -r line; do
    echo wget $line
    echo decompres ${line##*/}
    echo bzip2 -d ${line##*/}
    base=${line##*/}
    osmconvert ${base%.*} -B=boundary/gb.poly -o=gb-${base%.*}
    #osmfilter gb-${base%.*} --keep="highway=" -o=highway-gb-${base%.*}
    #osmfilter gb-${base%.*} --keep="building=" -o=building-highway-gb-${base%.*}
    #osmfilter gb-${base%.*} --keep="leisure= amenity=" -o=pois-highway-gb-${base%.*}
    # merger
    #osmconvert highway-gb-${base%.*} building-highway-gb-${base%.*} pois-highway-gb-${base%.*} -o=result-gb-${base%.*}
done < historical-list

    # esto se implementa solo para filtrar las fechas:
    echo  Num objects 2010
    #1262304000 = 01/01/2010
    node index.js node index.js --osmfile=gb-planet-101229.osm --timestamp=1262304000

    echo  Num objects 2011
    #1293840000 = 01/01/2012
    node index.js node index.js --osmfile=gb-planet-111228.osm --timestamp=1293840000
    echo  Num objects 2012
    #1325376000 = 01/01/2012
    node index.js node index.js --osmfile=gb-planet-121226.osm --timestamp=1325376000
    echo  Num objects 2013
    #1356998400 = 01/01/2013
    node index.js node index.js --osmfile=gb-planet-131225.osm --timestamp=1356998400
    echo  Num objects 2014
    #1388534400 = 01/01/2014
    node index.js node index.js --osmfile=gb-planet-111228.osm --timestamp=1388534400

