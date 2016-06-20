import solids;
import fontsize;

usepackage("../Styles/mymath");
usepackage("../Styles/mynotation");

//=======================
// General
//=======================
size(7cm,0);
limits((0,0),(10,10));
defaultpen(fontsize(10));



//=======================
// Draw
//=======================

pair vertex1 = (2.5,1.5);
pair vertex2 = (-2.5,1.5);
pair vertex3 = (-2.5,-1.5);
pair vertex4 = (2.5,-1.5);

pair cop1 = (-0.5,0.5);
pair cop2 = (1,-0.5);

pair Slabel = (2.5, 3);

transform tranfoot2 = rotate(20)*shift((3,5));

path foot1=vertex1--vertex2--vertex3--vertex4--cycle;
path foot2=tranfoot2*foot1;

path convhull=vertex2--tranfoot2*vertex2--tranfoot2*vertex1--tranfoot2*vertex4--vertex4--vertex3--cycle;

// hull
filldraw(rotate(90)*convhull, gray(0.9), gray(0.9));

// feet
draw(rotate(90)*foot1, black+linetype(new real[] {4,4}));
draw(rotate(90)*foot2, black+linetype(new real[] {4,4}));

// contact points
draw((0,0), black+4);
label(Label("$\contact_1^{xy}$"), (0,0)+(0.6,0));

draw(rotate(90)*tranfoot2*(0,0), black+4);
label(Label("$\contact_2^{xy}$"), rotate(90)*tranfoot2*(0,0)+(0.6,0));


// cop
draw(rotate(90)*cop1, red+3);
//label(Label("$\ubar{\cop} = \V{c}^{xy} - \ubar{\zeta} (\ddotV{c}^{xy} - \V{g}^{xy})$"), rotate(90)*cop1+(0,-0.4));
label(Label("$\ubar{\cop}$"), rotate(90)*cop1+(0,-0.4));

draw(rotate(90)*tranfoot2*cop2, red+3);
//label(Label("$\bar{\cop} = \V{c}^{xy} - \bar{\zeta} (\ddotV{c}^{xy} - \V{g}^{xy})$"), rotate(90)*tranfoot2*cop2+(0,-0.4));
label(Label("$\bar{\cop}$"), rotate(90)*tranfoot2*cop2+(0,-0.4));

pair cop = 0.6*(rotate(90)*cop1) + 0.4*(rotate(90)*tranfoot2*cop2);

draw(cop, red+3);
label(Label("$\cop$"), cop+(0,-0.4));

draw(rotate(90)*cop1--rotate(90)*tranfoot2*cop2, red+linetype(new real[] {4,4}));


// support area
label(Label("$\SET{S}(\contact_1^{xy}, \contact_2^{xy})$"), rotate(90)*Slabel);
