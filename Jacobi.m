%Jacobi method for A*x = b.
% A = n-by-n matrix
% b = n-dimensional vector
% epsilon = accuracy requirement
% maxit = maximal number of iterations
% x_0 = start vector for the iteration
%RETURN:
%x_0 = approximate solution to A*x = b.
%-------------------------------------------------------
function [x_0] = Jacobi(A, b, epsilon, maxit, x_0)

% check if the entered matrix is a square matrix
[na, ma] = size(A);
if na ~= ma
    disp('Matrix A must be a square matrix')
    return
end

% check if b is a column matrix
[nb, mb] = size (b);
if nb ~= na || mb~=1
   disp( 'Matrix b must be a column matrix')
   return
end


res = b-A*x_0;
errors = norm(res);
dx = zeros(na,1);
for k=1:maxit

    for i=1:na
        dx(i) = b(i);
        for j=1:na
            dx(i) = dx(i) - A(i,j)*x_0(j); 
        end
        dx(i) = dx(i)/A(i,i);
        x_0(i) = x_0(i) + dx(i);

    end
    if(errors<epsilon)
        break
    end
end
fprintf('The final answer obtained after %g iterations is  \n', k);