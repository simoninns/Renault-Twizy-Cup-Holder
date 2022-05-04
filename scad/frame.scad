/************************************************************************

    frame.scad
    
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

module frame_slider()
{
    move([-15,0,0]) xrot(4) {
        difference() {
            union() {
                cuboid([30,5,150], center=false, chamfer=1, edges=EDGES_Y_ALL+EDGES_Z_FR);
                move([0,5,0]) cuboid([30,7,90], center=false, chamfer=1, edges=EDGES_Y_BOT+EDGES_Z_BK+EDGE_BOT_BK);

                // Slop the top of the slot by 45 degrees
                move([0,5,90]) zrot(90) move([0,-30,0]) right_triangle([7, 30, 7]);
            }

            // Chamfer the edges of the sloping top
            move([0,0,82]) {
                move([-0.25, 10.75,0]) zrot(45) cuboid([2,2,10], center=false);
                move([0.25 + 30, 10.75,0]) zrot(45) cuboid([2,2,10], center=false);
            }

            // Slider recess
            move([15,10,(145/2) + 10]) rotate([90,0,0]) prismoid(size1=[25,155], size2=[20,155], h=4.99);
            move([15,12,(145/2) + 10]) cuboid([20,5,155]);

            // Locking point recess
            move([15,3.5,80]) cyl(l=10, d=6, chamfer1=1.5, orient=ORIENT_Y, center=false);
            move([15,5.5,94]) cuboid([6,3,30], chamfer=1.5);
        }

        // Catch
        difference() {
            move([15,1.75,83.5]) cuboid([7,6,3], chamfer=1);
            move([15,0.5,84]) cuboid([8,6,5]);
        }

        // Slope the base of the slot
        difference() {
            move([0,5,4.5]) zrot(90) move([0,-30,0]) right_triangle([7, 30, 7]);

            move([0,0,4]) {
                move([-0.25, 10.75,0]) zrot(45) cuboid([2,2,10], center=false);
                move([0.25 + 30, 10.75,0]) zrot(45) cuboid([2,2,10], center=false);
            }
        }
    }
}

module frame_top()
{
    // Top
    move([-20,-55,144.75]) cuboid([40,49.9,5], center=false, chamfer=2.5, edges=EDGES_TOP+EDGE_FR_LF+EDGE_FR_RT); 
}

module render_frame()
{
    difference() {
        union() {
            frame_top();
            frame_slider();
        }

        // Chop and shape the top to make sure the chair can slide over it
        // (and make it look nice)
        move([-25,-55,149.751]) cuboid([50,60,5], center=false); 
        move([-25,-29,168.5]) xrot(-45) cuboid([50,60,5], center=false); 
        move([-25,-19.5,168.5]) xrot(-60) cuboid([50,60,5], center=false); 

        // Trim the outside corners
        move([24,-8,147]) zrot(39) cuboid([10,30,10]);
        move([-24,-8,147]) zrot(-39) cuboid([10,30,10]); 
    }

      
}