A=input('Enter the coefficient matrix A: \n');
%A= [7 -3 1; 2 9 -3; 5 4 11] 
% Write the coefficient matrix, A. where  the system: AX=B.
B=input('Enter the constant matrix B: \n');
%B = [21; 37; 15] % Write the constants matrix, B
P=[A B]; % constructing the new augmented matrix P 
[row, col] = size(P); % Calculating the size of augmented matrix, P
X=zeros(row,1); % Initial approximation of solutions.
C=zeros(row,1); % A dummy column matrix.
Err=ones(row,1); % Error column matrix.
epsilon=input('\n Enter the tolerance of error ');
  %error of tolerance you want. for exmple 0.001 or 0.0001 etc.
for m = 1:row % checking strictly diagonally dominant matrix
        if 2*abs(A(m,m))<= sum(abs(A(m,:))) 
            disp('Rearrange the equations to make strictly diagonally dominant matrix!!!');
            %Gauss Seidel method can't be applied.
           return
        end
end
merr=max(Err);
count = 0;
while merr>epsilon % Finding the final result.
    for m=1:1:row
       C(m,1)=X(m,1);
       X(m,1)=(1/P(m,m))*(P(m,col)-sum(A(m,:)*X(:,1))+A(m,m)*X(m,1));
       Err(m,1)= abs(C(m,1)-X(m,1));
       C(m,1)=X(m,1);
    end 
    merr=max(Err);
    count = count +1;
end
disp(' The required solution is:');
disp(X);
fprintf('After %g iteration: \n', count);
%fprintf('%1.5f \n', X(:,1)); 