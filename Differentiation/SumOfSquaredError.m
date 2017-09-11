%Problem 1: First derivative of cosine with Two-point formula
clear
h = 0.1;
lowerBound = -pi;
upperBound = pi;

x = lowerBound:0.1:upperBound + 0.1; %x included step values
xDer = lowerBound:h:upperBound + h; %x for two point formula

y1 = firstDeriv(@cos, h, lowerBound, upperBound); %two point formula
y2 = -sin(x);
y3 = cos(x);

hold on

plot(xDer, y1, 'b-')
plot(x, y2, 'r-')
plot(x, y3, 'g-')

axis([lowerBound upperBound -1.5 1.5])
xlabel('x-axis')
ylabel('y-axis')
title('First Derivative 2-point Formula of Cosine')
legend(' 2-point', ' -sin(x)', ' cos(x)')
%%
%Problem 2: First derivative of cosine with improved Two-Point formula
clear
h = 0.1;

lowerBound = -pi;
upperBound = pi;

x = lowerBound:0.1:upperBound + 0.1;
xDer = lowerBound:h:upperBound + h;

y1 = firstDerivImproved(@cos, h, lowerBound, upperBound);
y2 = -sin(x);
y3 = cos(x);

hold on

plot(xDer, y1, 'b-')
plot(x, y2, 'r-')
plot(x, y3, 'g-')

axis([lowerBound upperBound -1.5 1.5])
xlabel('x-axis')
ylabel('y-axis')
title('First Derivative Improved 2-point Formula of Cosine')
legend(' 2-point', ' -sin(x)', ' cos(x)')
%%
%Problem 3: Second Derivative of Cosine with three-point formula
clear
h = 0.1;
lowerBound = -pi;
upperBound = pi;
x = lowerBound:0.1:upperBound + 0.1;
xDer = lowerBound:h:upperBound + h;
y1 = secondDeriv(@cos, h, lowerBound, upperBound);
y2 = -cos(x);
y3 = cos(x);

hold on

plot(xDer, y1, 'b-')
plot(x, y2, 'r-')
plot(x, y3, 'g-')

axis([lowerBound upperBound -1.5 1.5])
xlabel('x-axis')
ylabel('y-axis')
title('Second Derivative 3-point Formula of Cosine')
legend(' 2-point', ' -cos(x)', ' cos(x)')
%%
%Problem 4: Graphs of Error from two point and three point formulas
clear
lowerBound = -pi;
upperBound = pi;

k = 1;
h = 0.00001;
x = lowerBound:h:upperBound + h;
numPoints = 25; %number of h values to try
stepVal = (0.001 - 0.00001) / numPoints; %Spaces them out evenly
xaxis = 0.00001:stepVal:0.001; %for graphing the x

while k <= numPoints + 1; %Loop to try many different h values to graph
    
    y1 = firstDerivImproved(@cos, h, lowerBound, upperBound); %had to use the improved first derivative to match the plot in promt. Not improved one had more error and was higher on the y axis
    y2 = secondDeriv(@cos, h, lowerBound, upperBound); %Three-point formula
    y3 = -cos(x); %Calculated first and second derivatives
    y4 = -sin(x);
    
    error1 = abs(y4 - y1); %Graps the error of both |actual - calculated|
    error1 = error1.^2; %Squares all the errors
    error2 = abs(y3 - y2);
    error2 = error2.^2;
    sumError1(k) = sum(error1); %Sums the total error
    sumError2(k) = sum(error2);

    k = k + 1;
    h = h + stepVal; %To the next size of h
    x = lowerBound:h:upperBound + h; %update the array for x
    
end

hold on

plot(xaxis, sumError1, 'b-')
plot(xaxis, sumError2, 'r-')
set(gca, 'yscale', 'log')
xlabel('Value of h')
ylabel('Sum of Squared Error (SSE)')
title('Error from first (two-point) and second (three-point) derivative')
legend('Error in First Derivative', 'Error in Second Derivative')
axis([0 0.001 10^-16 10^-4])
%%
%Problem 4: Different x-Axis
%commenting is all the same as above problem only change is larger h values
clear
lowerBound = -pi;
upperBound = pi;

k = 1;
h = 0.01;
x = lowerBound:h:upperBound + h;
numPoints = 25;
stepVal = (0.5 - 0.01) / numPoints; %Larger h values here
xaxis = 0.01:stepVal:0.5;

while k <= numPoints + 1;
    
    y1 = firstDerivImproved(@cos, h, lowerBound, upperBound); %had to use the improved first derivative to match the plot in promt. Not improved one had more error and was higher on the y axis
    y2 = secondDeriv(@cos, h, lowerBound, upperBound);
    y3 = -cos(x);
    y4 = -sin(x);
    
    error1 = abs(y4 - y1);
    error1 = error1.^2;
    error2 = abs(y3 - y2);
    error2 = error2.^2;
    sumError1(k) = sum(error1);
    sumError2(k) = sum(error2);

    k = k + 1;
    h = h + stepVal;
    x = lowerBound:h:upperBound + h;
    
end

hold on

plot(xaxis, sumError1, 'b-')
plot(xaxis, sumError2, 'r-')
set(gca, 'yscale', 'log')
xlabel('Value of h')
ylabel('Sum of Squared Error (SSE)')
title('Error from first (two-point) and second (three-point) derivative')
legend('Error in First Derivative', 'Error in Second Derivative')
axis([0 0.5 10^-10 10^0])
%%
%What problem 4 really asked for
%commenting is all the same as above problem only change is different
%formula graphed
clear
lowerBound = -pi;
upperBound = pi;

k = 1;
h = 0.00001;
x = lowerBound:h:upperBound + h;
numPoints = 25;
stepVal = (0.001 - 0.00001) / numPoints;
xaxis = 0.00001:stepVal:0.001;

while k <= numPoints + 1;
    
    y1 = firstDeriv(@cos, h, lowerBound, upperBound); %Not improved two point formula
    y2 = secondDeriv(@cos, h, lowerBound, upperBound);
    y3 = -cos(x);
    y4 = -sin(x);
    
    error1 = abs(y4 - y1);
    error1 = error1.^2;
    error2 = abs(y3 - y2);
    error2 = error2.^2;
    sumError1(k) = sum(error1);
    sumError2(k) = sum(error2);

    k = k + 1;
    h = h + stepVal;
    x = lowerBound:h:upperBound + h;
    
end

hold on

plot(xaxis, sumError1, 'b-')
plot(xaxis, sumError2, 'r-')
set(gca, 'yscale', 'log')
xlabel('Value of h')
ylabel('Sum of Squared Error (SSE)')
title('Error from first (two-point) and second (three-point) derivative')
legend('Error in First Derivative', 'Error in Second Derivative', 'location', 'southeast')
axis([0 0.001 10^-16 10^-2])