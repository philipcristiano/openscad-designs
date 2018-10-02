
use <parts.scad>;

angle = 10;
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

module mountingBrack() {
    flatBar(.125, .75, 2);
}

ladderHeight = 72;
rungLength = 18;

foot();
translate([rungLength, 0, 0]){
    foot();
}
rotate([angle, 0, 0]) {
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

    translate([-.5 * sideTubeDiameter, -.5 * sideTubeDiameter, ladderHeight -1]) {
        rotate([90 - angle, 0, 0]) {
            mountingBrack();
        }
    }

    translate([-.5 * sideTubeDiameter + rungLength, -.5 * sideTubeDiameter, ladderHeight -1]) {
        rotate([90 - angle, 0, 0]) {
            mountingBrack();
        }
    }


}
