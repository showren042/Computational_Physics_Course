clear;

% Loading data from given files
data_1 = csvread("data_1.csv");
data_2 = csvread("data_2.csv");
data_3 = csvread("data_3.csv");

% Sorting data
tvals_1 = data_1(:,1);
xvals_1 = data_1(:,2);
tvals_2 = data_2(:,1);
xvals_2 = data_2(:,2);
tvals_3 = data_3(:,1);
xvals_3 = data_3(:,2);

% Initial value used as input. We have 4 parameters in our fit function
vals=[10,5,100,50];


% Finding the bestfit for 3 different dataset
bestfit_1=fminsearch(@(x)lsquares(tvals_1,xvals_1,@fitfunction,x),vals);
bestfit_2=fminsearch(@(x)lsquares(tvals_2,xvals_2,@fitfunction,x),vals);
bestfit_3=fminsearch(@(x)lsquares(tvals_3,xvals_3,@fitfunction,x),vals);
% minimize the squared error.  Note that matlab doesn't have an easy
% single function that performs a least squares search, so we had to 
% define a function to do it by defining lsquares (squared error between  
% data and fit), and using the fminsearch function to minimize that.


% plotting data and fit for data_1.cvs
figure; 
hold on
plot(tvals_1,xvals_1,'o')
plot(tvals_1,fitfunction(tvals_1,bestfit_1),'k','Linewidth',2)
xlabel('t');
ylabel('x(t)');
title('Plot using data\_1.csv'); 

% plotting data and fit for data_2.cvs
figure;
hold on
plot(tvals_2,xvals_2,'o')
plot(tvals_2,fitfunction(tvals_2,bestfit_2),'k','Linewidth',2)
xlabel('t');
ylabel('x(t)');
title('Plot using data\_2.csv');

% plotting data and fit for data_3.cvs
figure;
hold on
plot(tvals_3,xvals_3,'o')
plot(tvals_3,fitfunction(tvals_3,bestfit_3),'k','Linewidth',2)
xlabel('t');
ylabel('x(t)');
title('Plot using data\_3.csv');


% declaring the fitfunction
function x=fitfunction(t,params)
    A=params(1);
    tau_1=params(2);
    B=params(3);
    tau_2=params(4);
    x = A * exp( - t / tau_1 ) + B * exp( -t / tau_2 );  %our fit function
end

% declaring the leastsquare function
function d=lsquares(tvals,xvals,fitfunction,params)  %computes the squared error between fit and data
    d=sum((xvals-fitfunction(tvals,params)).^2);
end