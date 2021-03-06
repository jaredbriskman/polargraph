// Holds a standard Expo whiteboard marker
// tapers from 16 to 17 mm

$fn=60;

// Pen holder in the middle
module holder(d1, d2, endcap)
{
render() difference()
{
	// outside
	cylinder(d=d2+4, h=20);

	// shaft
	translate([0,0,endcap ? 1 : -1])
	cylinder(d1=d1, d2=d2, h=22);

	// M3 set screw, just in case
	if(false)
	translate([0,5,5])
	rotate([-90,0,0])
	cylinder(d=3.25, h=10);

	// string holes
	translate([0,0,10]) 
	for(angle=[-60,60])
	{
		rotate([90,0,angle]) {
			translate([-3,0,0]) cylinder(d=3.25, h=20);
			translate([+3,0,0]) cylinder(d=3.25, h=20);
		}
	}
}
}

translate([-13,0,0]) holder(20,21, true);
translate([+13,0,0]) holder(18,19, false);


/*
// outer ring
render() difference()
{
	cylinder(d=100, h=2);
	translate([0,0,-1]) cylinder(d=90, h=4);
}


// spokes
for(a=[0,120,240])
rotate([0,0,a])
render() difference()
{
	translate([0,55/2,1]) cube([10,38,2], center=true);

	// mounting holes for the wires
	for(i=[20,30,40])
		translate([0,i,-1]) cylinder(d=2, h=4);
}
*/
