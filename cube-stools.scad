use <parts.scad>;

wallThickness = .125;
tubeDim = 1;
seatThickness = .5;

module tube(length) {
    color("grey")
    rectangularTube(tubeDim, tubeDim, length, wallThickness);
}

module cubeStool(length) {
    riserHeight = length - seatThickness - (2*tubeDim);

    // Risers
    translate([0, 0, tubeDim]) {
        tube(riserHeight);
    }
    translate([length - tubeDim, 0, tubeDim]) {
        tube(riserHeight);
    }

    translate([0, length - tubeDim, tubeDim]) {
        tube(riserHeight);
    }

    translate([length - tubeDim, length - tubeDim, tubeDim]) {
        tube(riserHeight);
    }

    // Bottom

    translate([0, 0, tubeDim]){
        rotate([-90, 0, 0]) {
            tube(length);
        }
    }
    translate([0, 0, tubeDim]){
        rotate([0, 90, 0]) {
            tube(length);
        }
    }

    translate([0, length - tubeDim, tubeDim]){
        rotate([0, 90, 0]) {
            tube(length);
        }
    }

    translate([length - tubeDim, 0, tubeDim]){
        rotate([-90, 0, 0]) {
            tube(length);
        }
    }

    // top
    topHeight = length - seatThickness;
    translate([0, 0, topHeight]) {
        translate([0, 0, 0]){
            rotate([-90, 0, 0]) {
                tube(length);
            }
        }
        translate([0, 0, 0]){
            rotate([0, 90, 0]) {
                tube(length);
            }
        }

        translate([0, length - tubeDim, 0]){
            rotate([0, 90, 0]) {
                tube(length);
            }
        }

        translate([length - tubeDim, 0, 0]){
            rotate([-90, 0, 0]) {
                tube(length);
            }
        }
    }

    // seat
    translate([ 0, 0, length - seatThickness]) {
        color("brown")
        cube([length, length, seatThickness]);
    }

}


cubeStool(24);

translate([1.5, 1.5, 0]) {
    cubeStool(21);
}

translate([3, 3, 0]) {
    cubeStool(18);
}
