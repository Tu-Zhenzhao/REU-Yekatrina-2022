% Solve the Poisson equation u_xx + u_yy = f(x,y) on [0,1] x [0,1] 
% The 5-point stencil for the second-order centered FD is used to discretize the
%Poisson equation in 2D.
% to run the code type in matlab command window, for example:
% [usoln] = Poisson2D(320);
% it will plot the results for mesh with h=1/(N+1), N=320 in this example, hence h=1/321
%The code will also print the error for the considered h
% This code uses matlab "vectors" instead of loops

function [usoln] = Poisson2D(N)

%N = 320; 
% 20, 40, 80, 160 (different choices of N - do mesh refinement to see
%convergence of the scheme, should be O(h^2))
h = 1/(N+1);
x = linspace(0,1,N+2);   % grid points in x direction on [0, 1]
y = linspace(0,1,N+2);   % grid points in y direction on [0, 1]


[X,Y] = meshgrid(x,y); % two dimensional arrays of x,y values
X = X';                     % transpose so that X(i,j),Y(i,j) are
Y = Y';                     % coordinates of (i,j) point

II = 2:N+1;              % indices of interior points in x direction (without boundary points)
JJ = 2:N+1;              % indices of interior points in y direction (without boundary points)
xx = X(II,JJ);           % interior points
yy = Y(II,JJ);

% Define true solution to test the scheme (you can choose different true solution, %
%for example, 5*exp(2*x+y))

utrue = X.^5+Y.^2;
%exp(2*X+Y); 

% Define rhs function f(x,y)(use true solution to compute the corresponding rhs
%function) 

f = @(x,y) 20*x.^3+2;
%5*exp(2*x+y);   

rhs = f(xx,yy);        % evaluate f at interior points for right hand side
                           % rhs is modified below for boundary conditions.

% set boundary conditions around edges of usoln array:

usoln = utrue;              % use true solution for this test problem
                            % This sets full array, but only boundary values
                            % are used below.  For a problem where utrue
                            % is not known, would have to set each edge of
                            % usoln to the desired Dirichlet boundary values.


% adjust the rhs to include boundary conditions:
rhs(:,1) = rhs(:,1) - usoln(II,1)/h^2;
rhs(:,N) = rhs(:,N) - usoln(II,N+2)/h^2;
rhs(1,:) = rhs(1,:) - usoln(1,JJ)/h^2;
rhs(N,:) = rhs(N,:) - usoln(N+2,JJ)/h^2;


% convert the two dimensional grid function rhs into a column vector for rhs of system:
F = reshape(rhs,N*N,1);

% form matrix A using sparse storage:
I = speye(N);
e = ones(N,1);
T = spdiags([e -4*e e],[-1 0 1],N,N);
S = spdiags([e e],[-1 1],N,N);
A = (kron(I,T) + kron(S,I)) / h^2;

% Solve the linear system (Sparse Gaussian Elimination):
uvec = A\F;  

% reshape vector solution uvec as a grid function and 
% insert this interior solution into usoln for plotting purposes:
% (recall boundary conditions in usoln are already set) 

usoln(II,JJ) = reshape(uvec,N,N);

% assuming true solution is known and stored in utrue:
err = max(max(abs(usoln-utrue)));   
fprintf('Max Error = %10.3e \n',err)

% plot results:

clf
hold on

% plot mesh:
plot(X,Y,'k');  plot(X',Y','k')

% plot solution:
contour(X,Y,usoln,30)

axis([0 1 0 1])
daspect([1 1 1])
title('Contour plot of computed solution')
hold off

figure
title('Computed solution')
surf(X,Y,usoln)

end