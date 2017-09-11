function [ root ] = BisectionMethod( fh, x1, x2, epsilon )
%BisectionMethod Root finding method that uses the Bisection Method. The
%points will always bound the zero. If initial values do not bound zero
%then the function will return zero


    a = x1;
    b = x2;
    m = (x2 + x1) / 2; %Initial condition is met to enter loop

    if((fh(x1) * fh(x2)) > 0) %Checking to see if initial points are valid
        root = false; %return 0
        return
    end

    while abs(fh(m)) > epsilon %Checking user defined epsilon
        
        if(fh(m) < 0 ) %If new point is negative replace the negative bound
            b = m;
        elseif (fh(m) > 0) %If new point is positive replace positive bound
            a = m;
        end
        
        m = (a + b) / 2; %Midpoint update equation
        
        
    end
    
    root = m; %Return root

end

