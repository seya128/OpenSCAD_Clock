//
// OpenSCAD 時計文字盤 001
//
$fn=200;

clock_001();




// clock 001
module clock_001(face_r = 180/2) {
    difference() {
        clock_face(face_r =face_r);
        cylinder(h=20, r=4.2);
    }
}

// 盤面
module clock_face(face_r=180/2)
{
    hourText12_under(r=face_r, h=4, w=10);//

    translate([0,0,4]) {
        hourText12(size=15,r=face_r); // 時間数字１２時間分
    }

    triangle_frame(h=face_r, w=50);

}








//===================================
// フレーム
//===================================

// 三角フレームの真ん中(n=1~4)
module triangle_frame_center(h=190, w=100, n=4) {
    linear_extrude(height=4) {
        for (i=[1:12]) {
            intersection_for(j=[0:n-1]) {
                rotate([0,0,-30*(i+j)]){ triangle1(h=h, w=w, scale=1.0);}   
            }
        }
    }
}

// 三角のフレーム
module triangle_frame(h=190, w=100) {
    for (i=[1:12]) {
        rotate([0,0,-30*i]) {
            linear_extrude(height=4) {
                difference() {
                    triangle1(h=h, w=w, scale=1.0);
                    triangle2(h=h, w=w, scale=0.8);
                }
            }
        }
    }
}

// 三角(2D一つ)
module triangle1(h=180, w=100, scale=1.0) {
    polygon([[0,h*scale],[-w*scale/2,(h-h*scale)/1],[w*scale/2,(h-h*scale)/2]]);
}

module triangle2(h=180, w=100, scale=1.0) {
    polygon([[0,h*scale],[-w/1.95,(h-h*scale)/3],[w*scale/2,(h-h*scale)/3]]);
}


//===================================
// 時間の数字の下敷き
//===================================

module hourText12_under(r=190, h=4, w=20) {
    for (i=[1:12]) {
        rotate([0,0,i*-30]) {
            translate([0,r,0]) {
                linear_extrude(height = h) {
                    circle( w);
                }
            }
        }
    }
}



//===================================
// 時間の数字
//===================================


// 時間数字１２時間分
module hourText12(r=190, h=4, size=30) {
    for (i=[1:12]) {
        hourText(str(i), r=r, h=h, angle=i*-30, size=size);
    }
}

// 時間数字表示(1つ)
module hourText(text="1", r=100, h=4, angle=0, size=20) {
    rotate([0,0,angle]) {
        translate([0,r,0]) {
            rotate([0,0,-angle]) {  // 文字の向きを修正
                linear_extrude(height = h) {
                    text(text, size=size, font="Arial:style=Black", halign="center", valign="center");
                }
            }
        }
    }
}
