
use <parts.scad>;

mattressLength=80;
mattressWidth=76;
bedHeight = 18;
structualHeight = 4;
structualWidth = 2;
postSize = 2;
centerOffset = (postSize - structualWidth) /2;
bedLength = mattressLength + 2* structualWidth;
siderailLength = bedLength - 2*structualWidth;
crossLength = mattressWidth + 1;
headboardHeight = 48;
footboardHeightOffGround = 6;
footboardLegHeight = bedHeight + 10 ;
footboardPanelHeight = 18;
footboardNumCrossPieces = 3;
headboardHeightOffGround = 6;
headboardPanelHeight = 36;
squaretube_size = 1;

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
    angleIron(2, 2, length, angleIronThickness);
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

module footboard() {
    // structuralTube(20);
    rotate([0, 90, 0]) {

      translate([- squaretube_size, squaretube_size, footboardHeightOffGround]) {
        rectangularTube(squaretube_size, squaretube_size, footboardPanelHeight, .08);
      }
      translate([-1*  crossLength  , squaretube_size, footboardHeightOffGround]) {
        rectangularTube(squaretube_size, squaretube_size, footboardPanelHeight, .08);
      }
      rotate([0, -90, 0]) {

        footboard_crosspiece_spacing = footboardPanelHeight / footboardNumCrossPieces;

        for ( i = [0 : footboardNumCrossPieces - 1] ){
          translate([footboardHeightOffGround + i * footboard_crosspiece_spacing, squaretube_size, squaretube_size]) {
            rectangularTube(squaretube_size, squaretube_size, crossLength - 2* squaretube_size, .08);
          }
        }
        // Top piece of the footboard
        translate([footboardHeightOffGround + footboardPanelHeight - squaretube_size, squaretube_size, squaretube_size]) {
          rectangularTube(squaretube_size, squaretube_size, crossLength - 2* squaretube_size, .08);
        }
      }
    }
}

module headboard() {
    // structuralTube(20);
    rotate([0, 90, 0]) {
      translate([- squaretube_size, 0, headboardHeightOffGround]) {
        rectangularTube(squaretube_size, squaretube_size, headboardPanelHeight, .08);
      }
      translate([-1*  crossLength  , 0, headboardHeightOffGround]) {
        rectangularTube(squaretube_size, squaretube_size, headboardPanelHeight, .08);
      }
      rotate([0, -90, 0]) {
        translate([headboardHeightOffGround, 0, squaretube_size]) {
          rectangularTube(squaretube_size, squaretube_size, crossLength - 2* squaretube_size, .08);
        }
        translate([headboardHeightOffGround + 6, 0, squaretube_size]) {
          rectangularTube(squaretube_size, squaretube_size, crossLength - 2* squaretube_size, .08);
        }
        translate([headboardHeightOffGround + 12, 0, squaretube_size]) {
          rectangularTube(squaretube_size, squaretube_size, crossLength - 2* squaretube_size, .08);
        }
        translate([headboardHeightOffGround + 18, 0, squaretube_size]) {
          rectangularTube(squaretube_size, squaretube_size, crossLength - 2* squaretube_size, .08);
        }
        translate([headboardHeightOffGround + 24, 0, squaretube_size]) {
          rectangularTube(squaretube_size, squaretube_size, crossLength - 2* squaretube_size, .08);
        }
        translate([headboardHeightOffGround + 30, 0, squaretube_size]) {
          rectangularTube(squaretube_size, squaretube_size, crossLength - 2* squaretube_size, .08);
        }
        translate([headboardHeightOffGround + headboardPanelHeight - squaretube_size, 0, squaretube_size]) {
          rectangularTube(squaretube_size, squaretube_size, crossLength - 2* squaretube_size, .08);
        }
      }
    }

}

//
// Bed design
//

// Footboard legs
postTube(footboardLegHeight);

translate([ 0, crossLength + postSize, 0 ]) {
    postTube(footboardLegHeight);
}


// Siderails
rotate([ 0, 90, 0 ]) {
    translate([ -1 * bedHeight, centerOffset, , postSize]) {
        structuralTube( siderailLength );
        translate([ structualHeight, structualWidth + .125, 0]) {
            rotate([0, 0, 90]) {
                supportLedge( siderailLength );
            }
        }

        translate([ 0, crossLength + postSize, 0 ]) {
            structuralTube(siderailLength);
            translate([structualHeight, 0, 0]) {
                rotate([0, 0, 180]) {
                    supportLedge( siderailLength );
                }
            }
        }
    }
}

// Headboard legs
translate([ siderailLength + structualWidth, 0, 0 ]) {
    postTube(headboardHeight);

    translate([ 0, crossLength + postSize, 0 ]) {
        postTube( headboardHeight);
    }
}

// Mattress

translate([ structualWidth, structualWidth + 8*angleIronThickness, bedHeight - structualHeight + angleIronThickness]){
   //mattress();
}


translate([ 0, structualWidth, 0]) {
  rotate([ 0, 270, 270 ]) {
    footboard();
  }
}

translate([ bedLength - squaretube_size, structualWidth, 0]) {
  rotate([ 0, 270, 270 ]) {
    headboard();
  }
}
