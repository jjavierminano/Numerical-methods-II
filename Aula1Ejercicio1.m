%Determine el gradiente de la función f y la jacobiana F
syms x y; f= x + y -3 ; 
syms x y; g = x^2 +y^2 -9 ;
F = [f g];
F;
gradf = [diff(f,x) diff(f,y)];
gradg = [diff(g,x) diff(g,y)];

gradf;
Jacobiana = [gradf; gradg];
Jacobiana;
