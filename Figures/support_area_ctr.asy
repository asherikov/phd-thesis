import solids;
import fontsize;

usepackage("../Styles/mymath");
usepackage("../Styles/mynotation");

//=======================
// General
//=======================
size(10cm,0);
limits((0,0),(10,10));
defaultpen(fontsize(10));



//=======================
// Draw
//=======================

pair vertex1 = (2.5,1.5);
pair vertex2 = (2.5,-1.5);
pair vertex3 = (-2.5,-1.5);
pair vertex4 = (-2.5,1.5);

pair Slabel = (6, 5);


transform tranfoot1 = shift((9,3.5))*rotate(90);
transform tranfoot2 = shift((3,4.5))*rotate(110);

pair p1 = tranfoot1*(0,0);
pair p2 = tranfoot2*(0,0);

path foot=vertex1--vertex2--vertex3--vertex4--cycle;
path foot1=tranfoot1*foot;
path foot2=tranfoot2*foot;

path convhull=point(foot1,1)--point(foot1,2)--point(foot1,3)--point(foot2,3)--point(foot2,0)--point(foot2,1)--cycle;

// hull
filldraw(convhull, gray(0.9), gray(0.9));

// feet
draw(foot1, black+linetype(new real[] {4,4}), marker(scale(0.4mm)*unitcircle,FillDraw(black)));
draw(foot2, black+linetype(new real[] {4,4}), marker(scale(0.4mm)*unitcircle,FillDraw(black)));


// contact points
draw(p1, black+4);
label(Label("$\contact_1^{xy}$"), p1+(0,-0.4));

draw(p2, black+4);
label(Label("$\contact_2^{xy}$"), p2+(0,-0.4));


// support area
label(Label("$\SET{S}(\contact_1^{xy}, \contact_2^{xy})$"), Slabel);


// vertices
label(Label("$\V{v}_{1,1}$"), point(foot1,0)+(-0.3,0.2));
label(Label("$\V{v}_{1,2}$"), point(foot1,1)+(0.3,0.2));
label(Label("$\V{v}_{1,3}$"), point(foot1,2)+(0.3,-0.3));
label(Label("$\V{v}_{1,4}$"), point(foot1,3)+(-0.3,-0.3));

label(Label("$\V{v}_{2,1}$"), point(foot2,0)+(-0.3,0.2));
label(Label("$\V{v}_{2,2}$"), point(foot2,1)+(0.3,0.2));
label(Label("$\V{v}_{2,3}$"), point(foot2,2)+(0.3,-0.3));
label(Label("$\V{v}_{2,4}$"), point(foot2,3)+(-0.3,-0.3));


// angles
draw(p1--tranfoot1*(2,0),black+dotted);
draw(p1--p1+(2,0),black+dotted);
draw(arc(p1, p1+(1.4,0), tranfoot1*(1.4,0)),black+dotted);
label(Label("$\theta_1$"), p1+(1.2,1.2));

draw(p2--tranfoot2*(2,0),black+dotted);
draw(p2--p2+(2,0),black+dotted);
draw(arc(p2, p2+(1.4,0), tranfoot2*(1.4,0)),black+dotted);
label(Label("$\theta_2$"), p2+(1.2,1.2));


// axes
xaxis("$x$", -0.2, 12, Arrow);
yaxis("$y$", -0.2, 8, Arrow);

