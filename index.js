var fs = require('fs');
var osmium = require('osmium');
var argv = require('optimist').argv;
var _ = require('underscore');
var osmfile = argv.osmfile;

var obj = function() {
        return {
                allnodes: 0, //all nodes
                allways: 0, //all ways
                allrealtions: 0, //all relations
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
var outputFilename = osmfile.split('.')[0] + '.json';

fs.writeFile(outputFilename, JSON.stingify(counter), function(err) {
        if (err) {
                console.log(err);
        }
});