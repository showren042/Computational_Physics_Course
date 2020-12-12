
clear;

x_0 = 0;
v_0 = 1;
T = 5;
dt = [0.5, 0.1, 0.05, 0.01, 0.005, 0.001];
results = zeros(2, length(dt));
g1 = zeros(1,length(dt));
g2 = zeros(1,length(dt));

% Loop for each element of dt

for i = 1 : length(dt)
    nstep = T / dt(i);
    
    params = [];
    X = [0, 0];
    sampleTimes = ( 1 : (nstep + 1) )*dt(i);
    
    rk4Results = x_0;
    verletResults = x_0;
    
    
    X(1) = x_0;
    X(2) = v_0;
    t = 0;
    
    % loop for calculating x_rk4 for each dt
    for iter = 1 : nstep
        X = rk4(X, t, dt(i), 'deriv', params);
        rk4Results = [rk4Results X(1)];
        t = t + dt(i);
    end
    
    
    X(2) = x_0;
    xNew = x_0 + dt(i) * v_0 + dt(i) * dt(i) * (-x_0) / 2;
    X(1) = xNew;
    verletResults = [verletResults xNew];
    t = 0;
    
    % loop for calculating x_verlet for each dt
    for iter = 1 : nstep - 1
        xCurrent = X(1);
        xNew = 2 * X(1) - X(2) + dt(i) * dt(i) * (-xCurrent);
        X(1) = xNew;
        X(2) = xCurrent;
        verletResults = [verletResults xNew];
        t = t + dt(i);
    end
    
    results(1, i) = rk4Results(1,end);
    results(2, i) = verletResults(1,end);
    g1(1, i) = abs(sin(T) - results(2,i));
    g2(1, i) = abs(sin(T) - results(1,i));
end

% Plotting the required log-log
 plot(log(dt),log(g1),'k'); hold on;
 plot(log(dt),log(g2),'r'); 
 xlabel('\Deltat');
 ylabel('g(\Deltat) = |sin(T) - x(T)|');
 legend('g1','g2','Location','best');