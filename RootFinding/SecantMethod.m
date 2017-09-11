function [ root ] = SecantMethod( fh, x1, x2, epsilon )
%SecantMethod Root finding method using the Secant Method

    xk = x1; %k
    xk1 = x2; %k - 1
    xNew = (fh(xk) * xk1 - fh(xk1) * xk) / (fh(xk) - fh(xk1)); %Initial value to enter loop


    while abs(fh(xNew)) > epsilon %checks for user defined epsilon
    
        xNew = (fh(xk) * xk1 - fh(xk1) * xk) / (fh(xk) - fh(xk1)); %Update equation
        xk1 = xk; %Update new points
        xk = xNew;
    
    end

    root = xNew; %Returns root

end

