function [xr] = MOD_SECANT(f,x0, delta, Edes, display)
% MOD_SECANT Finds a root by performing a secant search.
% Inputs:
% f - a function of one variable
% x0 - first initial value
% delta – perturbation
% Edes = tolerance in x (function stops when approximate error becomes less than Edes)
% Outputs:
% xr - estimate of root
if nargin < 5
    display = 0;
end

if display
    fprintf(' Step\t   X(i)\t    f(Xi)\t      delta\t\t Xr\n');
end
xi = x0;
for k = 1: 100 %100 max iterations

    xr = xi - delta*xi*f(xi)/(f(xi+delta*xi)- f(xi));
    ynew = round(f(xr),3);
    Ea = abs(xi - xr);
    if display
        fprintf ('%5.0f %10.3f %10.3f %10.3f %10.3f\n', k, xi, f(xi), delta, xr);
    end
    if Ea <= Edes || ynew == 0 %error is acceptably small or direct hit
        if display
            fprintf ('Secant search has converged.\n'); 
        end
        return;
    end
     xi = xr;
end 
end

