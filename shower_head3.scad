       
$fn=200;
D_ball = 24.054;
D_stem = 22.86;
D_top = 22.85;
D_ext = 28.34;
L_stem = 20.0;
L_gap = 3;
Ring_height = 3.25-1;
nudge = 1;
R_ball = D_ball/2;
R_stem = D_stem/2;
R_top = D_top/2;
R_ext = D_ext/2;

R_middle = 17.93 /2;

module shower_head_coupling()  
{ 
    translate([0,0,1])
    {
        union () 
        {
            difference()
            {
                sphere(d=D_ball);
                translate([0,0,5]) {            
                    cylinder(h=15,r=4);
                }
            }
            translate([0,0,-L_stem - 15]) {
                difference()
                {
                    cylinder(h = L_stem, r=R_stem);
                    translate([0,0, -5]) {
                        cylinder(h = L_stem+2, r= R_stem -1);
                    }
                }
            }
            translate([0,0,-L_stem +5]) {
                    cylinder(h = L_gap, r2 = R_ball/2, r1=R_stem);
            }
        }
    }
}
module coupling_ring_cylinder()
{
    union () {
        
    translate([0,0,R_ball-(D_ball/2 + Ring_height*2-1.75)]) {
        color("Red") cylinder(h = Ring_height, r = R_middle+3.7);
    };
    translate([0,0,R_ball-(D_ball/2 + Ring_height-nudge)]) {
        color("LightBlue") cylinder(h = Ring_height, r = R_ext-0.75);
    }
         
} 
}
module combined_coupling_with_ring()
{
    union()
    {
        coupling_ring_cylinder();
        shower_head_coupling();
    }
}
module just_ring()
{
    difference()
    {
        coupling_ring_cylinder();
        shower_head_coupling();
    }
}

//translate ([-50,0,Ring_height-nudge]) {
 //   shower_head_coupling();
//}

//translate ([50,0,Ring_height-nudge]) {
  //  combined_coupling_with_ring();
//}

translate ([0,0,Ring_height-nudge]) {
    just_ring();
}
