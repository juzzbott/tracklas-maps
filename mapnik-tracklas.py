#!/usr/bin/env python

import mapnik
mapfile = 'tracklas_definition.xml'
map_output = 'tracklas.png'

m = mapnik.Map(1200, 1200)
mapnik.load_map(m, mapfile)

bbox = mapnik.Envelope(mapnik.Coord(140.9567,-39.69608), mapnik.Coord(150.56381,-33.9715))
m.zoom_to_box(bbox)
mapnik.render_to_file(m, map_output)