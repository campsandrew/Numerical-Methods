function [ P_best, E_best, iteration] = SA( f, dim, domain, start, T0, Lambda, minTemp )
%SA Function that uses the Simulated Annealing algorithm to calculate the
%global min of a functon specified.

finished = 0;
iteration = 0;
T = T0; %Initial Temp

for i=1:1:dim
    P(i) = {start(i)};
end

E_current = f(P{:}); %Calculate initial current fitness
E_best = E_current;
P_best = P;

while ~finished % Loop until exit criteria met
    iteration = iteration + 1; %Iteration counter
    PTemp = newSol(P, domain(1), domain(2)); % Calls function to modify parameters
    
    for i=1:1:dim
        PNew(i) = {PTemp(i)};
    end
    
    E_temp = f(PNew{:}); %Gets temp
   
    if(E_temp < E_current) %Compares temp to current
      
        E_current = E_temp; %Current becomes temp
        P = PNew;
        if(E_current < E_best) %Checks for best
            E_best = E_current;
            P_best = P;
            if(E_best < minTemp)
                finished = 1;   %Exit if reached goal
            end
        end
    else
        X = rand; 
        if(X < exp(-(E_temp - E_best) / T)) %Accept with a certain probability
            E_current = E_temp;
            P = PNew;
        end
    end
   
    T = Lambda * T; %Cooling
   
    if(T < minTemp)
        finished = 1;   % Exit criteria
    end
    
end

end


function mu = newSol(x, Lb, Ub)
    mu = Lb + (Ub - Lb) .* rand(size(x)); % modifies parameters
end
