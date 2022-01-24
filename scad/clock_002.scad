//
// OpenSCAD 時計文字盤 002
//
$fn=100;



difference() {

    union() {
        // １２個の四角と数字
        obj12();
        // 真ん中穴埋め
        cylinder(h=4, r=15);
    };

    cylinder(h=20, r=4.2);
}






// １２個の四角と数字
module obj12() {
    size=45;
    r = 185/2;
    for (i=[1:12]) {
        c = atan((size/1.5)/r);
        rotate([0,0,-30*i-c])
            translate([0, r, 0]) {
                obj1(size, num=i);
                translate([-size/2, -r, 0])
                    linear_extrude(height = 4)
                    union() {
                        square([3,r-size]);
                        square(15);
                    }
            }
    }   
}

// 四角と数字
module obj1(size=50, w=10, offset=0, num=1) {

    linear_extrude(height = 4)
    translate([-size,-size,0])
        difference() {
            square(size);
            translate([w/2+offset, w/2+offset, 0]) square(size-w);
        }

    //color("green")
    linear_extrude(height = 4+4)
    translate([-(size-offset)/1.50, -(size-offset)/1.95,0])
    offset(delta=1)
    scale([1, 1.65, 1])
    text(str(num), size=size-w-6, halign="center", valign="center", font="Edwardian Script ITC:style=Regular", spacing=0.7);
}