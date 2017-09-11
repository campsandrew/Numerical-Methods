clear

%Values%
M = 1; %Mass
K = 4;
B = 1;
x0 = 2; %initial displacement
v0 = 2; %initial velocity
Int_Time = 15;
%Values%

h = 0.1; %Step Value%


numPoints = Int_Time / h; %Number of points
t = (0:h:Int_Time - h); %x-axis 
k = 1;

y1(1) = x0; %initial values
y2(1) = v0;

while k < numPoints
    p1(1) = y2(k);
    p1(2) = ((-B / M) * y2(k) - (K / M) * y1(k));
    %p1(2) = ((-K / M) * y1(k)); %Problem 4
    p2(1) = y2(k) + (h / 2) * p1(2);
    p2(2) = ((-B / M) * (y2(k) + (h / 2) * p1(2)) - (K / M) * (y1(k) + (h / 2) * p1(1)));
    %p2(2) = ((-K / M) * (y1(k) + (h / 2) * p1(1))); %Problem 4
    p3(1) = y2(k) + (h / 2) * p2(2);
    p3(2) = ((-B / M) * (y2(k) + (h / 2) * p2(2)) - (K / M) * (y1(k) + (h / 2) * p2(1)));
    %p3(2) = ((-K / M) * (y1(k) + (h / 2) * p2(1))); %Problem 4
    p4(1) = y2(k) + h * p3(2);
    p4(2) = ((-B / M) * (y2(k) + h * p3(2)) - (K / M) * (y1(k) + h * p3(1)));
    %p4(2) = ((-K / M) * (y1(k) + h * p3(1))); %Problem 4
    
    y1(k + 1) = y1(k) + h * (p1(1) / 6 + p2(1) / 3 + p3(1)/ 3 + p4(1) / 6); %Potion
    y2(k + 1) = y2(k) + h * (p1(2) / 6 + p2(2) / 3 + p3(2)/ 3 + p4(2) / 6); %Velocity
    y3(k + 1) = ((-B / M) * y2(k) - (K / M) * y1(k)); %Acceleration
    %y3(k + 1) = ((-K / M) * y1(k)); %Acceleration %Problem 4
    k = k + 1;
end

hold on

xlabel('t(seconds)')
ylabel('y-axis')
title('Runge-Kutta 4: Damped Harmonic Oscillator')
%title('Runge-Kutta 4: Damped Harmonic Oscillator(No Friction)') %Problem 4

axis([0 Int_Time -6 6])
%axis([0 Int_Time -12 12]) %Problem 4
plot(t, y1, '-b')
plot(t, y2, '-g')
plot(t, y3, '-r')
plot([0 Int_Time],[0 0], '-k')

legend(' Displacement', ' Velocity', ' Acceleration')