%Trabajo 1.
%1.c metodo de Broyden

clc; clear; close all; 
x = [2 ; 2]; %aproximación inicial
A = eye(2); %matriz inicial
i = 0 ; %inicializamos el contador
imax = 30; %máximo de iteraciones
F = funcion(x);

while(i < imax)
    disp('entra');
    i = i+1;
    s = - A\F;
    x = x+s;
    F1 = F;
    F = funcion(x);
    y =F -F1;
    A = A + (y-A*s)*s'/(s'*s);
    disp(x)
    disp(s)
    disp(y)
    disp(A)
end

function F = funcion(x) %calcula el valor de F
% input: vector x con 2 componentes
% output: vector F(x) con 2 componentes
    F = zeros(size(x));
    F(1) = x(1).^2 + x(2).^2 - 1;
    F(2) = 5*x(1).^2 - x(2).^2 - 2;
end