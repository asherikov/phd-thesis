import graph;
import interpolate;
import fontsize;

usepackage("../Styles/mymath");
usepackage("../Styles/mynotation");


//=======================
// General
//=======================

size(300,150,IgnoreAspect);
defaultpen(fontsize(10));



//=======================
// Variables
//=======================

real ymin = -0.1;
real ymax = 2;

real xmin = -0.1;
real xmax = 2.6;

real ts0 = 0.2;
real tf0 = 2.2;

real ts1 = 0.4;
real tf1 = 2.4;

real [][] start0 = {{ts0,ts0},{ymin,ymax}};
real [][] end0 = {{tf0,tf0},{ymin,ymax}};

real [][] start1 = {{ts1,ts1},{ymin,ymax}};
real [][] end1 = {{tf1,tf1},{ymin,ymax}};

int func_points = 10;
real [] func0_x = {0.5,   1.0,   1.5,   0.8, 0.4,   0.6,   0.5,   1.0, 1.5,   0.8,   0.4};
real [] func0_t = ts0 + sequence(0,func_points)*(tf0-ts0)/func_points;

real [] func1_x = {1.0,   1.6,   0.9,   0.5, 0.5,   0.4,   0.9,   1.6, 0.9,   0.5,   0.6};
real [] func1_t = ts1 + sequence(0,func_points)*(tf1-ts1)/func_points;


//=======================
// Plotting
//=======================

draw( graph(start0[0],start0[1]), Dotted );
draw( graph(end0[0],end0[1]), Dotted );

draw( graph(start1[0],start1[1]), grey+Dotted );
draw( graph(end1[0],end1[1]), grey+Dotted );

draw( graph(func0_t,func0_x, Hermite(natural)));
draw( graph(func1_t,func1_x, Hermite(natural)), grey+dashed);


draw((func0_t[0],func0_x[0]), black+3);
draw((func1_t[0],func1_x[0]), grey+3);

label("$x_0$", (func0_t[0],func0_x[0]) + (-0.1,0));
label("$x_0^{\prime}$", (func1_t[0],func1_x[0]) + (-0.1,0));


draw((func0_t[func_points],func0_x[func_points]), black+3);
draw((func1_t[func_points],func1_x[func_points]), grey+3);

label("$x_N$", (func0_t[func_points],func0_x[func_points]) + (0.1,0));
label("$x_N^{\prime}$", (func1_t[func_points],func1_x[func_points]) + (0.1,0));



xaxis("$t$", xmin, xmax, Arrow);
yaxis("$x$", ymin, ymax, Arrow);

xtick("$t_{0}$", ts0);
xtick("$t_{N}$", tf0);

xtick("$t_{0}^{\prime}$", ts1);
xtick("$t_{N}^{\prime}$", tf1);
