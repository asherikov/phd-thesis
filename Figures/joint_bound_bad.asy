import graph;
import fontsize;

usepackage("../Styles/mymath");
usepackage("../Styles/mynotation");


//=======================
// General
//=======================

size(200,200,IgnoreAspect);
defaultpen(fontsize(10));



//=======================
// Variables
//=======================

real T = 1;
real b = 4;


//=======================
// Functions
//=======================

real bound(real t)
{
    return b;
}

real quadratic_function(real t, real x0, real v0, real a)
{
    return x0 + v0*t + a*t^2/2;
}

real f0(real t)
{
    return quadratic_function(t, 0.5, 9, -11);
}

real f1(real t)
{
    return quadratic_function(t, 0.5, 5, -3);
}

real f2(real t)
{
    return quadratic_function(t, 0.5, 7, -7);
}


//=======================
// Plotting
//=======================

draw(graph(f0, 0, T+0.4), gray+dashed);
//draw(graph(f1, 0, T+0.4), gray+dotted);
//draw(graph(f2, 0, T+0.4), gray+dashdotted);
draw(graph(bound, 0, T+0.4), red);

draw((T,b), red+3);
label("$q^{\prime}_{i,T}$", (T,b+0.3));

xaxis("$t$", -0.1, T + 0.4, Arrow);
yaxis("$q_i^{\prime}$", -0.1, 5, Arrow);

xtick("$T$", T);
xtick("$0$", 0);
labely(b,"$\bar{q}\vphantom{q}_i^{\prime}$");
