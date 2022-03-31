A = [11, 10; 10,12];
b = [61; 70];
epsilon = 0.0000001;
maxit = 200;

solu = A\b;

solu_10 = solu*10;

i = input('How many range you want to compute:');

x_val = zeros(i,1);
y_val = zeros(i,1);
for k = 1:i
    x = [solu_10 + 10*k; solu_10 + 10*k];
    itr = Jacobi(A, b, epsilon, maxit, x);
    
    x_val(k) = 10*k;
    y_val(k) = itr;
end

scatter(x_val, y_val)

grid on;