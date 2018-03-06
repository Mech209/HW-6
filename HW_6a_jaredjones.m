clear 
clc

Nx = 10; %# of Nodes in x
Ny = 10; %# of Nodes in y
Tol = 1d-6;  %Tolerance to convergence
err = 1; % error
M = 1; %Integer Test Problem
k = 0; %Counter
L = 10;
%u(x,y) exact function array
x = 1:1:L;
y = 1:1:L;
 for j = 1 : Ny
     for i = 1: Nx
    u(i,j) = (L-y(i))*sin(M*x(i))*sinh(M*y(j));
     end
 end
 %f(x,y) gauss-seidel method
 while err > tol
     k = k+1;
      for j = 2:Ny -1
          for i = 2:Nx -1
              fk1 = .25*(

