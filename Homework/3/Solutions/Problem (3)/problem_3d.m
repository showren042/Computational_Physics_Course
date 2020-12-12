clear;

% Declaring the given values
w_0 = 0.5;
w_0_prime = 0;
w_0_doubleprime = -0.25;

% Total simulation time
Z = 50;

% increment and total step count
dz = 0.001;
nstep = Z / dz;

% Initializations
params = [];
W = [0,0,0];
sampleTimes = ( 1 : ( nstep + 1 )) * dz;
rk4Results = w_0;

% Plugging in the given value before iteration starts
W(1) = w_0;
W(2) = w_0_prime;
W(3) = w_0_doubleprime;
z = 0;

% Iterations for RK4 results at each time step
for iter = 1 : nstep
    W = rk4(W, z, dz, 'deriv', params);
    rk4Results = [rk4Results W(1)];
    z = z + dz;
end

% Plotting the numerical and exact solution
plot(sampleTimes, rk4Results, 'r'); hold on;
plot(sampleTimes, 0.5*(sech(sampleTimes./2)).^2, 'b');
xlabel('z');
ylabel('w(z)');
legend('numerical solution','exact solution','Location','best');
title('Plot for solution of parameter-free KDV solution upto z = 50');