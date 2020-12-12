% This is a script to get the graphical represtentation of the variation of
% x for a certain value of 'r'. For this logistic map, the initial value of
% x is 0.01
%
%
% Written By- SHOWREN DATTA
% Last Modified On- September 13th, 2020
%**************************************************************************

clear;

%  PARAMETERS
num_iterations = 50;  % number of iterations specified in question
r1 = 2.00 * ones(1,num_iterations);  % our choice of r
r2 = 2.99 * ones(1,num_iterations);

% INITIALIZATION two vectors (one for each 'r') that will contain the value
% of x after every iteration
x1 = zeros(1,num_iterations);
x2 = zeros(1,num_iterations);

% For both the vectors setting the starting point x = 0.01
x1(1) = 0.01;
x2(1) = 0.01;

% ITERATIONS for r1 (r = 2.00)
for iter=1:(num_iterations - 1)
	x1(iter + 1) = logistic_calculate(r1(iter),x1(iter));
end  %end of iteration loop

% ITERATIONS for r2 (r = 2.99)
for iter=1:(num_iterations - 1)
	x2(iter + 1) = logistic_calculate(r2(iter),x2(iter));
end  %end of iteration loop

% Plotting the graphs for each value of r. The data from each value of r 
% are connected with a line, marked by a different symbol, and have a 
% different color and saving the file as png format

hold on
plot(r1,x1,'r-*','MarkerSize',3);
plot(r2,x2,'b-o','MarkerSize',3);
box on;
xlim([1.75,3.25]);
xlabel('r');
ylabel('x');
legend(' r = 2.00 ',' r = 2.99 ', 'Location', 'northwest');
title('First 50 iterations of logistic map');
saveas(gcf,'Problem_5_MATLAB','png');
% Defining the logistic_calculate function.
function x=logistic_calculate(r,x)
	x=r*x*(1-x);
end
