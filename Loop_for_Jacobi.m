A = [11, 10; 10,12];
b = [61; 70];
epsilon = 0.0000001;
maxit = 200;

solu = A\b;

solu_10 = solu*10;

i = input('How many range you want to compute:');

x_val = zeros(i,1);
y_val = zeros(i,1);

x_val_2 = zeros(i,1);
y_val_2 = zeros(i,1);

for k = 1:i
    x = [solu_10(1) + 10*k; solu_10(2) + 10*k];
    itr = Jacobi(A, b, epsilon, maxit, x);
    itr_2 = Gauss_Seidel(A, b, epsilon, x);
    
    x_val(k) = 10*k;
    y_val(k) = itr;
    
    x_val_2(k) = 10*k;
    y_val_2(k) = itr_2;


end

jacobi = scatter(x_val, y_val, 'b', 'o');
hold on
GS = scatter(x_val_2, y_val_2, 'r', 'x');
hold on
legend([jacobi,GS], 'Jacobi', 'Gauss_Seidel')
grid on;