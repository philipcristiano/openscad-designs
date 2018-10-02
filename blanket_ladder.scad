
use <parts.scad>;

sideTubeDiameter = .75;

module side(length) {
    circularBar(sideTubeDiameter, length);
}

module rung(length) {
    circularBar(.375, length);
}

module foot() {
    circularBar(1.5, .25);
}

ladderHeight = 72;
rungLength = 18;

foot();
translate([rungLength, 0, 0]){
    foot();
}
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
