%n is the space of [0,1]
%then, n+1 will be nodes in [0,1]
%n-1 are the nodes that in two boundary conditions
function [u] = Second_Order_Centered_FD_method(n)
x=linspace(0,1,n+1);
h = 1 / (n+1); %h is the mesh width
%create a sparse matrix A 
e = ones(n-1, 1); %e is the colum of A which is used to create sparse matrix
A = spdiags([e -2*e e], -1:1, n-1, n-1);
A_h = (1/h^2)*A;

% display(eigs(A_h,1,'smallestabs')) %print the smallest eigenva
%display(eigs(A_h,1)) %print the largest eigenva
%max_eig = eigs(A_h,1);
%min_eig = eigs(A_h,1,'smallestabs');
%dep = max_eig - min_eig;
%define a second derivative u'' as f(x)
f = -pi^2*sin(pi*x);

% define the original function u
u = sin(pi*x);

%define F^h 
F_h = ones(n-1,1);
count = 1;
for i = 2:n
    F_h(count) = f(i);
    count = count + 1;
end

%find the u!
U_h = A_h \ F_h;

%Error of FD method
max_error = 0;
for j=1:n-1
    error = abs(u(j+1) - U_h(j));
    if (error > max_error)
        max_error = error;
    end
end
%display(max_error)

%plot the function U_h but no boundry condiction
plot(x(2:n),U_h);

hold on
plot(x(1:n+1), u);
hold off

legend('numerical solution','exact solution')
end
