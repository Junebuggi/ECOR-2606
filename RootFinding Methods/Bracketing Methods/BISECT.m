function [xr] = BISECT(f, xlow, xhigh, Edes, display)
%BISECT Finds a root by performing a bisection search
%Inputs:
%   f = a function of one variable
%   xlow = lower bound of range to be searched
%   xhigh = upper bound of range to be searched
%   ****f(xlow) and f(xhigh) must have different signs****
%   Edes = tolerance in x (function stops when xr is guaranteed to be
%   within Edes of root
%   display = display option (0 = no output, 1 = output, defaults to 0)
%Outputs:
%   xr = estimate of root

if nargin < 5
    display = 0;
end
ylow = f(xlow);
yhigh = f(xhigh);
if sign(ylow) == sign(yhigh)
    error('No sign change!')
end
if display
    fprintf('step/t xlow/t xhigh/t xr/t yr/t Emax\n');
end

signOfYl = sign(ylow); %keep track of sign of function at xl
for k = 1: 1000 %1000 max iterations
    xr = (xlow + xhigh)/2;
    yr = f(xr);
    Emax = (xhigh - xlow)/2;
    if display
        fprintf('%5d %12.6f %12.6f %12.6f %12.6f %12.6f\n', k, xlow, xhigh, xr, yr, Emax);
    end
    if Emax <=Edes || yr == 0 % error acceptably small or direct hit
        return; % We have found the root
    end
    if sign(yr) == signofYl
        xlow = xr;
    else
        xhigh = xr;
    end
end

