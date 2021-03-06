// --- Parks, woods, other green things ---

@grass: #cdebb0; // also grassland, meadow, common, village_green, garden
@scrub: #b5e3b5;
@national-park: #c0ddb4; 
@national-park-stroke: darken(@national-park, 10%);      // Lch(80,30,135)
@forest: #d6e7d3;
@forest-stroke: darken(@forest, 10%);
@forest-text: #46673b;  // Lch(40,30,135)
@park: #c8facc;         // Lch(94,30,145)
@orchard: #aedfa3; // also vineyard, plant_nursery

// --- "Base" landuses ---

@built-up-lowzoom: #aaaaaa;
@built-up-z11: #c0c0c0;
@built-up-z12: #d0d0d0;
@residential: #e0dfdf;      // Lch(89,0,0)
@residential-line: #b9b9b9; // Lch(75,0,0)
@retail: #ffd6d1;           // Lch(89,16,30)
@retail-line: #d99c95;      // Lch(70,25,30)
@commercial: #f2dad9;       // Lch(89,8.5,25)
@commercial-line: #d1b2b0;  // Lch(75,12,25)
@industrial: #ebdbe8;       // Lch(89,9,330) (Also used for railway)
@industrial-line: #c6b3c3;  // Lch(75,11,330) (Also used for railway-line)
@farmland: #eef0d5;         // Lch(94,14,112)
@farmland-line: #c7c9ae;    // Lch(80,14,112)
@farmyard: #f5dcba;         // Lch(89,20,80)
@farmyard-line: #d1b48c;    // Lch(75,25,80)

// --- Transport ----

@transportation-area: #e9e7e2;
@apron: #e9d1ff;
@garages: #dfddce;
@parking: #eeeeee;
@parking-outline: saturate(darken(@parking, 40%), 20%);
@railway: @industrial;
@railway-line: @industrial-line;
@rest_area: #efc8c8; // also services

// --- Other ----

@allotments: #eecfb3;       // Lch(85,19,70)
@bare_ground: #eee5dc;
@campsite: #def6c0; // also caravan_site, picnic_site
@cemetery: #aacbaf; // also grave_yard
@construction: #c7c7b4; // also brownfield
@heath: #d6d99f;
@mud: rgba(203,177,154,0.3); // produces #e6dcd1 over @land
@place_of_worship: #cdccc9;
@place_of_worship_outline: #111;
@leisure: lighten(@park, 5%);
@power: darken(@industrial, 5%);
@power-line: darken(@industrial-line, 5%);
@sand: #f5e9c6;
@societal_amenities: #fbecd7;   // Lch(94,12,80)
@tourism: #734a08;
@quarry: #c5c3c3;
@military: #f55;
@beach: #fff1ba;

// --- Sports ---

@pitch: #aae0cb; // also track
@track: @pitch;
@stadium: @leisure; // also sports_centre
@golf_course: #b5e3b5;

#landcover-low-zoom[zoom < 10],
#landcover[zoom >= 10] {

  [feature = 'wetland_mud'],
  [feature = 'wetland_tidalflat'] {
    [zoom >= 9] {
      polygon-fill: @mud;
      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.3;  }
    }
  }

  [feature = 'landuse_forest'],
  [feature = 'natural_wood'] {
    [zoom >= 8] {
      polygon-fill: @forest;
      line-color: @forest-stroke;
      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.3;  }
    }
  }

  [feature = 'landuse_plantation'],
  [name = 'Plantation'] {
    [zoom >= 8] {
      polygon-fill: darken(@forest, 10%);
      line-color: darken(@forest-stroke, 10%);
      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.3;  }
    }
  }

  [feature = 'leisure_nature_reserve'],
  [boundary = 'national_park'] {
    [zoom >= 8] {
      polygon-fill: @national-park;
      line-color: @national-park-stroke;
      line-width: 3.0;
      line-offset: 0;
      line-opacity: 1;
      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.3;  }
    }
  }

  [feature = 'landuse_residential'][zoom >= 8] {
    polygon-fill: @built-up-lowzoom;
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.3;  }
  }

  [feature = 'military_danger_area'][zoom >= 9] {
    polygon-pattern-file: url('symbols/danger_red_hatch.png');
    polygon-pattern-alignment: global;
    line-color: @military;
    line-width: 2.0;
    line-offset: -1.0;
    line-opacity: 0.2;
  }

  [feature = 'landuse_farmyard'][zoom >= 10] {
    polygon-fill: @farmyard;
      [zoom >= 16] {
        line-width: 0.5;
        line-color: @farmyard-line;
        [name != ''] {
          line-width: 0.7;
        }
      }
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.3;  }
  }

  [feature = 'landuse_farmland'],
  [feature = 'landuse_greenhouse_horticulture'] {
    [zoom >= 8] {
      polygon-fill: @farmland;
      [zoom >= 16] {
        line-width: .5;
        line-color: @farmland-line;
      }
      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.3;  }
    }
  }

  [feature = 'natural_grassland'][zoom >= 8],
  [feature = 'landuse_meadow'][zoom >= 8],
  [feature = 'landuse_grass'][zoom >= 10],
  [feature = 'landuse_village_green'][zoom >= 10],
  [feature = 'leisure_common'][zoom >= 10] {
    polygon-fill: @grass;
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.3;  }
  }

  [feature = 'tourism_camp_site'],
  [feature = 'tourism_caravan_site'],
  [feature = 'tourism_picnic_site'] {
    [zoom >= 10] {
      polygon-fill: @campsite;
      [zoom >= 13] {
        line-color: saturate(darken(@campsite, 60%), 30%);
        line-width: 0.3;
      }
      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.3;  }
    }
  }

  [feature = 'landuse_quarry'][zoom >= 10] {
    polygon-fill: @quarry;
    polygon-pattern-file: url('symbols/quarry.svg');
    [zoom >= 13] {
      line-width: 0.5;
      line-color: grey;
    }
    [way_pixels >= 4]  { polygon-pattern-gamma: 0.75; }
    [way_pixels >= 64] { polygon-pattern-gamma: 0.3;  }
  }

  [feature = 'landuse_vineyard'] {
    [zoom >= 10] {
      polygon-fill: @orchard;
      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.3;  }
    }
    [zoom >= 14] {
      polygon-pattern-file: url('symbols/vineyard.png');
      polygon-pattern-alignment: global;
      [way_pixels >= 4]  { polygon-pattern-gamma: 0.75; }
      [way_pixels >= 64] { polygon-pattern-gamma: 0.3;  }
    }
  }

  [feature = 'landuse_residential'][zoom >= 10] {
    polygon-fill: @built-up-lowzoom;
    [zoom >= 11] { polygon-fill: @built-up-z11; }
    [zoom >= 12] { polygon-fill: @built-up-z12; }
    [zoom >= 13] { polygon-fill: @residential; }
    [zoom >= 16] {
      line-width: .5;
      line-color: @residential-line;
      [name != ''] {
        line-width: 0.7;
      }
    }
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.3;  }
  }

  [feature = 'man_made_works'][zoom >= 16] {
    line-width: .5;
    line-color: @industrial-line;
    [name != ''] {
      line-width: 0.7;
    }
  }

  [feature = 'landuse_railway'][zoom >= 10] {
    polygon-fill: @railway;
    [zoom >= 16][name != ''] {
      line-width: 0.7;
      line-color: @railway-line;
    }
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.3;  }
  }

  [feature = 'power_station'][zoom >= 10],
  [feature = 'power_generator'][zoom >= 10],
  [feature = 'power_sub_station'][zoom >= 13],
  [feature = 'power_substation'][zoom >= 13] {
    polygon-fill: @industrial;
    [zoom >= 15] {
      polygon-fill: @power;
    }
    [zoom >= 16] {
      line-width: 0.5;
      line-color: @power-line;
      [name != ''] {
        line-width: 0.7;
      }
    }
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.3;  }
  }

  [feature = 'landuse_brownfield'],
  [feature = 'landuse_construction'] {
    [zoom >= 10] {
      polygon-fill: @construction;
      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.3;  }
    }
  }

  [feature = 'landuse_landfill'] {
    [zoom >= 10] {
      polygon-fill: #b6b592;
      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.3;  }
    }
  }

  [feature = 'natural_bare_rock'][zoom >= 8] {
    polygon-fill: @bare_ground;
    polygon-pattern-file: url('symbols/rock_overlay.png');
    [way_pixels >= 4] {
      polygon-gamma: 0.75;
      polygon-pattern-gamma: 0.75;
    }
    [way_pixels >= 64] {
      polygon-gamma: 0.3;
      polygon-pattern-gamma: 0.3;
    }
  }

  [feature = 'natural_scree'],
  [feature = 'natural_shingle'] {
    [zoom >= 9] {
      polygon-fill: @bare_ground;
      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.3;  }
      [zoom >= 13] {
        polygon-pattern-file: url('symbols/scree_overlay.png');
        [way_pixels >= 4]  { polygon-pattern-gamma: 0.75; }
        [way_pixels >= 64] { polygon-pattern-gamma: 0.3;  }
      }
    }
  }

  [feature = 'natural_sand'][zoom >= 8] {
    polygon-fill: @sand;
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.3;  }
  }

  [feature = 'natural_heath'][zoom >= 8] {
    polygon-fill: @heath;
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.3;  }
  }

  [feature = 'natural_scrub'][zoom >= 10] {
    polygon-fill: @scrub;
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.3;  }
  }

  [feature = 'wetland_swamp'][zoom >= 8] {
    polygon-fill: @forest;
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.3;  }
  }

  [feature = 'wetland_bog'],
  [feature = 'wetland_string_bog'] {
    [zoom >= 10] {
      polygon-fill: @heath;
      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.3;  }
    }
  }

  [feature = 'wetland_wet_meadow'],
  [feature = 'wetland_fen'],
  [feature = 'wetland_marsh'] {
    [zoom >= 10] {
      polygon-fill: @grass;
      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.3;  }
    }
  }

  [feature = 'amenity_hospital'],
  [feature = 'amenity_clinic'],
  [feature = 'amenity_university'],
  [feature = 'amenity_college'],
  [feature = 'amenity_school'],
  [feature = 'amenity_kindergarten'],
  [feature = 'amenity_community_centre'],
  [feature = 'amenity_social_facility'],
  [feature = 'amenity_arts_centre'] {
    [zoom >= 10] {
      polygon-fill: @residential;
      [zoom >= 12] {
        polygon-fill: @societal_amenities;
        [zoom >= 13] {
          line-width: 0.3;
          line-color: darken(@societal_amenities, 35%);
        }
      }
      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.3;  }
    }
  }

  [feature = 'amenity_fire_station'][zoom >= 8][way_pixels > 900],
  [feature = 'amenity_police'][zoom >= 8][way_pixels > 900],
  [feature = 'amenity_fire_station'][zoom >= 13],
  [feature = 'amenity_police'][zoom >= 13] {
    polygon-fill: #F3E3DD;
    line-color: @military; 
    line-opacity: 0.24;
    line-width: 1.0; 
    line-offset: -0.5;
    [zoom >= 15] {
      line-width: 2; 
      line-offset: -1.0;
    }
  }

  [feature = 'aeroway_apron'][zoom >= 10] {
    polygon-fill: @apron;
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.3;  }
  }

  [feature = 'aeroway_aerodrome'][zoom >= 10],
  [feature = 'amenity_ferry_terminal'][zoom >= 15],
  [feature = 'amenity_bus_station'][zoom >= 15] {
    polygon-fill: @transportation-area;
    line-width: 0.2;
    line-color: saturate(darken(@transportation-area, 40%), 20%);
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.3;  }
  }

  [feature = 'natural_beach'][zoom >= 10],
  [feature = 'natural_shoal'][zoom >= 10] {
    polygon-fill: @beach;
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.3;  }
  }

  [feature = 'highway_services'],
  [feature = 'highway_rest_area'] {
    [zoom >= 10] {
      polygon-fill: @rest_area;
      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.3;  }
    }
  }

  [feature = 'railway_station'][zoom >= 10] {
    polygon-fill: @railway;
  }

}

/* man_made=cutline */
#landcover-line {
  [zoom >= 14] {
    line-width: 3;
    line-join: round;
    line-cap: square;
    line-color: @grass;
    [zoom >= 16] {
      line-width: 6;
      [zoom >= 18] {
        line-width: 12;
      }
    }
  }
}

#landcover-area-symbols {
  [natural = 'sand'][zoom >= 8] {
    polygon-pattern-file: url('symbols/beach.png');
    polygon-pattern-alignment: global;
  }
  [int_wetland != null][zoom >= 10] {
    polygon-pattern-file: url('symbols/wetland.png');
    polygon-pattern-alignment: global;
  }
  [natural = 'reef'][zoom >= 10] {
    polygon-pattern-file: url('symbols/reef.png');
    polygon-pattern-alignment: global;
  }
  [zoom >= 14] {
    [int_wetland = 'marsh'],
    [int_wetland = 'saltmarsh'],
    [int_wetland = 'wet_meadow'] {
      polygon-pattern-file: url('symbols/wetland_marsh.png');
      polygon-pattern-alignment: global;
    }
    [int_wetland = 'reedbed'] {
      polygon-pattern-file: url('symbols/wetland_reed.png');
      polygon-pattern-alignment: global;
    }
    [int_wetland = 'mangrove'] {
      polygon-pattern-file: url('symbols/wetland_mangrove.png');
      polygon-pattern-alignment: global;
    }
    [int_wetland = 'swamp'] {
      polygon-pattern-file: url('symbols/wetland_swamp.png');
      polygon-pattern-alignment: global;
    }
    [int_wetland = 'bog'],
    [int_wetland = 'fen'],
    [int_wetland = 'string_bog'] {
      polygon-pattern-file: url('symbols/wetland_bog.png');
      polygon-pattern-alignment: global;
    }
    [natural = 'beach'],
    [natural = 'shoal'] {
      [surface = 'sand'] {
        polygon-pattern-file: url('symbols/beach.png');
        polygon-pattern-alignment: global;
      }
      [surface = 'gravel'],
      [surface = 'fine_gravel'],
      [surface = 'pebbles'],
      [surface = 'pebblestone'],
      [surface = 'shingle'],
      [surface = 'stones'],
      [surface = 'shells'] {
        polygon-pattern-file: url('symbols/beach_coarse.png');
        polygon-pattern-alignment: global;
      }
    }
    [natural = 'scrub'] {
      polygon-pattern-file: url('symbols/scrub.png');
      polygon-pattern-alignment: global;
    }
  }

  //Also landuse = forest, converted in the SQL
  [natural = 'wood'][zoom >= 13]::wood {
    polygon-pattern-file: url('symbols/leaftype_unknown.svg'); // Lch(55,30,135)
    [leaf_type = "broadleaved"] { polygon-pattern-file: url('symbols/leaftype_broadleaved.svg'); }
    [leaf_type = "needleleaved"] { polygon-pattern-file: url('symbols/leaftype_needleleaved.svg'); }
    [leaf_type = "mixed"] { polygon-pattern-file: url('symbols/leaftype_mixed.svg'); }
    [leaf_type = "leafless"] { polygon-pattern-file: url('symbols/leaftype_leafless.svg'); }
    polygon-pattern-alignment: global;
    opacity: 0.4; // The entire layer has opacity to handle overlapping forests
  }
}

#landuse-overlay {
  [landuse = 'military'][zoom >= 8][way_pixels > 900],
  [landuse = 'military'][zoom >= 13] {
    polygon-pattern-file: url('symbols/military_red_hatch.png');
    polygon-pattern-alignment: global;
    line-color: @military;
    line-opacity: 0.24;
    line-width: 1.0;
    line-offset: -0.5;
    [zoom >= 15] {
      line-width: 2;
      line-offset: -1.0;
    }
  }
}

#cliffs {
  [natural = 'cliff'][zoom >= 13] {
    line-pattern-file: url('symbols/cliff.svg');
    [zoom >= 15] {
      line-pattern-file: url('symbols/cliff2.svg');
    }
  }
  [man_made = 'embankment'][zoom >= 15]::man_made {
    line-pattern-file: url('symbols/embankment.svg');
  }
}

#landcover-text {
  [feature = 'landuse_forest'][zoom >= 7][way_pixels >= 5000],
  [feature = 'natural_wood'][zoom >= 7][way_pixels >= 5000],
  [feature = 'leisure_nature_reserve'][zoom >= 7][way_pixels >= 5000],
  [boundary = 'national_park'][zoom >= 7][way_pixels >= 5000],
  [feature = 'natural_grassland'][zoom >= 7][way_pixels >= 5000],
  [feature = 'landuse_meadow'][zoom >= 7][way_pixels >= 5000] {
    text-name: "[name]";
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
    text-fill: @forest-text;
    text-size: 12;
    text-face-name: @book-fonts;
    text-placement: interior;
    text-vertical-alignment: middle;
    text-spacing: 600;
    text-wrap-width: 100;
  }
}

#text-line {
  [feature = 'natural_cliff'][zoom >= 15],
  [feature = 'man_made_embankment'][zoom >= 15] {
    text-name: "[name]";
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
    text-fill: #555;
    text-size: 10;
    text-face-name: @book-fonts;
    text-placement: line;
    text-dy: 8;
    text-vertical-alignment: middle;
    text-spacing: 400;
  }
}
