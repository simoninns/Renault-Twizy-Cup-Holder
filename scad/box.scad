/************************************************************************

    box.scad
    
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

module box_body()
{
    move([0,-4,0.5]) {
        difference() {
            // Outer perimeter of box
            hull() {
                move([0,0,100]) cuboid([200,90,1], fillet=10, edges=EDGES_Z_ALL);
                move([0,0,  0]) cuboid([150,75,1], fillet=10, edges=EDGES_Z_ALL);
            }

            // Inner perimeter of box
            hull() {
                move([0,0,102]) cuboid([200 - 4,90 - 4,1], fillet=8, edges=EDGES_Z_ALL);
                move([0,0,  2]) cuboid([150 - 4,75 - 4,1], fillet=8, edges=EDGES_Z_ALL);
            }

            // Holes for drainage
            for (xpos=[0: 10: 120]) {
                move([xpos - 60,0,0]) cyl(h=10, d=5);
            }
        }
    }

    
}

module box_dividers()
{
    move([0,-4,0.5]) {
        hull() {
            move([75/2 - 2.5,0, 60]) cuboid([2,84,1]);
            move([75/2 - 2.5,0,  0]) cuboid([2,75,1]);
        }
    }
}

module render_box()
{
    move([0,55 + 00,0]) {
        box_body();
        box_dividers();
        slot_rail();
    }
}