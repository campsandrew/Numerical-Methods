function [ root ] = RegulaFalsiMethod( fh, x1, x2, epsilon )
%RegulaFalsiMethod Root finding method that uses the Regula Falsi Method

    xk = x1; %k
    xk1 = x2; %k - 1
    xNew = (fh(xk) * xk1 - fh(xk1) * xk) / (fh(xk) - fh(xk1)); % initial value to enter loop
    
    if((fh(xk) * fh(xk1)) > 0) %Checking if two points are bounding the zero point
       root = false; %return 0
       return
    end
        
   

    while abs(fh(xNew)) > epsilon %Checking user defined epsilon
    
        xNew = (fh(xk) * xk1 - fh(xk1) * xk) / (fh(xk) - fh(xk1)); %Update equation
    
        if((fh(xk) * fh(xk1)) < 0) %Making sure values are bounding the zero
            xk1 = xk; %Updating points
            xk = xNew;
        elseif ((fh(xk1) * fh(xNew)) < 0) %Making sure values are bounding the zero
            xk = xk1; %Updating points
            xk1 = xNew;
        end

    end

    root = xNew; %Returning root


end