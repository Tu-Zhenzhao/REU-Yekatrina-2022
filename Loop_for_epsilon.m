A = [11, 10; 10,12];
b = [61; 70];
x = [0;0];
maxit = 200;

solu = A\b;

i = input('How many range you want to compute:');

x_val = zeros(i,1);
y_val = zeros(i,1);

x_val_2 = zeros(i,1);
y_val_2 = zeros(i,1);
for k = 1:i
    epsilon = 1 * 10^(-k);
    itr = Jacobi(A, b, epsilon, maxit, x);
    itr_2 = Gauss_Seidel(A, b, epsilon, x);
    
    x_val(k) = k;
    y_val(k) = itr;
    
    x_val_2(k) = k;
    y_val_2(k) = itr_2;
end

tbl = table(x_val, y_val, x_val_2, y_val_2);
jacobi = scatter(x_val, y_val, 'b', 'o');
hold on
GS = scatter(x_val_2, y_val_2, 'r', 'x');
hold on
legend([jacobi,GS], 'Jacobi', 'Gauss_Seidel')

grid on;

mdl = fitlm(tbl,'x_val ~ y_val');
mdl_2 = fitlm(tbl,'x_val_2 ~ y_val_2');
disp(mdl);
disp(mdl_2);