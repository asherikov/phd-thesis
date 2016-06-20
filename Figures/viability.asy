import patterns;
import fontsize;


usepackage("../Styles/mymath");
usepackage("../Styles/mynotation");


//=======================
// General
//=======================

size(14cm,0,Aspect);
defaultpen(fontsize(10));



//=======================
// Patterns
//=======================

picture mycrosshatch(real H=5mm, pen p=currentpen)
{
  picture tiling;
  add(tiling,hatch(H,p),Fill(gray(1)));
  add(tiling,shift(H*sqrt(2))*rotate(90)*hatch(H,p));
  return tiling;
}


add("hatch",hatch(gray(0.8)));
add("crosshatch",mycrosshatch(gray(0.8)));


//=======================
// Draw
//=======================

//filldraw((0.5, 0)..(0, 10)..(2, 10)..(13.5, 10)..(15, 1.5)..(12.5, 0)..cycle, gray(0.9), pattern("hatch"));
filldraw((0.5, 0)..(0, 10)..(2, 10)..(13.5, 10)..(15, 1.5)..(12.5, 0)..cycle, pattern("hatch"), gray(0.5));
label("state space $\RR^n$", (0.5, 9));


//filldraw((1, 0.5)..(0, 8)..(2, 8)..(13, 9)..(14, 1.5)..(11, 0)..cycle, gray(0.8));
filldraw((1, 0.5)..(0, 8)..(2, 8)..(13, 9)..(14, 1.5)..(11, 0)..cycle, pattern("crosshatch"), gray(0.5));
label("viability kernel $\SET{V}$", (8.5, 8));


filldraw((1, 1)..(1, 6)..(3, 6)..(11, 7)..(12, 1)..(10, 0.5)..cycle, gray(0.8), gray(0.5));
label(minipage("capture basin $\SET{C}$", 2cm), (2, 4.6));

filldraw((4, 1.5)..(4, 5)..(4, 5)..(10.5, 6)..(11.5, 1.5)..(9.5, 1)..cycle, gray(0.8), gray(0.5));
label("$\SET{C}_H$", (4, 3.6));

filldraw((5, 2)..(5, 5)..(5, 5)..(10, 6)..(11, 1.5)..(9, 1)..cycle, gray(0.7), gray(0.5));
label("target set $\SET{T}$", (8.5, 4));

//draw((3, 9)..(6,10)..(8,9.5), dashed, MidArrow(SimpleHead), Arrow(SimpleHead));
draw((1, 7)..(4,8)..(5,9), dashed, MidArrow(SimpleHead), Arrow(SimpleHead));
draw((1, 6.5)..(3,6.5)..(5,7), dashed, MidArrow(SimpleHead), Arrow(SimpleHead));
//draw((0.5, 3)..(-2,6.5)..(-1,8.5), dashed, MidArrow(SimpleHead), Arrow(SimpleHead));
draw((0.5, 3)..(-1,6.5)..(0,7), dashed, MidArrow(SimpleHead), Arrow(SimpleHead));
draw((0.5, 2.5)..(3,2.5)..(6,4), dashed, MidArrow(SimpleHead), Arrow(SimpleHead));
//draw((1, 2)..(3,2)..(5,1), dashed, MidArrow(SimpleHead), Arrow(SimpleHead));
//draw((8, 5)..(9, 5)..(11,6), dashed, MidArrow(SimpleHead), Arrow(SimpleHead));
draw((5.5, 2.5)..(3.5, 2)..(1,2), dashed, MidArrow(SimpleHead), Arrow(SimpleHead));
