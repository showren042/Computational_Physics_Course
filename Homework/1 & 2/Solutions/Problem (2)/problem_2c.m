% This is a script to determine the largest power of 2 that can function 
% without anything going wrong when initial definitions are x = 1 and that 
% is multiplied by 2 in each iterations.
% 
%
%
% Written By- SHOWREN DATTA
% Last Modified On- September 10th, 2020
%**************************************************************************
clear;

% Initialization
x = 1;
product = x;
counter = 0;

% Running iterations and printing in each step to find the largest 
% functionable power of 2
while product ~= inf
    product = product * 2;
    counter = counter + 1;
    fprintf('%d,%d\n',counter,product)
end

% Printing the iteration number after which something goes wrong
stable_counter = counter - 1   % Subtracting 1 as the final iteration leads 
                                           % to unstability