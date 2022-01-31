% Example of a simple code to solve two-point BVP below
% -u''=1 on [0, 1]
% u(0)=u(1)=0;
% Input: n is the number of intervals in the grid, n-1 is the number of interior nodes, n+1 is the
% total number of nodes, including 2 boundary nodes
function [u] = poissonfd1(n)
x=linspace(0,1,n+1);
A=sparse(diag(2*ones(n-1,1))+diag((-1)*ones(n-2,1),1)+diag((-1)*ones(n-2,1),-1));
leftbc=0;
rightbc=0;
f=ones(n-1,1);
f(1)=f(1)+(n)^2*leftbc;
f(n-1)=f(n-1)+(n)^2*rightbc;
u=(n)^2*A\f;

%Error Calculation
error=0;
for j=1:n-1
 if(abs(u(j)+0.5*x(j+1)*(x(j+1)-1.0)) > error)
     error=abs(u(j)+0.5*(x(j+1))*(x(j+1)-1.0));
 end
end
plot(x(2:n),u);
hold on

%error;

end