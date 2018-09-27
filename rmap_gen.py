import os
import sqlite3
import time

filename = 'TracklasVic.sqlitedb'
zoomLevels = []

def generate_mbtiles():

    # If the sqlite db exists, then delete it
    if os.path.isfile(filename):
        os.remove(filename)

    # Connecting to the database file
    conn = sqlite3.connect(filename)
    c = conn.cursor()

    # Create the metadata table
    c.execute('CREATE TABLE info (minzoom int, maxzoom int)')
    conn.commit()

    # Create the metadata table
    c.execute('CREATE TABLE IF NOT EXISTS android_metadata (locale TEXT)')
    conn.commit()
    c.execute('INSERT INTO android_metadata VALUES (\'en_AU\')')
    conn.commit()

    # Create the metadata table
    c.execute('CREATE TABLE IF NOT EXISTS tiles (x int, y int, z int, s int, image blob, PRIMARY KEY (x,y,z,s))')
    conn.commit()
    c.execute('CREATE INDEX IF NOT EXISTS IND on tiles (x,y,z,s)')
    conn.commit()

    # Loop through each initial folder. Each folder is a zoom level
    for zoomLevel in os.listdir('.'):
        if os.path.isdir(os.path.join('.', zoomLevel)):
            processZoomLevel(zoomLevel, conn, c)

    # Insert the metadata
    minZoom = min(zoomLevels)
    maxZoom = max(zoomLevels)
    print ('zoomLevels: {0}'.format(zoomLevels))
    print ('minZoom: {0}'.format(minZoom))
    print ('maxZoom: {0}'.format(maxZoom))
    c.execute('INSERT INTO info (minzoom, maxzoom) VALUES (?, ?)', (minZoom, maxZoom))
    conn.commit()

    # Committing changes and closing the connection to the database file
    conn.commit()
    conn.close()

def processZoomLevel(zoomLevel, conn, cur):
    print ('Processing zoom level: {0}'.format(zoomLevel))

    zoomPath = os.path.join('.', zoomLevel)

    # RMap has zoom as reverse order, so 17 - zoom is actual zoom level.
    zoom = (17-int(zoomLevel))
    zoomLevels.append(zoom)

    # Loop through each 'x' folder. Each folder is an 'x' value
    for xVal in os.listdir(zoomPath):
        xValPath = os.path.join(zoomPath, xVal)
        if os.path.isdir(xValPath):
            
            print ('Processing column: {0}'.format(xVal))

            for yValName in os.listdir(xValPath):
                yValPath = os.path.join(xValPath, yValName)
                if yValName.endswith('.png'):
                    yVal = yValName.replace('.png', '')

                    with open(yValPath, 'rb') as f:
                        pngblob = f.read()
                        #print(sqlite3.Binary(pngblob))
                        #quit()

                        cur.execute('INSERT INTO tiles (x, y, z, s, image) VALUES (?, ?, ?, 0, ?)', (xVal, yVal, zoom, sqlite3.Binary(pngblob)))
                        conn.commit()


if __name__ == '__main__':
    generate_mbtiles()