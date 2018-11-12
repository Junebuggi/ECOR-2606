function [xr] = NEWTON(f, fp, x0, Edes, display)
% NEWTON Finds a root by performing a Newton-Raphson search.
% Inputs:
% f = a function of one variable
% fp = derivative of the function
% x0 = initial guess at root
% Edes = tolerance in x (function stops when change in x <= Edes)
% display = display option (0 = no output, 1 = output, defaults to 0)
% Outputs:
% xr = estimate of root
if nargin < 5
    display = 0; %default setting for display
end
if display
    fprintf(' step\t xold\t f(x)\t fd(x)\t xr\t yr\t Ea\n');
end
xold = x0;
for k = 1 : 100 % 100max iterations
    ff = f(xold);  
    fd = fp(xold);
    xr = xold - f(xold)/fp(xold);
    yr = f(xr);
    Ea = abs(xr - xold);
    if display
        fprintf ('%5d %12.6f %12.6f %12.6f %12.6f %12.6f %12.6f\n', k,xold,ff,fd, xr, yr, Ea);
    end
    if Ea <= Edes || yr == 0 % error is acceptably small or direct hit
        return;
    end
    xold = xr;
end 
error('Newton-Raphson search has not converged.');
end
    

