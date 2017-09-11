%Problem 1: Trapazoid Rule
clear
h(1) = 0.1; %Step Widths
h(2) = 0.01;
h(3) = 0.001;
lowerBound = -5; %Bounds
upperBound = 5;

y(1) = integrateTrap(@(x)exp(2*x), h(1), lowerBound, upperBound); %Inegrating using the Trapazoid rule with each step width
y(2) = integral(@(x)exp(2*x), lowerBound, upperBound); %Analytical Integral for gnu
y(3) = integrateTrap(@(x)exp(2*x), h(2), lowerBound, upperBound);
y(4) = integral(@(x)exp(2*x), lowerBound, upperBound);
y(5) = integrateTrap(@(x)exp(2*x), h(3), lowerBound, upperBound);
y(6) = integral(@(x)exp(2*x), lowerBound, upperBound);

z = [0.3, 0.6, 1.3, 1.6, 2.3, 2.6]; %For gnu plotting
A = [z;y];
A = A';

save('Problem1.DAT', 'A', '-ASCII'); %Export to .txt for gnuplot to read

%%
%Problem 2: Simpson's Rule
clear
h(1) = 0.1; %Step Widths
h(2) = 0.01;
h(3) = 0.001;
lowerBound = -5; %Bounds
upperBound = 5;

y(1) = integrateSimpson(@(x)exp(2*x), h(1), lowerBound, upperBound); %Inegrating using Simpson's rule with each step width
y(2) = integral(@(x)exp(2*x), lowerBound, upperBound); %Analytical Integral for gnu
y(3) = integrateSimpson(@(x)exp(2*x), h(2), lowerBound, upperBound);
y(4) = integral(@(x)exp(2*x), lowerBound, upperBound); %Analytical Integral for gnu
y(5) = integrateSimpson(@(x)exp(2*x), h(3), lowerBound, upperBound);
y(6) = integral(@(x)exp(2*x), lowerBound, upperBound); %Analytical Integral for gnu

z = [0.3, 0.6, 1.3, 1.6, 2.3, 2.6]; %For gnu plotting
A = [z;y];
A = A';

save('Problem2.DAT', 'A', '-ASCII'); %Export to .txt for gnuplot to read

%%
%Problem 3: GL Integration
clear
k = 1;
num = 16;
N(1) = 2; %Mesh Points
N(3) = 4;
N(5) = 6;
N(7) = 8;
N(9) = 10;
N(11) = 12;
N(13) = 16;
N(15) = 24;
lowerBound = -5; %Bounds
upperBound = 5;

while k <= num
    if mod(k, 2) == 1
        y(k) = integrateGL(@(x)exp(x * 2), N(k), lowerBound, upperBound); %Inegrating using GL with each number of mesh points
    else
        y(k) = integral(@(x)exp(2*x), lowerBound, upperBound); %Analytical Integral for gnu
    end
    k = k + 1;
end

z = [0.2, 0.4, 0.8, 1, 1.4, 1.6, 2, 2.2, 2.6, 2.8, 3.2, 3.4, 3.8, 4, 4.4, 4.6]; %For gnu plotting
A = [z;y];
A = A';

save('Problem3.DAT', 'A', '-ASCII'); %Export to .txt for gnuplot to read
