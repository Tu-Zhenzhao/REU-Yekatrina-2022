%value is inverse of h, if you want to plot at h = 1/4 you can input value
%as 4. The formular is followed by value=1/h 
%Before launch this function please change
%Second_Order_Centered_FD_method(n) as u and make sure the graph status
%is "hold on"
function [] = Plot_numerical_solution_for_h(value)

%polt numerical solution and exact solution
Second_Order_Centered_FD_method(value);

