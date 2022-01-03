//
// 振り子の棒の部分
//
$fn = 100;

swing_bar();


module swing_bar(
    l = 100,    // 棒の長さ
    w = 5,      // 棒の幅
    t=1.2,      // 厚み
    d=2,        // ひっかける部分の内側厚み
    l2=6,       // ひっかける部分の長さ
    angle=8,    // ひっかける部分の角度
) {
    linear_extrude(height = w) {
        translate([-t,-l,0]) square([t,l]);
        translate([-t,0,0]) square([t+d,t]);
        translate([d,0,0]) rotate([0,0,angle]) translate([0,-l2,0]) square([t,l2]);
        translate([d,0,0]) difference() { circle(r=t); translate([-t,-t,0]) square([t*2, t]);}
    }
}
