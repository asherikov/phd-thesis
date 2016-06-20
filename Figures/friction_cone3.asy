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

triple corner_1 = (r, 0, h);
triple corner_2 = (-r*sin(0.523), r*cos(0.523), h);
triple corner_3 = (-r*sin(0.523), -r*cos(0.523), h);

real lambda_1 = 4.5;
real lambda_2 = 3;
real lambda_3 = 1.5;

triple generator_1 = lambda_1 * unit(corner_1);
triple generator_2 = lambda_2 * unit(corner_2);
triple generator_3 = lambda_3 * unit(corner_3);


//=======================
// Draw
//=======================

path3 p=(0,0,0)--(r,0,h);
revolution a=revolution(p,Z);
draw(surface(a,4),lightblue+opacity(0.2));

draw (corner_1 -- corner_2 -- corner_3 -- corner_1, dashed);

draw ((0,0,0) -- corner_1, dashed);
draw ((0,0,0) -- corner_2, dashed);
draw ((0,0,0) -- corner_3, dashed);

label(Label("$\contact_i$"), (-0.4,-0.4,0));
draw (Label("$" + (string) lambda_1 + "\genvector_{i,1}$", EndPoint), (0,0,0) -- generator_1, Arrow3(DefaultHead2));
draw (Label("$" + (string) lambda_2 + "\genvector_{i,2}$", EndPoint), (0,0,0) -- generator_2, Arrow3(DefaultHead2));
draw (Label("$" + (string) lambda_3 + "\genvector_{i,3}$", EndPoint), (0,0,0) -- generator_3, Arrow3(DefaultHead2));

draw (Label("$\force_i$"), (0,0,0) -- generator_1 + generator_2 + generator_3, Arrow3(DefaultHead2));

axes3(red, xlabel="$x$", ylabel="$y$", zlabel="$z$", min=(0,0,0), max=(4,4,9), Arrow3(red));
//draw(surface((-1, -1.5, 0)..(-1, 6, 0)..(2, 6, 0)..(7, 6, 0)..(7, 1, 0)..(6.5, -1.5, 0)..cycle), grey+opacity(0.3));
draw(surface(plane((4,0,0), (0,4,0), (-2, -2, 0))), grey+opacity(0.3));
