function [ y ] = integrateGL( func, N, lower, upper )
%Integrate Gauss-Legandre
%   Function import mesh points from .DAT files and calculates the integral
%   of various function using Gauss-Legandre Integration

%Importing the various weights in the data files based on the value of N
if N == 2 
    A = importdata('GAUSS-02.DAT');
elseif N == 4
    A = importdata('GAUSS-04.DAT');
elseif N == 6
    A = importdata('GAUSS-06.DAT');
elseif N == 8
    A = importdata('GAUSS-08.DAT');
elseif N == 10
    A = importdata('GAUSS-10.DAT');
elseif N == 12
    A = importdata('GAUSS-12.DAT');
elseif N == 16
    A = importdata('GAUSS-16.DAT');
elseif N == 24
    A = importdata('GAUSS-24.DAT');
else 
    A = 0;
end

k = 1;
mul = (upper - lower) / 2; %For less clutter

while k <= N %Going through all the mesh points
    
    f = A(k,:); %to grab the right points in the data
    yA(k) = (f(2) * func((mul * f(1)) + ((upper + lower) / 2))); %Part of calculation
    k = k + 1;
    
end

y = mul * sum(yA); %Add all up and multiply by final number

end

