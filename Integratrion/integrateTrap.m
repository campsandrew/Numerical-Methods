function [ y ] = integrateTrap( func, h, lower, upper )
%Integrate Trapazoid Rule
%   This function takes a numerical integral of a function given the upper
%   and lower bounds and step value using the Trapazoid Rule

numPoints = ((upper - lower) / h) + 1; %number of total points
yA = zeros(1, ceil(numPoints)); %getting memory
x = zeros(1, ceil(numPoints));
k = 2;

yA(1) = (h / 2) * (func(lower)); %for the first point
x(2) = lower + h;

%yT(1) = func(lower) * (h / 2);% First point calculated without the loop
%x(2) = lower + h; %First point to be used in the loop

while k < numPoints %Goes till the point before the last point
    yA(k) = h * func(x(k)); %Calculates all the middle points
    k = k + 1; %increments array
    x(k) = x(k - 1) + h; %increments x
end


x(k) = x(k - 1) + h;
yA(k) = (h / 2) * func(x(k)); %Caluculates the last point outside the loop

y = sum(yA); %Sets output
