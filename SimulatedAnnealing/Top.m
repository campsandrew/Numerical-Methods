clear

f = @(x,y)-x*sin(sqrt(abs(x))) - y*sin(sqrt(abs(y)));
dim = 2;
domain = [-500, 500];
minTemp = -300;
start = [150; -40];

Lambda = [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1];
T0 = [300, 200, 100, 50, 10, -20, -100, -150, -200, -250];



for i = 1:1:10
    for j = 1:1:10
        [P_best(i,:,j), E_best(i,:,j)] = SA(f, dim, domain, start, T0(i), Lambda(j), minTemp);
    end
end

RowNames = {'0.1'; '0.2'; '0.3'; '0.4'; '0.5'; '0.6'; '0.7'; '0.8'; '0.9'; '1'};
T0_300 = E_best(1,:)';
T0_200 = E_best(2,:)';
T0_100 = E_best(3,:)';
T0_50 = E_best(4,:)';
T0_10 = E_best(5,:)';
T0_Neg20 = E_best(6,:)';
T0_Neg100 = E_best(7,:)';
T0_Neg150 = E_best(8,:)';
T0_Neg200 = E_best(9,:)';
T0_Neg250 = E_best(10,:)';

table(T0_300, T0_200, T0_100, T0_50, T0_10, T0_Neg20,...
    T0_Neg100, T0_Neg150, T0_Neg200, T0_Neg250, 'RowNames', RowNames)