var fs = require('fs');
var osmium = require('osmium');
var argv = require('optimist').argv;
var _ = require('underscore');
var osmfile = argv.osmfile;
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
                allnodes: 0, //all nodes
                allways: 0, //all ways
                allrelations: 0, //all relations
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

        counter.allnodes++;
        if (node.tags().amenity !== undefined || node.tags().leisure !== undefined || node.tags().shop !== undefined) {
                if (node.version === 1) {
                        counter.nodev1++;
                } else {
                        counter.nodevx++;
                }
        }
});

handler.on('way', function(way) {
        counter.allways++;
        if (way.tags().highway !== undefined || way.tags().building !== undefined) {
                if (way.version === 1) {
                        counter.way1++;
                } else {
                        counter.wayx++;
                }
        }
});
handler.on('relation', function(relation) {
        counter.allrealtions++;
        if (relation.tags().highway !== undefined || relation.tags().building !== undefined) {
                if (relation.version === 1) {
                        counter.relation1++;
                } else {
                        counter.relationx++;
                }
        }
});

osmium.apply(reader, handler);

var query = 'INSERT INTO osm2014(osm_timestamp,numfile,allnodes,allways,allrelations,nodev1,nodevx,way1,wayx,relation1,relationx)  VALUES ($1, $2, $3,$4,$5,$6,$7,$8,$9,$10,$11);';
var data = [counter.osm_timestamp, counter.numfile, counter.allnodes, counter.allways, counter.allrelations, counter.nodev1, counter.nodevx, counter.way1, counter.wayx, counter.relation1, counter.relationx]
client.query(query, data, function(err, result) {
        if (err) {
                console.log(err);
        }
});