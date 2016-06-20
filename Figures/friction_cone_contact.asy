import graph3;
import solids;
import fontsize;

usepackage("../Styles/mymath");
usepackage("../Styles/mynotation");

//=======================
// General
//=======================
size(7cm,0,Aspect);
currentprojection=orthographic(-1,-1,0.8);
limits((0,0,0),(10,10,10));
defaultpen(fontsize(10));

//=======================
// Variables
//=======================
real r=4;
real h=6;


//=======================
// Draw
//=======================

path3 p=(0,0,0)--(r,0,h);
revolution a=revolution(p,Z);
draw(surface(a,4),lightblue+opacity(0.2));

label(Label("$\contact_i$"), (-0.4,-0.4,0));
draw (Label("$\force_i$"), (0,0,0) -- (-r*sqrt(2)/2, r*sqrt(2)/2, h), Arrow3(DefaultHead2));
draw (Label("$\NORME{\force_i^t}$"), (0,0,h) -- (-r*sqrt(2)/2, r*sqrt(2)/2, h), linetype(new real[] {4,4}), Arrows3(size=4,HookHead2,NoFill));
draw (Label("$\forceC_i^n$"), (0,0,0) -- (0, 0, h), linetype(new real[] {4,4}), Arrows3(size=4,HookHead2,NoFill));

axes3(red, xlabel="$x$", ylabel="$y$", zlabel="$z$", min=(0,0,0), max=(4,4,9), Arrow3(red));
//draw(surface((-1, -1.5, 0)..(-1, 6, 0)..(2, 6, 0)..(7, 6, 0)..(7, 1, 0)..(6.5, -1.5, 0)..cycle), grey+opacity(0.3));
draw(surface(plane((4,0,0), (0,4,0), (-2, -2, 0))), grey+opacity(0.3));
