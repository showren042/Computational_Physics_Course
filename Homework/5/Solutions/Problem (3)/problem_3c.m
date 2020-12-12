clear;

% loading data from given files
data_1 = csvread("data_1.csv");
data_2 = csvread("data_2.csv");
data_3 = csvread("data_3.csv");

% sorting data
tvals_1 = data_1(:,1);
xvals_1 = data_1(:,2);
tvals_2 = data_2(:,1);
xvals_2 = data_2(:,2);
tvals_3 = data_3(:,1);
xvals_3 = data_3(:,2);


% Plotting figures with built-in fit command

% data_1.cvs and single exponential 
f_11 = fit(tvals_1,xvals_1,'exp1');
figure;
plot(f_11,tvals_1,xvals_1);

% data_1.cvs and bi exponential
f_12 = fit(tvals_1,xvals_1,'exp2');
figure;
plot(f_12,tvals_1,xvals_1);

% data_2.cvs and single exponential
f_21 = fit(tvals_2,xvals_2,'exp1');
figure;
plot(f_21,tvals_2,xvals_2);

% data_2.cvs and bi exponential
f_22 = fit(tvals_2,xvals_2,'exp2');
figure;
plot(f_22,tvals_2,xvals_2);

% data_3.cvs and single exponential
f_31 = fit(tvals_3,xvals_3,'exp1');
figure;
plot(f_31,tvals_3,xvals_3);

% data_3.cvs and bi exponential
f_32 = fit(tvals_3,xvals_3,'exp2');
figure;
plot(f_32,tvals_3,xvals_3);