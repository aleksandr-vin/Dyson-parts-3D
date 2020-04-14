//
// Dyson V8 Ring
//

$fa=1;
$fs=0.4;
$fn=100;

dia = 20;
width = 0.7;
height = 7.5;
cap_conn = 0.4;
cap_height = 4.0;

module main() {
     rotate_extrude()
          translate([dia/2-width,0,0])
          polygon([[0.0,0.0],
                   [0.0,4.0],
                   [0.2,5.5],
                   [0.0,5.5],
                   [0.0,6.9],
                   [0.5,height],
                   [width,height],
                   [width,cap_conn],
                   [2.5,cap_height],
                   [2.9,cap_height],
                   [1.0,0.0],
                   [0.0,0.0]
                       ]);
}

module cuts() {
     extension = 1.01;
     cut_width = 0.2;
     cut_height = height-1.5*cap_conn;
     translate([0,0,height-cut_height])
          for(i = [0:10:360]) {
               rotate(i)
                    cube([cut_width,extension*dia/2,extension*cut_height]);
          }
}

difference() {
     main();
     cuts();
}
