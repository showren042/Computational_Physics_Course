% This is a script to generate the bufurcation diagram for the logistic map
%                x_(n+1) = r * x_n / {1 + (x_n)^2}
%                           for r = [1,15]
%
% Written By- SHOWREN DATTA
% Last Modified On- September 14th, 2020
%**************************************************************************

clear;

max_iteration = 10000;                           % max number of iterations
max_period = 256;                                % max number of periods
start_testing = max_iteration - max_period;      % starting point
numdiv = 5000;                                   % increment in 'r' value
tolerance = 1e-8;

% Creating text files to store bifurcation and period data
bfile = fopen('bifurcations_6b.txt','w');
pfile = fopen('periods_6b.txt','w');

for riter = 0:(numdiv - 1)
    r = 1.0 + 14.0 * (riter) / numdiv;           % iterating value of 'r'
                                                 % for r = [1,15]
    x = 0.001;                                   % Initializing x
    xobs = 0;
    period = max_period;
    
    for iter = 0:(max_iteration - 1)             % Calling the function
        x = logistic_calculate(r,x);             %  logistic_calculate
    
        if iter == start_testing
            xobs = x;
            fprintf(bfile,'%f',r);               % storing value of 'r'
        end
        
        if iter > start_testing
            fprintf(bfile,',%f',x);              % storing value of 'x'
            if abs(x - xobs) < tolerance
                period = iter - start_testing; 
            end
        end
    end
    fprintf(bfile,'\n');
    fprintf(pfile,'%f,%f\n',r,period);           % storing values of 'r'
                                                    % and period
end

% Importing the data from generated text file
data = load('bifurcations_6b.txt');

hold all

% Plotting the first column ('r-data') against rest of the columns ('x-data')
plot(data(:,1),data(:,2:end),'.','MarkerSize',1,'color','black');

% Plot caption at the top of the plot
title('bifurcation diagram');

%puts a box all around the plot (instead of just x-y axes)
box on

% Labelling the axes and fixing the font sizes
xlabel('r','FontSize',12);
ylabel('x_n','FontSize',12);
 
% Stores the figure to a png file
saveas(gcf,'bifurcation_diagram_6b','png');

hold off

% Declaring the logistic_calculate function
function x = logistic_calculate(r,x)
	x = r * x / (1 + x^2);
end
