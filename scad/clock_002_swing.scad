//
// CLOCK 002 用　振り子オーナメント
//

clock_002_swing();

size=45;
w=10;


module clock_002_swing(size=45, w=10) {

    difference() {

        translate([-size/2, -size+w/2, 0])
        linear_extrude(4)
        difference() {
            square(size);
            translate([w/2,w/2,0])
                square(size-w);
        }

        translate([-5.6/2, 0, 0]) cube([5.6,50,2]);
    }

}