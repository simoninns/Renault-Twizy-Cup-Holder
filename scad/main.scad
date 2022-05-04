/************************************************************************

    main.scad
    
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

include <holder.scad>
include <frame.scad>
include <box.scad>

// Rendering resolution
$fn=80;

// Select what to render:
display_frame = "No"; // [Yes, No]
display_holder = "No"; // [Yes, No]
display_box = "No"; // [Yes, No]

// Render the required items
module main()
{
    // Display selections
    d_frame = (display_frame == "Yes") ? true:false;
    d_holder = (display_holder == "Yes") ? true:false;
    d_box = (display_box == "Yes") ? true:false;

    // Render
    if (d_frame) render_frame();
    if (d_holder) render_holder();
    if (d_box) render_box();
}

main();