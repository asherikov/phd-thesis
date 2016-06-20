import graph3;
import solids;
import fontsize;

usepackage("../Styles/mymath");
usepackage("../Styles/mynotation");

//=======================
// General
//=======================
size(0,8cm,Aspect);
currentprojection=orthographic(-1,-1,0.8);
limits((0,0,0),(10,10,10));
defaultpen(fontsize(10));

//=======================
// Variables
//=======================
real r=1;
real h=5;



//=======================
// Draw
//=======================

triple vertex1 = (3,2,0);
triple vertex2 = (-3,2,0);
triple vertex3 = (-3,-2,0);
triple vertex4 = (3,-2,0);

path3 p=(0,0,0)--(r,0,h);
revolution a=revolution(p,Z);
draw(shift(vertex1)*surface(a),lightblue+opacity(0.2));
draw(shift(vertex2)*surface(a),lightblue+opacity(0.2));
draw(shift(vertex3)*surface(a),lightblue+opacity(0.2));
draw(shift(vertex4)*surface(a),lightblue+opacity(0.2));

path3 foot_edge=vertex1--vertex2--vertex3--vertex4--cycle;

draw (Label("$\force_1$", EndPoint), vertex1 -- vertex1 + (1,0,h), Arrow3(DefaultHead2));
draw (Label("$\force_2$", EndPoint), vertex2 -- vertex2 + (1,0,h), Arrow3(DefaultHead2));
draw (Label("$\force_3$", EndPoint), vertex3 -- vertex3 + (1,0,h), Arrow3(DefaultHead2));
draw (Label("$\force_4$", EndPoint), vertex4 -- vertex4 + (1,0,h), Arrow3(DefaultHead2));


draw(vertex3--vertex3+(0, -0.4, 0), linetype(new real[] {4,4}));
draw(vertex4--vertex4+(0, -0.4, 0), linetype(new real[] {4,4}));
draw(Label("$2\ell$", MidPoint), vertex3+(0, -0.3, 0)--vertex4+(0, -0.3, 0), linetype(new real[] {4,4}), Arrows3(size=4,HookHead2,NoFill));

draw(vertex2--vertex2+(-0.4, 0, 0), linetype(new real[] {4,4}));
draw(vertex3--vertex3+(-0.4, 0, 0), linetype(new real[] {4,4}));
draw(Label("$2w$", MidPoint), vertex2+(-0.3, 0, 0)--vertex3+(-0.3, 0, 0), linetype(new real[] {4,4}), Arrows3(size=4,HookHead2,NoFill));


draw(foot_edge, black+1);
axes3(red, xlabel="$x$", ylabel="$y$", zlabel="$z$", min=(0,0,0), max=(4,4,9), Arrow3(red));
//draw(surface((-1, -1.5, 0)..(-1, 6, 0)..(2, 6, 0)..(7, 6, 0)..(7, 1, 0)..(6.5, -1.5, 0)..cycle), grey+opacity(0.3));
draw(surface(plane((6,0,0), (0,4,0), (-3, -2, 0))), grey+opacity(0.3));
