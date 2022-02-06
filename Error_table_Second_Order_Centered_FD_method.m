%before using this function you need to change parameter of
%Second_Order_Centered_FD_method(n) as max_error
function [e_table] = Error_table_Second_Order_Centered_FD_method(level)
x = (1:level);

%create a levels for table
levels = {};
for j=x
    levels = [levels, string(1/j)];
end
display(levels)
%starting to import error from each level
errors = ones(level, 1);
for k = x
    errors(k) = Second_Order_Centered_FD_method(k);
end

e_table = table(errors,'RowNames', levels);


