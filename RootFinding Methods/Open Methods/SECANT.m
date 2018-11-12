function [xr] = SECANT(f,x0,x1,Edes, display)
% SECANT Finds a root by performing a secant search.
% Inputs:
% f - a function of one variable
% x0 - first initial value
% x1 - second initial value
% Edes = tolerance in x (function stops when approximate error becomes less than Edes)
% Outputs:
% xr - estimate of root
if nargin < 5
    display = 0;
end
xim1 = x0;
fxim1 = f(xim1);
xi = x1;
fxi = f(xi);
if display
    fprintf(' Step X(im1) X(i) X(im1)-X(i) f(Xim1) f(Xi) Xr f(Xr) EA\n');
end
for k = 1: 100 %100 max iterations
    Xdif = xim1 - xi;
    xr = round((xi-((xi-xim1)/(fxi - fxim1))*fxi),3);
    ynew = round(f(xr),3);
    Ea = abs(xi - xr);
    if display
        fprintf ('%5.0f %10.3f %10.3f %10.3f %10.3f %10.3f %10.3f %10.3f %10.3f\n', k, xim1, xi, Xdif, fxim1,fXi, xr, ynew, Ea);
    end
    if Ea <= Edes || ynew == 0 %error is acceptably small or direct hit
        if display
            fprintf ('Secant search has converged.\n'); 
        end
        return;
    end
     Xim1 = Xi;
 fxim1 = fXi;
 Xi = xr;
 fXi = ynew;
end 
end

