include <../BOSL2/constants.scad>
include <../BOSL2/std.scad>
include <../BOSL2/transforms.scad>

$fn = 50;

tube1_d = 12.5;
tube2_d = 12.5;
mod = 1.04;  //end % larger
coupler_l = 25;

coupler_d = max(tube1_d, tube2_d)*mod*1.2;
middle_barrier_thickness = 4;
barrier_hole_d = 5;


difference() {
    cube([coupler_d, coupler_l, coupler_d], center=true);
    move([0, (coupler_l/4 + middle_barrier_thickness/2), 0])
        ycyl(h=coupler_l/2, d1=tube1_d, d2=tube1_d*mod);
    move([0, -(coupler_l/4 + middle_barrier_thickness/2), 0])
    zrot(180)
        ycyl(h=coupler_l/2, d1=tube2_d, d2=tube2_d*mod);
    xrot(90)
        cylinder(h=coupler_l, d=barrier_hole_d, center=true);
}
