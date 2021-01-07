/*
 * File: main.scad
 * Copyright (c) 2021 Mihail Korkin <korkin_mv@protonmail.ch>
 * License: MIT
*/

stand_upside_radius = 120/2;
stand_height = 5;

led_length = 75;
led_width = 8;

lamp_thickness = 5;
lamp_height = 200;
lamp_width = led_width * 2.5;
lamp_round_height = 20;
lamp_wire_radius = 5/2;

module kch07pl_lamp() {
    $fn=18;
    t=lamp_thickness;
    x=stand_upside_radius+led_length/2;
    y=lamp_height;
    z=lamp_width;
    rh=lamp_round_height;
    wr=lamp_wire_radius;
    
    difference() {
        linear_extrude(z, center = true) {
            polygon([
                [t, 0],
                [t, y-rh],
                [rh+t, y],
                [x+t, y],
                [x+t, y+t],
                [rh, y+t],
                [0, y-rh+t],
                [0, 0]
            ]);
        }
        
        translate([0,y-wr,0]) rotate([0, 90, 0])
            cylinder(h=x+t, r=wr);
    }
}

module kch07pl_lamp_normal() {
    ur = stand_upside_radius;
    
    translate([0, ur-3, -0.001])
        rotate([90, 0, -90])
            kch07pl_lamp();
}

module kch07pl_stand() {
    $fa=5;
    
    ur = stand_upside_radius;
    h = stand_height;
    
    difference() {
        rotate_extrude() {
            polygon(points = [
                [0, 0],
                [ur+h, 0],
                [ur, h],
                [0, h]
            ]);
        }
        
        kch07pl_lamp_normal();
    }
}

module kch07pl() {
    kch07pl_stand();
    kch07pl_lamp_normal();
}

kch07pl();