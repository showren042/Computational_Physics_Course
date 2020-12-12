% This is a script to find the log-log graph of absolute error v/s
% time increament for a logistic equation
%
%
% Written By- SHOWREN DATTA
% Last Modified On- September 10th, 2020
%**************************************************************************

clear;

% Setting the given values of t and n
t = 2;
n = 0:20;

% Finding the first derivative of the given exact solution to the logistic
% equation at t=2
syms z;

x = 1 / (1 + 9 * exp(-z));

first_derivative = vpa(subs(diff(x),z,2));

% Initialization
del_t = zeros(1,length(n));
first_principal = zeros(1,length(n));
absolute_error = zeros(1,length(n));

% Running iterations for each value of 'n' and finding corresponding
% absolute error
for i = 1 : length(n)
    del_t (i) = 10 ^ (- (i - 1));
    first_principal (i)...
        = (exact_solution(t + del_t(i)) - exact_solution(t)) / del_t(i);
    absolute_error (i)...
        = abs( first_derivative - first_principal (i));
end

% Plotting the log-log graph and saving it as a png file
loglog(del_t,absolute_error,'*');
box on;
xlabel('\Deltat','Fontsize',12);
ylabel('\delta(\Deltat)','Fontsize',12);
title('Absolute Error \delta(\Deltat) v/s \Deltat for x(t) = 1 / (1 + 9 * exp(-t)) and t = 2');
saveas(gcf,'Problem_1_MATLAB','png');

% Declaring the function exact_solution
function x = exact_solution(t)
x = 1 / (1 + 9 * exp(-t));
end