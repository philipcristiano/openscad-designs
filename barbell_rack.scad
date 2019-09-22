use <parts.scad>;

height = 24;
shelfLength = 2;
barThickness = .125;
mountSpacing = 4;
mountLength = 3;
mountDepth = .5;
holderLength = 2;
holderSpacing = 5;


module rack_bar() {
    rectangularTube(1, 1, height);

    for( height = [ 0:holderSpacing:height -1 ]) {
        translate([0, 0, height]) {
            translate([0, 0, 0]) {
                rotate([60, 0, 0]) {
                    rectangularTube(1, 1, holderLength);
                }
            }
        }
    }

    translate([0, mountDepth, mountSpacing]) {
        rectangularTube(1,1,1);
        translate([2, 1, 1]) {
            rotate([0, 90, 90]) {
                flatBar(barThickness, 1, mountLength);
            }
        }
    }

    translate([0, mountDepth, height - mountSpacing]) {
        rectangularTube(1,1,1);
        translate([2, 1, 1]) {
            rotate([0, 90, 90]) {
                flatBar(barThickness, 1, mountLength);
            }
        }
    }
}



translate([12, 0, ,0]) {
    rack_bar();
}
rack_bar();
