function [y] = firstDeriv( fh, h, lowerBound, upperBound )
%First Derivative Two-Point Formula
%   Calculates the derivative of a function when provided a function, h the step value, upper and lower bounds

numPoints = (upperBound - lowerBound) / (h) + 1; %Number of points
yA = zeros(1, ceil(numPoints)); %inizialization
x = zeros(1, ceil(numPoints));
k = 1;
x(1) = lowerBound; %Sets first value in array

while k <= numPoints + 1 %goes through all the points
   yA(k) = (fh(x(k) + h) - fh(x(k))) / h; %Actual calculation
   k = k + 1;
   x(k) = x(k - 1) + h; %Increase the step
    
end

y = yA; %Set output

end

