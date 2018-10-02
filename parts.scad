
module rectangularTube(height, width, length, thickness) {
    difference()
    {
        cube([height, width, length]);
        // Ensure the inside sticks out a bit more to avoid clipping
        translate([thickness, thickness, -1]) {
            cube([height - 2*thickness, width - 2*thickness, length+2]);
        };
    }
};

module angleIron(height, width, length, thickness) {
    union()
    {
        cube([height, thickness, length]);
        rotate([0, -90, 0]) {
            translate([0, 0, -1 * thickness]) {
                cube([length, width, thickness]);
            }
        }
    }
}

module circularTube(outer, thickness, length) {
    outerRadius = outer / 2;
    innerRadius = outerRadius - thickness;
    difference() {
        cylinder(length, outerRadius, outerRadius, $fn=32);
        // Ensure the inside sticks out a bit more to avoid clipping
        translate([0, 0, -1]) {
            cylinder(length + 2, innerRadius, innerRadius, $fn=32);
        }
    }

}

module flatBar(thickness, width, length) {
    cube([width, length, thickness]);
}


rectangularTube(4, 4, 12, .25);

translate([ 10, 0, 0]) {
    angleIron( 4, 4, 12, .25);
}

translate([ 22, 2, 0]) {
    circularTube(4, .25, 12);
}

translate([ 30, 0, 0]) {
    rotate([90, 0, 0]) {
        flatBar(.25, 4, 12);
    }
}

