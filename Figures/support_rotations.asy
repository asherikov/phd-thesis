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

real halfwidth = 1.5;
real halflength = 2.5;

pair vertex1 = (halflength, halfwidth);
pair vertex2 = (halflength, -halfwidth);
pair vertex3 = (-halflength, -halfwidth);
pair vertex4 = (-halflength, halfwidth);

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
pair p = rotate(90)*(p2-p1);
p = (p.x/sqrt(p.x^2 + p.y^2), p.y/sqrt(p.x^2 + p.y^2));
fill(p1+p*halfwidth--p1-p*halfwidth--p2-p*halfwidth--p2+p*halfwidth--cycle, gray(0.9));
filldraw(circle(p1, halfwidth), gray(0.9), gray(0.6)+linewidth(0.1));
filldraw(circle(p2, halfwidth), gray(0.9), gray(0.6)+linewidth(0.1));


// feet
draw(foot1, black+linewidth(0.1), marker(scale(0.4mm)*unitcircle,FillDraw(black)));
draw(foot2, black+linewidth(0.1), marker(scale(0.4mm)*unitcircle,FillDraw(black)));


path foot_centers = p1;

int n = 2;

for(int i = 1; i <= n; ++i)
{
    real lambda2 = i/(n+1);
    real lambda1 = 1 - lambda2;

    transform tranfootx = shift(lambda1*p1 + lambda2*p2) * rotate(lambda1*angle1 + lambda2*angle2);
    foot_centers = foot_centers -- (lambda1*p1 + lambda2*p2);

    draw(circle(lambda1*p1 + lambda2*p2, halfwidth), gray(0.6)+linetype(new real[] {14,14})+linewidth(0.1));
    draw(tranfootx*foot, black+linetype(new real[] {14,14})+linewidth(0.1));
}
foot_centers = foot_centers -- p2;


// contact points
draw(foot_centers, red+linetype(new real[] {14,14})+linewidth(0.1), marker(scale(0.3mm)*unitcircle,red,FillDraw(red)));


draw(p1, black+4);
label(Label("$\contact_1^{xy}$"), p1+(0+0.5,0));

draw(p2, black+4);
label(Label("$\contact_2^{xy}$"), p2+(0-0.5,0));



// axes
xaxis("$x$", -0.2, 12, Arrow);
yaxis("$y$", -0.2, 8, Arrow);

