A = [11, 10; 10,12];
b = [61; 70];
x = [0;0];
maxit = 200;

solu = A\b;

i = input('How many range you want to compute:');

x_val = zeros(i,1);
y_val = zeros(i,1);
for k = 1:i
    epsilon = 1 * 10^(-k);
    itr = Jacobi(A, b, epsilon, maxit, x);
    
    x_val(k) = k;
    y_val(k) = itr;
end

tbl = table(x_val, y_val);
%y_val = flipud(y_val);
scatter(x_val, y_val)

grid on;

mdl = fitlm(tbl,'x_val ~ y_val');
disp(mdl);