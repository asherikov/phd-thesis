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


real angle1 = 90;
real angle2 = 110;

pair p1 = (9,3.5);
pair p2 = (3,4.5);


transform tranfoot1 = shift(p1)*rotate(angle1);
transform tranfoot2 = shift(p2)*rotate(angle2);


path foot=vertex1--vertex2--vertex3--vertex4--cycle;
path foot1=tranfoot1*foot;
path foot2=tranfoot2*foot;


path convhull=point(foot1,1)--point(foot1,2)--point(foot1,3)--point(foot2,3)--point(foot2,0)--point(foot2,1)--cycle;

// hull
//filldraw(convhull, gray(0.9), gray(0.9));
draw(convhull, gray(0.7)+linetype(new real[] {14,14})+linewidth(0.1));
fill(foot1, gray(0.9));
fill(foot2, gray(0.9));


// feet


int n = 2;

for(int i = 1; i <= n; ++i)
{
    real lambda2 = i/(n+1);
    real lambda1 = 1 - lambda2;

    transform tranfootx = shift(lambda1*p1 + lambda2*p2) * rotate(lambda1*angle1 + lambda2*angle2);
    fill(tranfootx*foot, gray(0.9));
}


path foot_centers = p1;
for(int i = 1; i <= n; ++i)
{
    real lambda2 = i/(n+1);
    real lambda1 = 1 - lambda2;

    transform tranfootx = shift(lambda1*p1 + lambda2*p2) * rotate(lambda1*angle1 + lambda2*angle2);
    foot_centers = foot_centers -- (lambda1*p1 + lambda2*p2);

    draw(tranfootx*foot, black+linetype(new real[] {14,14})+linewidth(0.1));
}
foot_centers = foot_centers -- p2;


draw(foot1, black+linewidth(0.1), marker(scale(0.4mm)*unitcircle,FillDraw(black)));
draw(foot2, black+linewidth(0.1), marker(scale(0.4mm)*unitcircle,FillDraw(black)));



// contact points
draw(foot_centers, red+linetype(new real[] {14,14})+linewidth(0.1), marker(scale(0.3mm)*unitcircle,red,FillDraw(red)));

draw(p1, black+4);
label(Label("$\contact_1^{xy}$"), p1+(0+0.5,0));

draw(p2, black+4);
label(Label("$\contact_2^{xy}$"), p2+(0-0.5,0));



// axes
xaxis("$x$", -0.2, 12, Arrow);
yaxis("$y$", -0.2, 8, Arrow);

