var fs = require('fs');
var osmium = require('osmium');
var argv = require('optimist').argv;
var _ = require('underscore');
var osmfile = argv.osmfile;
var year = argv.year;
var pg = require('pg');
var conString = "postgres://postgres:1234@localhost/dbosm";
var client = new pg.Client(conString);
client.connect(function(err) {
        if (err) {
                return console.error('could not connect to postgres', err);
        }
});

var obj = function() {
        return {
                osm_timestamp: 0,
                numfile: parseInt(osmfile.split('.')[0]),
                allnodes1: 0, //all nodes
                allnodesx: 0, //all nodes
                allways1: 0,
                allwaysx: 0, //all ways
                allrelations1: 0, //all relations
                allrelationsx: 0, //all relations
                nodev1: 0, //amenity,leisure and shop
                nodevx: 0, //amenity,leisure and shop
                way1: 0, //highway and buildings
                wayx: 0, //highway and buildings
                relation1: 0, //highway and buildings
                relationx: 0 //highway and buildings
        };
};

var counter = new obj();

//var file = new osmium.File(osmfile);
var reader = new osmium.Reader(osmfile);
var handler = new osmium.Handler();

handler.on('node', function(node) {
        counter.osm_timestamp = node.timestamp_seconds_since_epoch - node.timestamp_seconds_since_epoch % 1000;
        if (console.log(_.size(node.tags()) > 0) {

                if (node.version === 1) {
                        counter.nodev1++;
                } else {
                        counter.nodevx++;
                }
        }
});

handler.on('way', function(way) {
        if (_.size(way.tags()) > 0) {
        if (way.version === 1) {
                counter.way1++;
        } else {
                counter.wayx++;
        }
}
});
handler.on('relation', function(relation) {
        if (_.size(relation.tags()) > 0) {
        if (relation.version === 1) {
                counter.relation1++;
        } else {
                counter.relationx++;
        }
}
});

osmium.apply(reader, handler);
var fields = 'osm_timestamp, numfile, allnodes1, allnodesx, allways1, allwaysx, allrelations1, allrelationsx, nodev1, nodevx, way1, wayx, relation1, relationx';
var query = 'INSERT INTO osm' + year + '( ' + fields + ') VALUES($1, $2, $3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14);';
var data = [
        counter.osm_timestamp,
        counter.numfile,
        counter.allnodes1,
        counter.allnodesx,
        counter.allways1,
        counter.allwaysx,
        counter.allrelations1,
        counter.allrelationsx,
        counter.nodev1,
        counter.nodevx,
        counter.way1,
        counter.wayx,
        counter.relation1,
        counter.relationx
];
client.query(query, data, function(err, result) {
        if (err) {
                console.log(err);
        }
        client.end();
});