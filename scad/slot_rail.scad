/************************************************************************

    slot_rail.scad
    
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

module slot_rail()
{
    move([-15,-55.25,0]) xrot(4) {
        difference() {
            union() {
                // Slider recess
                he=90;
                move([15,10,he/2]) rotate([90,0,0]) prismoid(size1=[24.5,he], size2=[19.5,he], h=4.5);
                
                // Joiner to main cup holder
                move([15,12,he/2 + 6.5]) {
                    move([0,0,2]) cuboid([10,5,60]);
                    move([5,-2.5,-28]) rotate([180,90,-90]) right_triangle([5, 10, 5]);
                }

                // Locking point recess
                move([15,4.5,80]) cyl(l=3, d=6, chamfer1=1, orient=ORIENT_Y, center=false);
            }
            
            move([0,5,5]) zrot(90) move([0,-30,0]) right_triangle([7, 30, 7]);
            move([15,6,1]) cuboid([32,10,15]);
        }        
    }

    // Support for base of rail
    difference() {
        move([-15,-55.25,0]) xrot(4) {
            move([2.5,8.5,-2]) cuboid([25,1.5,10], center=false);

            // Struts
            for (xpos=[0: 3: 3*8]) {
                move([xpos + 2.75,8.5,8]) cuboid([0.8,1.5,0.5], center=false); 
            }

            move([3.5,8.5,8]) zrot(28) cuboid([0.8,1.5,0.5], center=false);
            move([26.25,8.5,8]) zrot(-28) cuboid([0.8,1.5,0.5], center=false);
        }

        move([-15,-53,-2]) cuboid([30,10,2], center=false);
    }
}