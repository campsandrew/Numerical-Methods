function [ y ] = integrateSimpson( func, h, lower, upper )
%Integrate Simpson's Rule
%   This function takes a numerical integral of a function given the upper
%   and lower bounds and step value using Simpson's Rule

numPoints = ((upper - lower) / h) + 1; %number of points
yA = zeros(1, ceil(numPoints)); %Getting memory
x = zeros(1, ceil(numPoints));
k = 2;

yA(1) = (h / 3) * (func(lower)); %For the first point
x(2) = lower + h;

while k < numPoints %Goes till the point before the last point
    
    if mod(k, 2) == 0
        yA(k) = ((4 * h) / 3) * func(x(k)); %Calculates all the middle points
    else
        yA(k) = ((2 * h) / 3) * func(x(k)); %Calculates all the middle points
    end
    
    k = k + 1; %increments array
    x(k) = x(k - 1) + h; %increments x
    
end


x(k) = x(k - 1) + h;
yA(k) = (h / 3) * func(x(k)); %Caluculates the last point outside the loop

y = sum(yA); %Sets output

end

