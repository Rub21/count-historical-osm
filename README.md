# count-historical-osm

Contara todos los  objetos con tag creados enetre le 2013 y 2014

#### Historical files

gat files from http://planet.osm.org/replication/day/000/000/

#### Requirements 

 - use  `c4.2xlarge` or more. 

#### Run

```
git clone https://github.com/Rub21/count-historical-osm.git
cd count-historical-osm/
npm install
./historical.sh
```

la aplicacion creara tareas en background, para cada year 2010-2014.  para obtener los datos ingresar al sever, he ir carpeta por carpeta de cada year, recolectando el archivo *.md

