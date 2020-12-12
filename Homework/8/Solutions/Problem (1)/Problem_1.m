clear;

rng(1,'twister')

T = 10;
div = 10;
n = 100000;
dist = zeros(1, (T-1) * div);

for i = 1 : n
    x = rand;
    r = T ^ x;
    k = floor((r - 1) * div);
    dist(1,k+1) = dist(1,k+1) + (div / n);
end

t = 1 : (T - 1) * div;
t = t / div + 1;
tlgT = log(T) * t;
inv = tlgT.^(-1);

plot(t,dist,'o'); hold on;
plot(t,inv,'Linewidth',2);
xlabel('x');
ylabel('p(x)');
