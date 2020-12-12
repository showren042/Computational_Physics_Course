clear;

% lower bounds for three different roots such that f(a(i))<0
a = [-2 2 6];

% upper bounds for three different roots such that f(b(i))>0
b = [0 0 12];

% Initialization of roots

% Caution :
% If initial root is chosen to be at the "wrong side" of vicinity of
% roots, iterated from other bounds, desired result can't be found 
root = [0 0.1 1.5];

% "for loop" that accounts for 3 different probable roots
for i = 1: length(a)
    % "while loop" to maintain the tolerance
    while (abs(a(i) - root(i)) >= 10^-6) || (abs(b(i) - root(i)) >= 10^-6)
        % upgradation of the lower bound
        if f(root(i)) < 0
            a(i) = root(i);
        % upgradation of the upper bound    
        else
            b(i) = root(i);
        end
        % upgradation of root(i) by taking the average of current lower and
        % upper bounds
        root(i) = (a(i) + b(i))/2;
    end
end

% Declaration of the given function
function y = f(x)
y = exp(x) - x^4;
end