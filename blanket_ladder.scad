
use <parts.scad>;

angle = 5;
sideTubeDiameter = .75;

module side(length) {
    circularBar(sideTubeDiameter, length);
    echo("Side - Diameter: ", sideTubeDiameter, " Length: ", length);
}

module rung(length) {
    circularBar(.375, length);
    echo("Rung - Diameter: ", .375, " Length: ", length);
}

module foot() {
    circularBar(1.5, .125);
    echo("Foot - Diameter: ", 1.5, " Length: ", .125);
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
