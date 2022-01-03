//
// CLOCK 001 用　振り子オーナメント
//

use <clock_001.scad>
clock_001_swing();

module clock_001_swing(scale = 50/180) {

    difference() {
        scale([scale, scale, 1])
            triangle_frame(h=180/2, w=50);

        translate([-5.6/2, 0, 0]) cube([5.6,50,2]);
    }

}