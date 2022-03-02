function []=Positive_definite(matrix)

eig_A = eig(matrix);
flag = 0;
for i = 1:rank(matrix)
  if eig_A(i) <= 0 
  flag = 1;
  end
end
if flag == 1
  disp('the matrix is not positive definite')
  else
  disp('the matrix is positive definite')
end