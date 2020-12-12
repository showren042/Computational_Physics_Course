clear;

n = [10, 20, 50, 100, 200, 500, 1000, 2000];
t = zeros(1,length(n));
for i = 1 : length(n)
    tic;
    A = (ones(n(i)) + eye(n(i))) / (n(i) + 1);
    
    logarithm_A = zeros(n(i));
    base_mat = eye(n(i)) - A;
    k = 1;
    
    while (mean(abs((1 / k ) * base_mat), 'all') > eps)
        logarithm_A = logarithm_A - (1 / k ) * base_mat;
        base_mat = base_mat * (eye(n(i)) - A);
        k = k + 1;
    end
    t(i) = toc;
end
