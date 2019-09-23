use <parts.scad>;


window_width = 26;
shelf_offset_from_window = 3;
shelf_width = window_width -  (2 * shelf_offset_from_window );
shelf_depth = 6;
bracket_width = 1;
bracket_length = 3;
square_tube_width = 0.5;



module wallBracket() {

  flatBar(.08, bracket_width, bracket_length);

}


module shelf() {

  rectangularTube(square_tube_width, square_tube_width,  shelf_width, .08);
  translate([shelf_depth - square_tube_width, 0, 0]) {
    rectangularTube(square_tube_width, square_tube_width,  shelf_width, .08);
  }
  translate([0, 0, square_tube_width]) {
    rotate([0, 90, 0]) rectangularTube(square_tube_width, square_tube_width,  shelf_depth, .08);
  }
  translate([0, 0, shelf_width]) {
    rotate([0, 90, 0]) rectangularTube(square_tube_width, square_tube_width,  shelf_depth, .08);
  }

}


rotate([ 90, 0, 0 ]) {


  wallBracket();

  translate([ shelf_offset_from_window + bracket_width, (bracket_length /2) - .5 * square_tube_width, 0]) {
    rotate([ 0, 90, 0] ){
      shelf();
    }
  }
  translate([ window_width + bracket_width , 0, 0 ]) {
    wallBracket();
  }

}

