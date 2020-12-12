clear;

% Initialization
n = 50;
M = zeros(n,n);
b_0 = ones(n,1);
b_k = b_0(:);

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

% Initialization
difference = 1.0;
limit = 0.0;
k = 0;

% While Loop for finding k_max
while (difference >= limit)
    b_k_prev = b_k;
    b_k = M * b_k_prev / sqrt(b_k_prev' * b_k_prev);
    difference = sqrt((b_k - b_k_prev)'*(b_k - b_k_prev));
    limit = 10^(-6) * sqrt(b_k'*b_k);
    k=k+1;
end

% Finding the element to element ratio of b_k to v_max
element_ratio = b_k ./ v_max;

% Finding the maximum of all the ratios
Max = max(element_ratio);

% Diving each element of element_ratio by the maximum value and finding
% its element by element deviation from a column vector of which each entry
% is 1
proportionality_constant = (Max)^-1 * element_ratio;
deviation = b_0 - proportionality_constant;

% For the final proof of M * b_k is appromately equal to lambda_max * b_k
Left = M * b_k;
Right = lambda_max * b_k;

% Finding the element by element deviation
error = abs(Left - Right);