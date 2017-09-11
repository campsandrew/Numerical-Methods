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
w = sqrt(K / M);
freq = w / (2 * pi);
T = 1 / freq;


numPoints = Int_Time / h; %Number of points
t = (0:h:Int_Time - h); %x-axis 
k = 1;

y1(1) = x0; %initial values
y2(1) = v0;

while k < numPoints
    y1(k + 1) = y1(k) + h * y2(k); %Potion
    %y2(k + 1) = y2(k) + h * ((-K / M) * y1(k)); %Velocity %Problem 4
    y2(k + 1) = y2(k) + h * ((-B / M) * y2(k) - (K / M) * y1(k)); %Velocity
    %y3(k + 1) = ((-K / M) * y1(k)); %Acceleration %Problem 4
    y3(k + 1) = ((-B / M) * y2(k) - (K / M) * y1(k)); %Acceleration
    k = k + 1;
end

%testt = t(4) + T; %Random test point
%testT = t(3631); % = t + T
%testPoint1 = 1.01 * y1(4); %checking for <= 1%
%testOneTLater = y1(3631);

hold on

xlabel('t(seconds)')
ylabel('y-axis')
title('Eulers Method: Damped Harmonic Oscillator')

%axis([0 Int_Time -20 20]) %Problem 4
axis([0 Int_Time -6 6])
plot(t, y1, '-b')
plot(t, y2, '-g')
plot(t, y3, '-r')
plot([0 Int_Time],[0 0], '-k')

legend(' Displacement', ' Velocity', ' Acceleration')