/*
 * Copyright (c) 2021 Wouter Symons
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, version 3.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */
include <bevelledText.scad>

//Parameters
tube_d = 12;
tolerance = 0.3;
length = 70;
wall_thickness = 3;
side_text = "Messor Barbarus";
text_size = 6;
text_protrusion = 1;

$fn = 50;


cover_inside_r = (tube_d + tolerance)/2;
cover_outside_w = (cover_inside_r*2) + (2*wall_thickness);

module round_off(width = 10, length=100) {
    difference(){
        cube([width, width, length+0.001],center=true);
        translate([width/2, 0, 0])
            cylinder(h=length+0.01, r=width/2, center=true);
    }

}

//TODO: use parameters
module cover(cover_outside_w, cover_inside_r, length, side_text, text_size){
    color("blue") difference(){
        cube([cover_outside_w, cover_outside_w, length], center=true);
        translate([-cover_outside_w/2, 0, 0])
            round_off(cover_outside_w+0.01, length);
        cylinder(h=length+0.01, r=cover_inside_r, center=true);
    }

    //Text
    translate([cover_outside_w/2.5, cover_outside_w/2 - text_protrusion/2-0.001, length/2.25])
        resize([0, text_protrusion, length*0.9])
        rotate([0, 90, 90])
                color("red") bevelled2D(1, 0.3, 0.1, 0.8)
                    text(side_text, size=text_size, font="Freshman:style=Normal");
        translate([cover_outside_w/2.5, -cover_outside_w/2 + text_protrusion/2+0.001, -length/2.25])
        resize([0, text_protrusion, length*0.9])
            rotate([180, -90, -90])
                    color("red") bevelled2D(1, 0.3, 0.1, 0.8)
                        text(side_text, size=text_size, font="Freshman:style=Normal");
}

rotate([0, 90, 0])
cover(cover_outside_w, cover_inside_r, length, side_text, text_size);


