/************************************************************************

    holder.scad
    
    Renault Twizy Cup Holder
    Copyright (C) 2022 Simon Inns
    
    This is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.
    
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
    
    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
	
    Email: simon.inns@gmail.com
    
************************************************************************/

include <BOSL/constants.scad>
use <BOSL/transforms.scad>
use <BOSL/shapes.scad>

include <slot_rail.scad>

// This is the inverse shape of the interior of the cup holder
module holder_inverse()
{ 
    // Bottom 65mm ring
    hull() {
        move([0,0, -2]) cyl(h=1, d=64, center=false);
        move([0,0,10]) cyl(h=1, d=68, center=false);
    }

    // Bottom 72mm ring
    hull() {
        move([0,0,10]) cyl(h=1, d=72, center=false);
        move([0,0,23]) cyl(h=1, d=76, center=false);
    }

    // Mid-section
    hull() {
        move([0,0,23]) cyl(h=1, d=79, center=false);
        move([0,0,78]) cyl(h=1, d=90, center=false);
    }

    // Top rim
    hull() {
        move([0,0,78]) cyl(h=1, d=89.5, center=false);
        move([0,0,82]) cyl(h=4, d=95, center=false);
    }
}

module holder()
{
    hull() {
        move([0,0, 0]) cyl(h=1, d=64 + 3, center=false);
        move([0,0,19]) cyl(h=1, d=76 + 3, center=false);
    }

    hull() {
        move([0,0,19]) cyl(h=1, d=76 + 3, center=false);
        move([0,0,80]) cyl(h=1, d=91 + 3, center=false);
    }

    hull() {
        move([0,0,80]) cyl(h=1, d=89 + 3, center=false);
        move([0,0,82]) cyl(h=4, d=93 + 3, center=false);
    }
}

module cup_holder()
{
    move([0,-1,0]) difference() {
        holder();
        move([0,0,5]) holder_inverse();
        move([0,0,-1]) cyl(h=20, d=50, center = false);

        // Make a slot for a cup handle
        move([-50,0,44]) cyl(l=100, d=30, orient=ORIENT_X, center=false);
        move([0,0,69]) cuboid([100,30,50]);

        // Slot chamfer
        move([0,15,87]) xrot(45) cuboid([100,10,5]);
        move([0,-15,87]) xrot(-45) cuboid([100,10,5]);
    }
}

module render_holder()
{
    move([0,55 + 00,0]) {
        cup_holder();
        slot_rail();
    }
}