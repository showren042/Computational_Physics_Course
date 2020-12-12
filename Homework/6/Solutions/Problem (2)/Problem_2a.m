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

for i = 2 : (N-1)
    for j = 2 : (N-1)
        newphi = 0.25 * (phi(i+1,j) + phi(i-1,j) + phi(i,j+1) + phi(i,j+1));
        changesum = changesum + abs (1 - phi(i,j)/newphi);
        phi(i,j) = newphi;
    end
end

figure;
cLevels = 0:0.1:1;
cs = contour(x,y,flipud(rot90(phi)),cLevels);
title('contour plot for Laplace Equation')