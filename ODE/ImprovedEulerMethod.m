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
    %p2(1) = ((-K / M) * y1(k)); %problem4
    p2(1) = ((-B / M) * y2(k) - (K / M) * y1(k));
    p1(2) = y2(k) + h * p2(1);
    %p2(2) = ((-K / M) * (y1(k) + h * p1(1))); %problem4
    p2(2) = ((-B / M) * (y2(k) + h * p2(1)) - (K / M) * (y1(k) + h * p1(1)));
    y1(k + 1) = y1(k) + (h / 2) * (p1(1) + p1(2)); %Potion
    y2(k + 1) = y2(k) + (h / 2) * (p2(1) + p2(2)); %Velocity
    %y3(k + 1) = ((-K / M) * y1(k)); %Acceleration problem4
    y3(k + 1) = ((-B / M) * y2(k) - (K / M) * y1(k)); %Acceleration
    k = k + 1;
end

hold on

xlabel('t(seconds)')
ylabel('y-axis')
%title('Improved Eulers Method: Damped Harmonic Oscillator(No Friction)') %Problem4
title('Improved Eulers Method: Damped Harmonic Oscillator') 

%axis([0 Int_Time -12 12]) %Problem4
axis([0 Int_Time -6 6])
plot(t, y1, '-b')
plot(t, y2, '-g')
plot(t, y3, '-r')
plot([0 Int_Time],[0 0], '-k')

legend(' Displacement', ' Velocity', ' Acceleration')