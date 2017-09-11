clear
pi = 3.14159;

f = @(x1,x2,x3,x4,x5,x6,x7,x8,x9,x10) -(sin(x10)*(sin(x1^(2/pi))^(20)) + sin(x9)*(sin(2*x2^(2/pi))^(20)) + ...
    sin(x8)*(sin(3*x3^(2/pi))^(20)) + sin(x7)*(sin(4*x4^(2/pi))^(20)) + sin(x6)*(sin(5*x5^(2/pi))^(20)) + ...
    sin(x5)*(sin(6*x6^(2/pi))^(20)) + sin(x4)*(sin(7*x7^(2/pi))^(20)) + sin(x3)*(sin(8*x8^(2/pi))^(20)) + ...
    sin(x2)*(sin(9*x9^(2/pi))^(20)) + sin(x1)*(sin(10*x10^(2/pi))^(20)));

dim = 10;
domain = [0,pi];
Lambda = .9;
T0 = -2.17;
minTemp = -6.7;
start = [1.9,1.5,2,3,2,1.4,2.6,1.6,0.3,1.6];

[P_best, E_best, iteration] = SA(f, dim, domain, start, T0, Lambda, minTemp);