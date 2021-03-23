include <../BOSL2/constants.scad>
include <../BOSL2/std.scad>
include <../BOSL2/transforms.scad>

$fn = 50;

tube_d = 12.5;
mod = 1.03;  //% larger
coupler_d = tube_d*mod*1.2;
coupler_l = 25;
middle_barrier_thickness = 4;
barrier_hole_d = 5;


difference() {
    cube([coupler_d, coupler_l, coupler_d], center=true);
    for (i = [1, -1]) {
        move([0, i*(coupler_l/4 + middle_barrier_thickness/2), 0])
        xrot(90)
            cylinder(h=coupler_l/2, d=tube_d*mod, center=true);
    }
    xrot(90)
        cylinder(h=coupler_l, d=barrier_hole_d, center=true);
}
