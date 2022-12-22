%efectuar dos iteraciones de newton del sistema del ejercicio 1
%partiendo de la aproximación x0 =  [1 5]
syms x y; f= x + y -3 ; 
syms x y; g = x^2 +y^2 -9 ;
F = [f g];
J = [diff(f,x) diff(f,y); diff(g,x) diff(g,y)];
subs(F, {x,y}, {1,5});
i = 0;
x0 = [1 5];
for i < 3
    x_aprox = x0 - inv(J)
end