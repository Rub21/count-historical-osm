#!/bin/bash
while read -r line; do
    echo wget $line
    echo decompres ${line##*/}
    echo bzip2 -d ${line##*/}
    base=${line##*/}
    echo osmconvert ${base%.*} -B=boundary/gb.poly -o=gb-${base%.*}
    osmfilter gb-${base%.*} --keep="highway=" -o=highway-gb-${base%.*}
    osmfilter gb-${base%.*} --keep="building=" -o=building-highway-gb-${base%.*}
    osmfilter gb-${base%.*} --keep="leisure= amenity=" -o=pois-highway-gb-${base%.*}
    # merger
    osmconvert highway-gb-${base%.*} building-highway-gb-${base%.*} pois-highway-gb-${base%.*} -o=result-gb-${base%.*}
    
done < historical-list
