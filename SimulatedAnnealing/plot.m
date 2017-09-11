function plotFun( x0, x1, y0, y1 )
%plotFun Function that graphs the f(x,y) = -x.* sin(sqrt(abs(x)))
%- y.* sin(sqrt(abs(y))).


x = x0:5:x1;
y = y0:5:y1;

[x, y] = meshgrid(x, y);

fxy = -x.* sin(sqrt(abs(x))) - y.* sin(sqrt(abs(y)));

mesh(x, y, fxy);
xlabel('x-axis') %Axis and title labeling
ylabel('y-axis')
zlabel('z-axis')
title('f(x,y)=-x*sin(sqrt(abs(x)))-y*sin(sqrt(abs(y)))')

end

