function [ root ] = NewtonMethod( fh, der, x1, epsilon )
%NewtonMethod Root finding method that uses the 1D Newton method using also
%the first derivative of the function.

xNew = x1;

while abs(fh(xNew)) > epsilon %Checking user defined epsilon

    xNew = xNew - (fh(xNew) / der(xNew)); %Update equation
    
end

root = xNew; %Returning root
