% Este programa calcula a solucao de uma equaçao não lineares
%
% f(x) = 0
%
% pelo metodo de Newton em 10 iterações.
%
% Aula 3: Matematica Numerica II (2021/2022). Aderito Araujo
%
clc; clear; close all;
x = 3;              % aproximacao inicial
%h = 1e-2;          % parametro h para o metodo quasi-Newton                      
f = @(x) x.^3.*sin(x)+4*x-3;                % funcao f
fl = @(x) 3*x.^2.*sin(x)+x.^3.*cos(x)+4;    % funcao derivada de f     
for i = 1:10
    x = x -f(x)/fl(x);              % Newton
    %x = x -f(x)/((f(x+h)-f(x))/h);  % quasi-Newton
end
fplot(f,[0, 5],'LineWidth',2), hold on, plot(x,f(x),'k*','MarkerSize',14,'LineWidth',2)
yline(0);                           % eixo dos xx
set(gca,'FontName','Helvetica','FontSize',20)
fprintf('Solução aproximada = %6f \n',x)
title('f(x) = x^3sin(x) + 4x - 3')