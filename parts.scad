
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

module sheet(width, length, thickness) {
    cube([width, length, thickness]);
}

module circularBar(diameter, length) {
        cylinder(h=length, r1=diameter/2, r2=diameter/2, $fn=32);
}

module flatBar(thickness, width, length) {
    cube([width, length, thickness]);
}

module perforatedPlate(length, width, thickness, holeSize, holeSpacing) {
    radius = holeSize / 2;
    difference() {
        cube([length, width, thickness]);
        for( x = [ 0:holeSpacing:length ] ) {
            for ( y = [ 0:holeSpacing:width ]){
                translate([x, y, 0]){
                    cylinder( thickness*10 , radius, radius, $fn=32, center=true) ;
                }
            }
        }
    }
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

translate([ 40, 2, 0]) {
    circularBar(4, 12);
}

translate([ 50, 0, 0]) {
    rotate([270, 270, 0]) perforatedPlate(12, 6, .036, .067, .5);
}

translate([ 60, 0, 0]) {
    rotate([270, 270, 0]) sheet( 10, 10, .125 );
}
