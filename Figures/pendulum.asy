import graph3;
import solids;
import bsp;
import fontsize;

usepackage("../Styles/mymath");
usepackage("../Styles/mynotation");


//=======================
// General
//=======================
size(7cm,0,Aspect);
currentprojection=orthographic(-1,-1,0.4);
limits((0,0,0),(10,10,10));
defaultpen(fontsize(10));



//=======================
// Variables
//=======================
triple pos_mass = (4,1,-5);



//=======================
// Draw
//=======================

// ===== mass =====
revolution sph=sphere(pos_mass,0.3);
draw(surface(sph), blue);
label(Label("$\V{c}$"), pos_mass+(0.4,-0.4,0));
//draw(Label("$r$"), (0,0,0) -- pos_mass, black+2);
draw((0,0,0) -- pos_mass, black+2);
label(Label("$\V{p}$"), (0.4,-0.4,0));


// ===== projections =====
//triple pos_xz = (pos_mass.x, 0, pos_mass.z);
//triple pos_yz = (0, pos_mass.y, pos_mass.z);
triple pos_z = (0, 0, pos_mass.z);

//draw(pos_mass -- pos_xz, dashed);
//draw((0,0,0) -- pos_xz, dashed);

//draw(pos_mass -- pos_yz, dashed);
//draw((0,0,0) -- pos_yz, dashed);

//draw(pos_yz -- pos_z, dashed);
//draw(pos_xz -- pos_z, dashed);


// ===== angles & plane =====
//draw(Label("$\beta$"), arc((0,0,0), 3*unit(pos_xz), pos_mass), dotted);
//draw(Label("$\alpha$"), arc((0,0,0), 3*unit(pos_mass), pos_yz), dotted);

//draw(surface(plane((pos_mass.x+2,0,0), (0,pos_mass.y+2,0), (-1, -1, pos_z.z))), grey+opacity(0.3));
draw(surface((-1, -1.5, pos_z.z)..(-1, 6, pos_z.z)..(2, 6, pos_z.z)..(7, 6, pos_z.z)..(7, 1, pos_z.z)..(6.5, -1.5, pos_z.z)..cycle), gray(1)+opacity(0.7));


// ===== axes =====
xaxis3(Label("$x$"), 0, 8, NoTicks3, Arrow3(DefaultHead2));
yaxis3(Label("$y$"), 0, 8, NoTicks3, Arrow3(DefaultHead2));
zaxis3(Label("$z$"), -7, 3, NoTicks3, Arrow3(DefaultHead2));
