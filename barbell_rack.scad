use <parts.scad>;

height = 36;
shelfLength = 2;

module rack_bar() {
    rectangularTube(2, 1, height);

    for( height = [ 0:8:height -1 ]) {
        translate([0, 0, height]) {
            rotate([90, 0, 0]) {
                rectangularTube(2, 1, 3);
            }

            rotate([90, 0, 0]) {
                rectangularTube(2, 1, 3);
            }
            translate([0, (1 + shelfLength) * -1, 0]) {
                rotate([45, 0, 0]) {
                    rectangularTube(2, 1, 3);
                }
            }
        }
    }
}



translate([48, 0, ,0]) {
    rack_bar();
}
rack_bar();
