%cálculo de la solución de un sistema de ecuaciones no lineales
%F(x)=0
%a partir del método de Newton
%Aula 3 Matemática Numérica
clc; close all; clear;

%damos una aproximación inicial y la solución.
x = [2;2];
solucion = [sqrt(2)/2 ; sqrt(2)/2];

%damos la tolerancia del sistema
tolerancia = 1e-10;

%numero maximo de iteraciones e inicializamos a 0
imax = 100;
i = 0;

%inicializamos un error para entrar en el ciclo
error = tolerancia +1;

%norma para medir la distancia al error: norma euclidea representada por la
%función norm
distancia_solucion = norm(x-solucion);

disp('-------------------------------------------------------------------');
disp('                 Metodo de Newton para F(x) = 0                    ');
disp('-------------------------------------------------------------------');
disp(' Iteracao         x(1)                   x(2)           || x-x* || ');
disp('-------------------------------------------------------------------');
fprintf('    %2.0f   %20.16f   %20.16f    %9.4e\n',i,x(1),x(2),distancia_solucion);
%
% Ciclo de Newton
%

while(error > tolerancia) && (i < imax)
    F = funcion(x); 
    J = jacobiana(x);
    p = -J\F ;
    x = x + p;
    error = norm(F); %error = ||F(x)||
    i = i+1;

    distancia_solucion = norm( x - solucion ); % Erro: ||x-x*||
    fprintf('    %2.0f   %20.16f   %20.16f    %9.4e\n',i,x(1),x(2),distancia_solucion);
end
disp('-------------------------------------------------------------------');
%
% Gráficos
%
f1 = @(x,y) x.^2 + y.^2 - 1; fimplicit(f1,[-2 2 -2 2],'r','LineWidth',2)
hold on
f2 = @(x,y) 5*x.^2 - y.^2 - 2; fimplicit(f2,[-2 2 -2 2],'b','LineWidth',2)
plot(x(1),x(2),'ok','MarkerSize',10,'LineWidth',2)
hold off

function F = funcion(x)
%calcula el valor de F(x)
F =zeros(size(x));
F(1) = x(1).^2 + x(2).^2 - 1;
F(2) = 5*x(1).^2 - x(2).^2 - 2;
% Fim de F.
end

function J = jacobiana(x)
%
% Calcula o valor da matriz Jacobiana J(x) de F(x).
% Input:  vector x com n componentes.
% Output: matriz n-por-n J = J(x).
%
J(1,1) = 2*x(1);      J(1,2) = 2*x(2);
J(2,1) = 10*x(1);     J(2,2) = -2*x(2);
% Fim de Jacobiana.
end

    
    
    
    
    
    