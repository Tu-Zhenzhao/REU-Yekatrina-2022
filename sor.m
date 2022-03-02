%%%%%%%%%%%%%%% Example of SOR code %%%%%%%%%%%%%%%%%%%%%%%%%%%
function [x,iter]=sor(A,b,x_0,Nmax,tol,omega)
%SOR method
%Solves linear system Ax=b with the SOR method
%Input
%A - square matrix
%b -rhs
%x_0 is the initial guess
%Nmax - max number of the iterations allowed
%tol - the desired tolerance (accuracy)
%omega - scalar parameter between 1 and 2
%Output
%x ix the obtaned solution to linear system with the desired tolerance %iter is the total number of SOR iterations

%Initialization:
[n,m]=size(A);
if n~=m, error('Not a Square System'); end
iter=0;
res=b-A*x_0;
res0=norm(res);
errors=norm(res);
xold=x_0;
x=x_0;

%SOR iterations:
while errors>tol && iter<Nmax
    iter=iter+1;
    for ii=1:n
        p=0;
        for jj=1:ii-1, p=p+A(ii,jj)*x(jj);end
        for jj=ii+1:n, p=p+A(ii,jj)*xold(jj); end
        x(ii,1)=omega*(b(ii)-p)/A(ii,ii)+(1-omega)*xold(ii);
    end
    xold=x;
    res=b-A*x;
    errors=norm(res)/res0;
end
return