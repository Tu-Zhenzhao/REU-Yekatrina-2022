[TOC]

# Set 1 Discussion

## For First Question

In MATLAB, I was writing my own code. You can simply running **Second_Order_Centered_FD_method.m** and make sure the plotting is “hold on”. 

![](/Users/tzz/Documents/REU-Yekaterina-Numerical Algorithms and Their Analysis/SOC_FD_method.png) 

This is the simulation of when I put n=32. 

## For Second Question

In this question, we are going to measure *E* (error) between numerical solution and exact solution.
$$
E = max|u(x_j)-u_j|
$$
Followed this equation, I also coded another file for compute error and print out an error-table. Before running **Error_table_Second_Order_Centered_FD_method(level)**, you need to change the output of **Second_Order_Centered_FD_method(n)** as “max_error”.

![](/Users/tzz/Documents/REU-Yekaterina-Numerical Algorithms and Their Analysis/error_table.png)

In this example, I just chose levels as 10. But we can find that before levels =6, the error decreasing very fast. When levels decreasing up to 9, it will much more slower. (I just recognized that I forgot to put ratio when I start typing): )

## For Third Question

### Size of $h$

I coded a function to compute the Eigen value of $A^h$ . This function will do find the largest and smallest Eigen value of $A^h$ . It also can compute the difference between largest and smallest. Here is the table:

![](/Users/tzz/Documents/REU-Yekaterina-Numerical Algorithms and Their Analysis/eigenva_diff.png)

From the table, we can observe that as size of h turn larger, the largest Eigen value is turning larger. However, the smallest Eigen  value is turning smaller(you can take absolute value to understand my comment. Those are actual value of each $A^h$, I don’t want to change them. But we can analyze them without care about sign). Therefore, the difference between them will getting bigger. 

### Plot h= $$\frac{1}{4}$$ And h=$$\frac{1}{32}$$

When h= $$\frac{1}{4}$$:

![](/Users/tzz/Documents/REU-Yekaterina-Numerical Algorithms and Their Analysis/h=1:4.png)

When h= $$\frac{1}{32}$$:

![](/Users/tzz/Documents/REU-Yekaterina-Numerical Algorithms and Their Analysis/h=1:32.png)

It is apparently that as we turning size of h to higher, the numerical solution will closer to exact solution! 
