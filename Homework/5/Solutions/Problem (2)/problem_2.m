clear;

% Initialization
x_0 = 3;
y_0 = 3;

% Storing initial values as (n-1)-th step datapoint
x_n_1 = x_0;
y_n_1 = y_0;

% Declaring given functions F(x,y) and G(x,y)
syms x y
F = x * x * exp( - x * x ) + y * y;
G = x^4 / ( 1 + x * x * y * y );

% Finding partial derivatives
F_x = vpa(diff(F,x));
F_y = vpa(diff(F,y));
G_x = vpa(diff(G,x));
G_y = vpa(diff(G,y));

% Initialization
x_n = 1;
y_n = 1;

% "While loop" until the tolerance is exceeded
while (abs(x_n - x_n_1) > eps) || (abs(y_n - y_n_1) > eps)

    % Cyclic restoring of datapoints
    x_temp = x_n_1;
    y_temp = y_n_1;
    x_n_1 = x_n;
    y_n_1 = y_n;
    
    % Calculating x_n
    x_n = x_temp + (subs(G_y, {x,y}, {x_temp,y_temp}) - ...
        subs(F_y, {x,y}, {x_temp,y_temp}) + ...
        GG(x_temp,y_temp) * subs(F_y, {x,y}, {x_temp,y_temp}) - ...
        FF(x_temp,y_temp) * subs(G_y, {x,y}, {x_temp,y_temp})) / ...
        (subs(F_x, {x,y}, {x_temp,y_temp}) * subs(G_y, {x,y}, {x_temp,y_temp}) - ...
        subs(F_y, {x,y}, {x_temp,y_temp}) * subs(G_x, {x,y}, {x_temp,y_temp}));
    
    % Calculating y_n
    y_n = y_temp + (subs(F_x, {x,y}, {x_temp,y_temp}) - ...
        subs(G_x, {x,y}, {x_temp,y_temp}) + ...
        FF(x_temp,y_temp) * subs(G_x, {x,y}, {x_temp,y_temp}) - ...
        GG(x_temp,y_temp) * subs(F_x, {x,y}, {x_temp,y_temp})) / ...
        (subs(F_x, {x,y}, {x_temp,y_temp}) * subs(G_y, {x,y}, {x_temp,y_temp}) - ...
        subs(F_y, {x,y}, {x_temp,y_temp}) * subs(G_x, {x,y}, {x_temp,y_temp}));
end

% Checking whether F(x*,y*) = G(x*,y*) = 1
test_1 = vpa(FF(x_n, y_n));
test_2 = vpa(GG(x_n, y_n));


% Declaring given function F(x,y) as FF(x,y)
function z = FF(x,y)
z = x * x * exp( - x * x ) + y * y;
end

% Declaring given function G(x,y) as GG(x,y)
function w = GG(x,y)
w = x^4 / ( 1 + x * x * y * y );
end