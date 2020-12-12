clear;

% Initialization
n = 50;
M = zeros(n,n);
b_0 = ones(n,1);


% Loop for constructing the matrix M
for i = 1 : n
    for j = 1 : n
        if abs(i - j) < 3
            M(i,j) = 1;
        end
    end
end

% Using built-in MATLAB commands to find diagonal matrix D of eigenvalues 
% and matrix V whose columns are the corresponding right eigenvectors 
[V,D] = eig(M);

% Finding largest eigenvalue lambda_max and its index I
[lambda_max,I] = max(max(D));

% Using the index I to extract eigenvector v_max from V
v_max = V(:,I);
