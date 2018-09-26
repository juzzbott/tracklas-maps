#poi {
  [tourism = 'camp_site'] {
    point-file: url(symbols/map_icons/tourism/tents.png);
    point-allow-overlap: true;
  }
  [tourism = 'hut'],
  [tourism = 'alpine_hut'],
  [tourism = 'wilderness_hut'] {
    point-file: url(symbols/map_icons/tourism/hut.png);
    point-allow-overlap: true;
  }
  [tourism = 'caravan_park'],
  [tourism = 'caravan_site'] {
    point-file: url(symbols/map_icons/tourism/camping-2.png);
    point-allow-overlap: true;
  }
  [tourism = 'picnic_site'],
  [tourism = 'picnic_table'] {
    point-file: url(symbols/map_icons/tourism/picnic-2.png);
    point-allow-overlap: true;
  }
  [tourism = 'waterfall'] {
    point-file: url(symbols/map_icons/nature/waterfall-2.png);
    point-allow-overlap: true;
  }
}  

#poi-text {
  text-name: "[name]";
  text-halo-radius: @standard-halo-radius;
  text-halo-fill: @standard-halo-fill;
  text-fill: #555;
  text-size: 12;
  text-face-name: @book-fonts;
  text-placement: point;
  text-dy: 38;
  text-vertical-alignment: middle;
  text-spacing: 400;
  text-wrap-width: 100;
  point-allow-overlap: true;
}