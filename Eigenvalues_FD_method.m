%before using this function you need to change parameter of
%Second_Order_Centered_FD_method(n) as A_h
function [h_table] = Eigenvalues_FD_method(size)
x = (1:size);

%create a size for table
sizes = {};
for j=x
    sizes = [sizes, string(1/j)];
end

%this is for finding largest eigenvalue of A_h
largest = ones(size, 1);
for k = x
    if (k == 1)
        largest(1) = 0;
    elseif (k == 2)
        largest(2) = eig(Second_Order_Centered_FD_method(2));
    else
        largest(k) = eigs(Second_Order_Centered_FD_method(k), 1);
    end
end

%this is for finding smallest eigenvalue of A_h
smallest = ones(size, 1);
for k = x
    if (k == 1)
        smallest(1) = 0;
    elseif (k == 2)
        smallest(2) = eig(Second_Order_Centered_FD_method(2));
    else
        smallest(k) = eigs(Second_Order_Centered_FD_method(k), 1, "smallestabs");
    end
end

%this is for (max - min)
difference = ones(size, 1);
for k = x
    difference(k) = smallest(k) - largest(k);
end

h_table = table(largest, smallest, difference, 'RowNames', sizes);

