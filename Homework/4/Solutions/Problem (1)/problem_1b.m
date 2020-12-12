
% This function works for time interval [0,200] and an initial value of
% r_0 = 0.0001; both time intervals and initial values are changable and so
% is the value of co-efficient a (currently set as 1) in the function
% definition

[t,result]=ode45(@deriv, [0,200], 0.0001);

figure

% Plotting the results
plot(t,result);
xlabel('t');
ylabel('r(t)');

% Defining the function for Hopf Model
function f=deriv(t,r)
   f = 1 * r - r * r * r; 
end
