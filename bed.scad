
use <parts.scad>;

mattressLength=80;
mattressWidth=76;
bedHeight = 18;
structualHeight = 2;
structualWidth = 1;
postSize = 2;
centerOffset = (postSize - structualWidth) /2;
bedLength = mattressLength + 2* structualHeight;
siderailLength = bedLength - 2*structualHeight;
crossLength = 78;
headboardHeight = 48;
footboardHeight = bedHeight +10 ;
clearance = 6;

angleIronThickness = .125;

numPostTubes = 0;

// Structual members
module structuralTube(length) {
    color("grey")
    rectangularTube(structualHeight, structualWidth, length, .125);
}

module postTube(length) {
    color("grey")
    rectangularTube(postSize, postSize, length, .125);
}

module supportLedge(length) {
    angleIron(1, 1, length, angleIronThickness);
}

module crossrail() {
    structuralTube( crossLength - postSize);
}

module woodPanel(x, y, z) {
    color("brown")
    cube([x, y, z]);
}

module mattress() {
    color("white")
    cube([ mattressLength, mattressWidth, 12 ]);
}

//
// Bed design
//

// Footboard legs
postTube(footboardHeight);

translate([ 0, crossLength, 0 ]) {
    postTube(footboardHeight);
}


// Footboard
footboardSupportLength = footboardHeight - clearance - structualHeight;

translate([ structualWidth + centerOffset, postSize, footboardHeight ]) {
    rotate([ -90, 90, 0 ]) {
        crossrail();
    }


}
translate([ structualWidth - centerOffset, postSize, clearance]){
    woodPanel(.5, crossLength - postSize, footboardHeight - structualHeight - clearance);
}

translate([ structualWidth + centerOffset, postSize, clearance ]) {
    rotate([ -90, 90, 0 ]) {
        crossrail();
    }

    translate([ -0.5 * structualWidth, 0, 0]) {
        supportLedge(footboardSupportLength);
    }
    translate([ 0, crossLength - structualWidth * 2 - 2* angleIronThickness, 0] ) {
        rotate([ 0, 0, 270 ]) {
            supportLedge( footboardSupportLength );
        }
    }
}

// Siderails
rotate([ 0, 90, 0 ]) {
    translate([ -1 * bedHeight, centerOffset, ,structualHeight]) {
        structuralTube( siderailLength );
        translate([ structualHeight, structualWidth + .125, 0]) {
            rotate([0, 0, 90]) {
                supportLedge( siderailLength );
            }
        }

        translate([ 0, crossLength, 0 ]) {
            structuralTube(siderailLength);
            translate([structualHeight, 0, 0]) {
                rotate([0, 0, 180]) {
                    supportLedge( siderailLength );
                }
            }
        }
    }
    translate([ -1 * clearance, centerOffset, ,structualHeight]) {
        structuralTube( siderailLength );

        translate([ 0, crossLength, 0 ]) {
            structuralTube(siderailLength);
        }
    }
}

// Headboard
translate([ bedLength - centerOffset, postSize, bedHeight ]) {
    rotate([ -90, 90, 0 ]) {
        crossrail();
    }
    translate([ -1 * centerOffset, 0, 0] ){
        woodPanel(.5, crossLength - postSize, headboardHeight - bedHeight - structualWidth);
    }
}

headboardSupportLength = headboardHeight - bedHeight - structualHeight;

translate([ bedLength - centerOffset - angleIronThickness, postSize, bedHeight]) {
    supportLedge( headboardSupportLength );
    translate([ 0, crossLength - structualWidth * 2 - 2* angleIronThickness, 0] ) {
        rotate([ 0, 0, 270 ]) {
            supportLedge( headboardSupportLength );
        }
    }

}

translate([ bedLength - centerOffset, postSize, headboardHeight]) {
    rotate([ -90, 90, 0 ]) {
        crossrail();
    }
}

translate([ bedLength - centerOffset, postSize, clearance]) {
    rotate([ -90, 90, 0 ]) {
        crossrail();
    }
}

// Headboard legs
translate([ 82, 0, 0 ]) {
    postTube(headboardHeight);

    translate([ 0, crossLength, 0 ]) {
        postTube( headboardHeight);
    }
}

// Mattress

translate([ structualHeight, structualWidth + 8*angleIronThickness, bedHeight - structualHeight + angleIronThickness]){
    mattress();
}
