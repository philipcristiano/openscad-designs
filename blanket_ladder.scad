
use <parts.scad>;

module side(length) {
    tube(.75, .065, length);
}

module rung(length) {
    tube(.375, .065, length);
}

ladderHeight = 72;
rungLength = 18;

rotate([10, 0, 0]) {
    side(ladderHeight);
    translate([rungLength, 0, 0]) {
        side(ladderHeight);
    }

    for( height = [ 24:12:ladderHeight -1 ]) {
        translate([0, 0, height]) {
            rotate([0, 90, 0]) {
                rung( rungLength );
            }
        }
    }
}
