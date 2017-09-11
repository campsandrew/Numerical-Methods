function [ y ] = firstDerivImproved( fh, h, lower, upper )
%First Derivative Improved Two-Point Formula
%   Calculates the derivative of a function when provided a function, h the step value, upper and lower bounds

numPoints = (upper - lower) / (h) + 1; %Number of points
yA = zeros(1, ceil(numPoints)); %Inizalization
x = zeros(1, ceil(numPoints));
k = 1;
x(1) = lower;

while k <= numPoints + 1
   yA(k) = (fh(x(k) + h) - fh(x(k) - h)) / (2 * h); %Improved two point calculation
   k = k + 1;
   x(k) = x(k - 1) + h;
    
end

y = yA;

end

