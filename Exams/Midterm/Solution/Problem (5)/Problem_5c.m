clear;

r_1 = [0, 0];
r_2 = [0, 1];
r_3 = [0,-1];

v_1 = [0,0];
v_2 = [1,0];
v_3 = [-1,0];



T = 50;
dt = 0.001;
nstep = T / dt;
params = [];
X = [0,0,0,0];

rk4_Pos_Results = r_1;
rk4_vel_Results = v_1;


X(1) = r_1(1);
X(2) = r_1(2);
X(3) = v_1(1);
X(4) = v_1(2);
t = 0;

% loop for calculating x_rk4 for each dt
for iter = 1 : nstep
    X = rk4(X, t, dt, 'deriv', params);
    rk4_Pos_Results = [rk4_Pos_Results X(1) X(2)];
    rk4_vel_Results = [rk4_vel_Results X(3) X(4)];
    t = t + dt;
end