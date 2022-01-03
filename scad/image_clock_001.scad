//
// CLOCK 001 全体イメージ
//

use <clock_001.scad>
use <clock_001_swing.scad>
use <clock_swingbar.scad>


clock_001();


translate([0, -55, -10]) {
    color("Gray")
        translate([-2.5, 0, 0]) rotate([0, 90, 0]) swing_bar();

    color("Brown")
        translate([0, -100, 0]) clock_001_swing();
}
