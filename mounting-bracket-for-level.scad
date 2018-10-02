use <parts.scad>;

module bar(length) {
    flatBar(1/16, 1, length);
}

length = 3;
height = 3;

rotate([90, 0, 0]) {
    bar(height);
}

translate([0, -1 * length, 0]) {
    bar(length);

    rotate([90, 0, 0]) {
        bar(1);
    }
}
