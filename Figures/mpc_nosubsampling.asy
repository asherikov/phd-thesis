import graph;
import interpolate;
import fontsize;
import markers;


usepackage("../Styles/mymath");
usepackage("../Styles/mynotation");


//=======================
// General
//=======================

size(210,100,IgnoreAspect);
defaultpen(fontsize(10));



//=======================
// Variables
//=======================

real ymin = -0.1;
real ymax = 1.5;

real xmin = -0.1;
real xmax = 2.6;

real ts0 = 0.2;
real tf0 = 2.2;
real j0 = 0.5;

int N = 5;
real T = (tf0-ts0)/N;

real ts1 = ts0 + T/2;
real tf1 = tf0 + T/2;
real j1 = 1;


real [][] start0 = {{ts0,ts0},{ymin,ymax}};
real [][] end0 = {{tf0,tf0},{ymin,ymax}};

real [] func0_x = array(N+1, 1);
real [] func0_t = ts0 + sequence(0,N)*T;

real [] func1_t = ts1 + sequence(0,N)*T;


//=======================
// Plotting
//=======================

draw( graph(func0_t, j0*func0_x, Hermite(natural)), marker(stickframe(1,4),marknodes) );
draw( graph(func1_t, j1*func0_x, Hermite(natural)), marker(stickframe(1,4),marknodes) );

xaxis("$t$", xmin, xmax, Arrow);
yaxis("", ymin, ymax, Arrow);

xtick("$t_{0}$", ts0);
xtick("$t_{0}^{\prime}$", ts1);
xtick("$t_{N}$", tf0);
xtick("$t_{N}^{\prime}$", tf1);

ytick(rotate(90)*"$j$", j0);
ytick(rotate(90)*"$j+1$", j1);
