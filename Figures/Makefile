.SUFFIXES: .asy .eps

.asy.eps: ../Styles/mynotation.sty
	asy $< > /dev/null

asy:
	ls *.asy | sed 's/\.asy/.eps/' | paste -s - | sed 's/^/${MAKE} -j 4 /' | sh

dot:
	neato -Teps walk_cycle.dot -o walk_cycle.eps

# convert Falling_cat_1894.jpg -resize 50% Falling_cat_1894.eps
# convert collaboration_box2.jpg -resize 50% collaboration_box2.eps
