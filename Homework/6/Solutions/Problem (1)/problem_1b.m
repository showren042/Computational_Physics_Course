%  A Program to find the neutron density as a function of time using the
%  Crank-Nicolson scheme

clear;

%* Initialize parameters (grid spacing, time step, etc.)
N = input('Enter number of grid points: '); % 1000 recommended
D = [1,10,100];
C = 1;
L = 100;              % System extends from 0 to L
h = L/(N-1);          % Grid size
x = h*(0:N-1);        % Coordinates  of grid points
tau = input('Enter time step: ');           % 0.01 recommended
T = 10;
nstep = T/tau;
time = linspace(0,10,N);

A = zeros(N);  % Set all elements to zero

for i=2:(N-1)
  A(i,i-1) = 1;
  A(i,i) = -2;  % Set interior rows
  A(i,i+1) = 1;
end

% First and last rows for reflecting boundary conditions
A(1,:) = A(3,:);
A(N,:) = A(N-2,:);

for ii = 1 : length(D)
    dCN = (inv(eye(N)-.5*(D(ii)*tau/h^2)*A) * (eye(N)+.5*(D(ii)*tau/h^2)*A));
    
    rho = zeros(N,1);
    rho(N/2,1) = 1/h;
    
    for i = 1: nstep
        rho = dCN*rho;
    end
    
    plot(time,rho,'Linewidth',2); hold on
end

xlabel('Time,t');
ylabel('Neutron Density, \rho');
legend('D = 1','D = 10','D = 100')

         
