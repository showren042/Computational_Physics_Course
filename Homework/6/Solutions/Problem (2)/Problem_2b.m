clear;

N = input ('Enter number of grid points on each side: ');
L = 2;
h = L / (N-1);
x = (0:N-1)*h;
y = (0:N-1)*h;

phi_0 = 1; % Potential at y=0;
phi = phi_0 * 4 / (pi*sinh(pi))*sin(pi*x'/L)*sinh(pi*y/L);

phi(1,:) = 0;
phi(N,:) = 1;
phi(:,1) = 0;
phi(:,N) = 0;
newphi = phi;
changesum = 0;
