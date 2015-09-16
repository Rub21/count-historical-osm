# count-historical-osm


#### Historical files

- 2010-12-30 03:32   13G  

http://planet.openstreetmap.org/cc-by-sa/planet-101229.osm.bz2


- 2011-12-29 09:01   19G  

http://planet.openstreetmap.org/cc-by-sa/planet-111228.osm.bz2

- 2012-12-29 06:22   25G 

http://planet.openstreetmap.org/planet/2012/planet-121226.osm.bz2

-  2013-12-25 20:49   32G

http://planet.openstreetmap.org/planet/2013/planet-131225.osm.bz2

#### Requirements 

 - use  `r3.2xlarge` or more. 

#### Run

```
git clone https://github.com/Rub21/count-historical-osm.git
cd count-historical-osm/
npm install
./historical.sh
```

la aplicacion creara tareas en background, para cada year 2010-2014.  para obtener los datos ingresar al sever, he ir carpeta por carpeta de cada year, recolectando el archivo *.md

