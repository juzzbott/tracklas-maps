#! /bin/sh

# Installing fonts
echo "Installing fonts..."
#sudo apt-get install fonts-noto-cjk fonts-noto-hinted fonts-noto-unhinted fonts-hanazono ttf-unifont

# Download OSM data
echo "Downloading OSM data..."
#curl -O http://download.geofabrik.de/australia-oceania/australia-latest.osm.pbf
echo "OSM download complete."

echo "Importing OSM data..."
#osm2pgsql -G --hstore --style openstreetmap-carto.style --tag-transform-script openstreetmap-carto.lua -d gis ./australia-latest.osm.pbf
echo "OSM data import complete."

echo "Downloading base shapefiles..."
python ./scripts/get-shapefiles.py
echo "Downloading base shapefiles complete."

echo "Generating shields..."
python ./scripts/generate_shields.py
echo "Generating shields complete."

echo "Generating road colours..."
python ./scripts/generate_road_colours.py
echo "Generating road colours complete."

#echo "Checking if database exists..."
#if psql -lqt | cut -d \| -f 1 | grep -qw tracklas; then
#    # database exists
#    echo "'gis' database exists. Moving on."
#else
#    # ruh-roh
#    echo "'gis' database does not exist. Creating now..."
#    sudo -u postgres createuser -s $USER
#    createdb gis
#    psql -d gis -c 'CREATE EXTENSION postgis; CREATE EXTENSION hstore;'
#fi