@water-color: #aad3df;
@land-color: #f2efe9;

@admin-boundaries: #ac46ac;

@standard-halo-radius: 1;
@standard-halo-fill: rgba(255,255,255,0.6);


Map {
  background-color: @water-color;
}

#necountries {
  [zoom >= 1][zoom < 4] {
    line-width: 0.2;
    [zoom >= 2] {
      line-width: 0.3;
    }
    [zoom >= 3] {
      line-width: 0.4;
    }
    line-color: @admin-boundaries;
  }
}

#world {
  [zoom >= 0][zoom < 10] {
    polygon-fill: @land-color;
    polygon-simplify: 0.4;
    [zoom < 8] {
      line-color: darken(@water-color,20%);
      line-simplify: 0.4;
      line-width: 0.5;
    }
  }
}

#coast-poly {
  [zoom >= 10] {
    polygon-fill: @land-color;
  }
}
