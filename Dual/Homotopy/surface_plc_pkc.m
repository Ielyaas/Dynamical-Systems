clear
close all
clc

n = 207;        % Equilibrium Solutions
m = 208;        % Periodic Orbits

le = 1000;
lp = 10000;

xe = zeros(le,n);
ye = zeros(le,n);
ze = zeros(le,n);

xp = zeros(lp,m);
yp = zeros(lp,m);
zp = zeros(lp,m);

d = dir();
data_e = cell(n,1);
data_p = cell(m,1);
counte = 0;
countp = 0;


for i = 1:size(d)
    if startsWith(d(i).name,'Eq_V_pkc')
        data_e{counte+1} = csvread(d(i).name,1,1);
        plot_part_bif(data_e{counte+1},5,9,18,0.01,1,2,1)
        counte = counte + 1;
    end
    if startsWith(d(i).name,'PO_V_pkc')
%         disp('bla')
        data_p{countp+1} = csvread(d(i).name,1,1);
        plot_part_bif(data_p{countp+1},5,9,18,0.01,1,2,0)
        countp = countp + 1;
    end
    pause(0.01)
end

%% Plots


% per1_3D = dlmread('per1_3D.csv',',',1,1);
% per2_3D = dlmread('per2_3D.csv',',',1,1);

plot_part_bif(data_e,5,7,10,0.01,1,2,1)
plot_part_bif(data_p,5,8,15,0.01,1,2,0)

