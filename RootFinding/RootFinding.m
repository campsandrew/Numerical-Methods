function [ Newton, Secant, Regula, Bisection ] = RootFinding( fh, der, x1, x2, epsilon )
%RootFinding Function that calls four different root finding methods and
%returns the roots found by each method

Newton = NewtonMethod(fh, der, x1, epsilon); %Newton Method 1D
Secant = SecantMethod(fh, x1, x2, epsilon); %Secant Method
Regula = RegulaFalsiMethod(fh, x1, x2, epsilon); %Regula Falsi Method
Bisection = BisectionMethod(fh, x1, x2, epsilon); %Bisection Method

end

