clear;

n = 10;

A = (ones(n) + eye(n)) / (n + 1);

logarithm_A = zeros(n);
base_mat = eye(n) - A;
k = 1;
 
while (mean(abs((1 / k ) * base_mat), 'all') > eps)
    logarithm_A = logarithm_A - (1 / k ) * base_mat;
    base_mat = base_mat * (eye(n) - A);
    k = k + 1;
end

fileID = fopen('logarithm_A_matlab.txt','w');
fprintf(fileID,'%12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f\r\n',logarithm_A);
fclose(fileID);