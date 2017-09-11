clear all; 
close all;
clc;
% ------------------------------------------------------------------------
%  The Program KAP9 calculates the potential profile of an electron
%      lens. The lens consists of a plate condenser with a hole through
%      it and with two attached metal tubes.
%     --Fixed quantities--
%      MMAX:   Dimension of the integration mesh in the direction of
%              the axis of the tubes (z direction) (MMAX=100)
%              
%      NMAX:   Dimension of the integration mesh in the direction
%              perpendicular to the axis of symmetry (r direction)
%              (NMAX=50)
%              
%      PHI1:   Value of half the voltage applied to the plate
%              condenser in units of 1 Volt (PHI1=1000.)
%              
%      EPS:    Accuracy criterion for discontinuing the iteration in
%              units of 1 Volt (EPS=1.D-7*PHI1)
%              
%     --Input quantities--
%      M:      Plate semi-separation distance in units of the
%              integration mesh constant h
%              
%      N:      Tube radius in units of h
%              
%      PHI0 :  Initial potential in units of 1 Volt
%              
%      W:      Over-relaxation factor
%              
%     --Output quantities--
%     ITERA:  Number of the actual iteration
%              
%      EPSMAX: Maximum potential variation in the current iteration
%              in units of 1 Volt
%              
%      PHI:    Potential values on the integration mesh
%              in units of 1 Volt,
%              PHI(I,K) is the potential value at the point z = I*h,
%              r = K*h
%             
%
% ------------------------------------------------------------------------

% Display Header
disp('Module 7')
disp('Calculation of Electric Fields by the Method of Successive Over-Relaxation')
disp(' ')

%  Assign Initial Contants
NMAX = 50; 
MMAX = 2 * NMAX; 
PHI1 = 1000;
PHI = zeros(MMAX+1,NMAX+1);
EPS = 1*10^-7*PHI1;
RPLOT = 0.32 * NMAX;
ZPLOT = 0.25 * MMAX;
IPLOT = 10; ILINE = 25;
Z = []; R = []; array = [];

%  Read input from the user
M = input(['Half separation distance M of the flanges, in [h] (2 <= M <= ',num2str(MMAX/5),'): M = ']);
N = input(['Tube Radius N in [h] (2 <= N <= ',num2str(NMAX/4),'): N = ']);
PHI0 = input('Initial Potential PHI0 in [V]: PHI0 = ');
W = input('Over-Relaxation factor W (1.0 <= W < 2.0): W = ');

itera = 1;
%%%%%% Set the initial voltage values %%%%%%
% Set I.V. between plates
for K = 1:NMAX
    for I = 2:M
        PHI(I,K) = ((I-1) * PHI0) / M;
    end
end
% Set I.V. inside tube
for K = 1:N
    for I = M+1:MMAX
        PHI(I,K) = PHI0;
    end
end
% Set I.V. on border
for K = 1:NMAX+1
    PHI(1,K) = 0.0;
end
for I = 2:M
    PHI(I,NMAX+1) = ((I-1) * PHI1) / M;
end
% Set BCs (PHI1)
for K = N+1:NMAX+1
    PHI(M+1,K) = PHI1;
end
for I = M+2:MMAX+1
    PHI(I,N+1) = PHI1;
end
for K = 1:N
    PHI(MMAX+1,K) = PHI1;
end
EPSMAX = 1;
while abs(EPSMAX) > EPS
    EPSMAX = 0;
    for K = 1:NMAX
        if(K < N+1)
            MGRENZ = MMAX - 1;
        else
            MGRENZ = M - 1;
        end
        for I = 2:MGRENZ+1
            
            PHIOLD = PHI(I,K);
            
            %%%% CALCULATE UPDATE POTENTIALS HERE ACCORDING TO OFF-AXIS AND
            %%%% AXIS FORMULAS AS DISCUSSED IN CLASS    %%%% 

            if(K == 1)
                U = (1 / 6) * (PHI(I + 1, K) + PHI(I - 1, K) + 4 * PHI(I, K + 1));
            else
                U = (1 / 4) * (PHI(I, K + 1) + PHI(I, K - 1) + PHI(I + 1, K) + PHI(I - 1, K)) + (1 / (8 * K)) * (PHI(I, K + 1) - PHI(I, K - 1));
            end       

            %%%% INSERT UPDATE EQUATION ACCORDING TO METHOD OF SUCCESSIVE
            %%%% OVER-RELAXATION AS DISCUSSED IN CLASS  %%%%
            
            PHI(I,K) = PHIOLD + W * (U - PHIOLD);
            
            if(abs(PHI(I,K) - PHIOLD) > abs(EPSMAX))
                EPSMAX = PHI(I,K) - PHIOLD;
            end
        end
    end

    itera = itera + 1;
end

WIDTH = PHI1 / IPLOT;
PHI2 = round(PHI);
PHI = PHI2;
count = 1;
for IP = IPLOT : - 1 : 1
    POT = (IP-1) * WIDTH;
    array = [array count-1];
    for K = 1:NMAX+1;
        if(K < N+1)
            MGRENZ = MMAX+1;
        else
            MGRENZ = M+1;
        end
        for I = MGRENZ : - 1 : 1
            if((PHI(I,K) <= POT) && (POT < PHI(I+1,K)))
                R(count) = K-1;
                Z(count) = (I-1) + ((POT - PHI(I,K)) / (PHI(I+1,K) - PHI(I,K)));
                count = count + 1;
            end
            if((K < NMAX+1) && (PHI(I,K) < POT) && (POT < PHI(I,K+1)))
                R(count) = (K-1) + ((POT - PHI(I,K)) / (PHI(I,K+1) - PHI(I,K)));
                Z(count) = I-1;
                count = count + 1;
            end     
        end
    end 
end


for i = 1:length(array)-1
    plot(Z(1,array(i)+1:array(i+1)),R(1,array(i)+1:array(i+1)),'r'); hold on;
    plot(-Z(1,array(i)+1:array(i+1)),R(1,array(i)+1:array(i+1)),'r'); hold on;
    plot(Z(1,array(i)+1:array(i+1)),-R(1,array(i)+1:array(i+1)),'r'); hold on;
    plot(-Z(1,array(i)+1:array(i+1)),-R(1,array(i)+1:array(i+1)),'r'); hold on;
end

%  Ploting of the lens for all the quadrants.
    
x1 = M; x2 = ZPLOT; y1 = N; y2 = RPLOT;

%  First Quadrant
line([x1 x2],[y1 y1]);hold on
line([x2 x2],[y2 y2]);hold on;
line([x2 x1],[y2 y2]);hold on;
line([x1 x1],[y2 y1]);hold on;
line([x1 x2],[y1 y2]);hold on;
line([x1 x2],[y2 y1]);hold on;
line([x2 x1],[y1 y1]);hold on;
line([x2 x2],[y2 y1]);hold on;


%  Second Quadrant
line([-x1 -x2],[y1 y1]);hold on
line([-x2 -x2],[y2 y2]);hold on;
line([-x2 -x1],[y2 y2]);hold on;
line([-x1 -x1],[y2 y1]);hold on;
line([-x1 -x2],[y1 y2]);hold on;
line([-x1 -x2],[y2 y1]);hold on;
line([-x2 -x1],[y1 y1]);hold on;
line([-x2 -x2],[y2 y1]);hold on;

%  Third Quadrant
line([x1 x2],[-y1 -y1]);hold on
line([x2 x2],[-y2 -y2]);hold on;
line([x2 x1],[-y2 -y2]);hold on;
line([x1 x1],[-y2 -y1]);hold on;
line([x1 x2],[-y1 -y2]);hold on;
line([x1 x2],[-y2 -y1]);hold on;
line([x2 x1],[-y1 -y1]);hold on;
line([x2 x2],[-y2 -y1]);hold on;

%  Fourth Quadrant
line([-x1 -x2],[-y1 -y1]);hold on
line([-x2 -x2],[-y2 -y2]);hold on;
line([-x2 -x1],[-y2 -y2]);hold on;
line([-x1 -x1],[-y2 -y1]);hold on;
line([-x1 -x2],[-y1 -y2]);hold on;
line([-x1 -x2],[-y2 -y1]);hold on;
line([-x2 -x1],[-y1 -y1]);hold on;
line([-x2 -x2],[-y2 -y1]);hold on;

%  TO represent the field of view of the plot
axis([-ZPLOT ZPLOT -RPLOT RPLOT]);
hold on;
ylabel('k (Distance of r-axis in units of h)');
xlabel('i (Distance of z-axis in units of h)');
title('Chapter 9: Electrical Field Lines');
PHI3 = zeros(size(PHI));
for i = 1:size(PHI,1)
    PHI3(i,1:size(PHI,2)) = PHI(size(PHI,1)-i+1,1:size(PHI,2));
end
disp(' ')
U = input('Numerical output required  (Y/N) ? ','s');
if(U == 'y' || U == 'Y')
    disp(PHI);
    warning off all;
    xlswrite('inverted_phi.xls',PHI');
    warning off all;
    xlswrite('phi.xls',fliplr(flipud(PHI3')));
    warning off all;
end

disp(' ')
W = input('Rerun program with completely new values (Y/N) ? ','s');
if(W == 'y' || W == 'Y')
    hw5;
else
    disp(' ')
    disp('End of the Program!');
end
