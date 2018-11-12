function [x] = BABYLON( input_args )
%   Fixed Point Iterations: The Basics
%   -Rearrange the function f(x) = 0 so that x is on the left-hand side of
%   the equation: x = g(x)
%   -use the new function g to predict a new value of x, that is x_i+1 =
%   g(x_i)
%   BABYLON Uses Babylo9nian technique to find the square root of a value.
% Inputs: N = value of interest
% Outputs: x = square root of N
xold = 0.1; % or xold = N
for k = 1 : 20 %20 is the number of iterations
    x = 0.5*(xold + N/xold);
    change = abs(x - xold); %change is the absolute estimated error
    fprintf ('x(%d) = %f, absolute change = %f\n', k, x, change );
    if change < 1e-6
        fprintf ('Babylonian technique has converged.\n');
        return;
    end
    xold = x; %get ready for next iterations
end
error ('Babylonian technique has not converged.');
end


