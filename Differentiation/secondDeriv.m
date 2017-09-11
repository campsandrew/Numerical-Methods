function [ y ] = secondDeriv( fh, h, lower, upper )
%Second Derivative using Three-Point Formula
%   Calculates the second derivative of a function given the function, h
%   the step size, lower and upper bounds

numPoints = (upper - lower) / (h) + 1; %Number of points
yA = zeros(1, ceil(numPoints)); %Initialization
x = zeros(1, ceil(numPoints));
k = 1;
x(1) = lower;

while k <= numPoints + 1
   yA(k) = (fh(x(k) + h) + fh(x(k) - h) - (2 * fh(x(k)))) / (h * h); %Calculation of three point formula
   k = k + 1;
   x(k) = x(k - 1) + h;
    
end

y = yA;

end

