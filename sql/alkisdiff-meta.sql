
drop table if exists meta;
drop table if exists files;

PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE files ( id serial, name varchar, mime varchar, content blob );

CREATE TABLE meta ( key varchar, value varchar );
INSERT INTO "meta" VALUES('contact.email','f@zz.de');
INSERT INTO "meta" VALUES('contact.name','Florian Lohoff');

INSERT INTO meta VALUES( 'time.data', strftime('%Y-%m-%d %H:%M','now'));
INSERT INTO meta VALUES( 'time.process', strftime('%Y-%m-%d %H:%M','now'));

INSERT INTO "meta" VALUES('center.lat','51.93326');
INSERT INTO "meta" VALUES('center.lon','8.80966');
INSERT INTO "meta" VALUES('center.zoom','12');

INSERT INTO "meta" VALUES('style.default.color','#888888');
INSERT INTO "meta" VALUES('style.default.weight','3');
INSERT INTO "meta" VALUES('style.default.opacity','0.9');

INSERT INTO "meta" VALUES('style.red.color','#ff0000');
INSERT INTO "meta" VALUES('style.red.weight','3');
INSERT INTO "meta" VALUES('style.red.opacity','0.9');

INSERT INTO "meta" VALUES('style.yellow.color','#ffff00');
INSERT INTO "meta" VALUES('style.yellow.weight','3');
INSERT INTO "meta" VALUES('style.yellow.opacity','0.9');

INSERT INTO "meta" VALUES('style.green.color','#00ff00');
INSERT INTO "meta" VALUES('style.green.weight','3');
INSERT INTO "meta" VALUES('style.green.opacity','0.9');

INSERT INTO "meta" VALUES('style.cyan.color','#00d0d0');
INSERT INTO "meta" VALUES('style.cyan.weight','3');
INSERT INTO "meta" VALUES('style.cyan.opacity','0.9');

INSERT INTO "meta" VALUES('style.brown.color','#d07000');
INSERT INTO "meta" VALUES('style.brown.weight','3');
INSERT INTO "meta" VALUES('style.brown.opacity','0.9');

INSERT INTO "meta" VALUES('layer.buildingnotinosm.shortdescription','ALKIS/NAS building differences to OSM for Kreis Gütersloh');
INSERT INTO "meta" VALUES('layer.buildingnotinosm.geometrycolumn','geom');
INSERT INTO "meta" VALUES('layer.buildingnotinosm.srid','4326');
INSERT INTO "meta" VALUES('layer.buildingnotinosm.stylecolumn','style');
INSERT INTO "meta" VALUES('layer.buildingnotinosm.columns:0','nas_ogc_fid');
INSERT INTO "meta" VALUES('layer.buildingnotinosm.columns:1','text');
INSERT INTO "meta" VALUES('layer.buildingnotinosm.columns:2','style');
INSERT INTO "meta" VALUES('layer.buildingnotinosm.columns:3','gml_id');
INSERT INTO "meta" VALUES('layer.buildingnotinosm.columns:4','alkisarea');
INSERT INTO "meta" VALUES('layer.buildingnotinosm.columns:5','gebaeudefunktion');
INSERT INTO "meta" VALUES('layer.buildingnotinosm.popup', ( readfile('data/alkisdiff-meta.buildingnotinosm.popup' )) );

INSERT INTO "meta" VALUES('layer.waternotinosm.shortdescription','ALKIS/NAS water body differences to OSM for Kreis Gütersloh');
INSERT INTO "meta" VALUES('layer.waternotinosm.geometrycolumn','geom');
INSERT INTO "meta" VALUES('layer.waternotinosm.srid','4326');
INSERT INTO "meta" VALUES('layer.waternotinosm.stylecolumn','style');
INSERT INTO "meta" VALUES('layer.waternotinosm.columns:0','nas_ogc_fid');
INSERT INTO "meta" VALUES('layer.waternotinosm.columns:1','text');
INSERT INTO "meta" VALUES('layer.waternotinosm.columns:2','style');
INSERT INTO "meta" VALUES('layer.waternotinosm.columns:3','gml_id');
INSERT INTO "meta" VALUES('layer.waternotinosm.columns:4','alkisarea');
INSERT INTO "meta" VALUES('layer.waternotinosm.popup', ( readfile('data/alkisdiff-meta.waternotinosm.popup' )) );

INSERT INTO "meta" VALUES('layer.misclassified.shortdescription','ALKIS/NAS vs OSM misclassified building types for Kreis Gütersloh');
INSERT INTO "meta" VALUES('layer.misclassified.geometrycolumn','geom');
INSERT INTO "meta" VALUES('layer.misclassified.srid','4326');
INSERT INTO "meta" VALUES('layer.misclassified.stylecolumn','style');
INSERT INTO "meta" VALUES('layer.misclassified.columns:0','nas_ogc_fid');
INSERT INTO "meta" VALUES('layer.misclassified.columns:1','gml_id');
INSERT INTO "meta" VALUES('layer.misclassified.columns:2','error');
INSERT INTO "meta" VALUES('layer.misclassified.columns:3','style');
INSERT INTO "meta" VALUES('layer.misclassified.columns:4','gebaeudefunktion');
INSERT INTO "meta" VALUES('layer.misclassified.columns:5','building');
INSERT INTO "meta" VALUES('layer.misclassified.popup', ( readfile('data/alkisdiff-meta.misclassified.popup' )) );

INSERT INTO "meta" VALUES( 'boundary', ( readfile('data/kreis-guetersloh.geojson')));

COMMIT;
