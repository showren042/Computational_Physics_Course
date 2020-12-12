% This is a function to implement the Gram-Shmidt orthogonalization (GSO)
% for two arbitrary 3-Dimensional COLUMN VECTORs
% Input :
%       a => 1st arbitrary column vector (3x1)
%       b => 2nd arbitrary column vector (3x1)
% Output:
%       v1,v2 => two orthogonal column vectors
%
% To test the correctness of answer you can check 
%                   (v1.v2) = 0     
%
% Written By- SHOWREN DATTA
% Last Modified On- September 11th, 2020
%**************************************************************************

function [v1,v2] = problem_3(a,b)

% Setting v1 equal to a
v1 = a;

% Calculating (a.b)/|a|^2, which is a scalar quantity
scalar = a' * b / ( a' * a );

% Finding the direction vector 'vec' along v2 
vec = b - scalar * a;

% Finding the value of c, that ensures |v2|=|b|
c = sqrt (b' * b)/ sqrt (vec' * vec);

% Finally calculating v2 
v2 = c * vec;

end