clear
close all
clc

%% Mesh

n = 500;
m = 1;

l = 675;

c = zeros(l,n);
ct = zeros(l,n);
h = zeros(l,n);

%% Import data

d = dir();
data = cell(n,1);
count = 1;

for i = 1:size(d)
    if startsWith(d(i).name,'Eq_h')
        data{count} =csvread(d(i).name,1,1);

        count = count +1;
    end
end

%% Plot

c = [];
ct = [];
h = [];

for i = 1:n
    
%     c(:,i) = data{i}(1:l,8);
%     ct(:,i) = data{i}(1:l,5);
%     h(:,i) = data{i}(1:l,7);

      c = [c;data{i}(1:l,8)];
      ct = [ct;data{i}(1:l,5)];
      h = [h;data{i}(1:l,7)];
      
end

f = fit([c h],ct,'cubicinterp');

figure(1)
[X,Y] = meshgrid(0:0.001:1,0.0005:0.001:0.45);
surf(f(X,Y),Y,X,'lines','none','facecolor',[0.2 0.2 0.2],'facealpha',0.3)
% surf(ct,h,c,'lines','none','facecolor',[0.2 0.2 0.2],'facealpha',0.3)
hold on
% plot3(ct,h,c)

% plot3(data1(:,5),data1(:,9),data1(:,8))
% axis([0 3 0 0.2 0 1])

%% Parameter values

param_ct.Kf = 10; param_ct.Kc = 0.2; param_ct.Kp = 0.2; param_ct.Kb = 0.4;
param_ct.tau_max = 100; param_ct.K_tau = 0.09; param_ct.Kh = 0.08;
param_ct.Vs = 0.9; param_ct.Kbar = 1.957e-5; param_ct.Ks = 0.2;
param_ct.tau_p = 1; param_ct.R_act = 0.51; param_ct.K_PLC = 0.1;
param_ct.Vpm = 0.11; param_ct.Kpm = 0.3;
param_ct.alpha0 = 0.0027; param_ct.alpha1 = 0.015; param_ct.Kce = 14;
param_ct.delta = 2.5; param_ct.gamma = 5.5; param_ct.epsilon = 0.1;
    
%% ODE solve

hep_sol = @(x,t)hep_SOCC_ct_h(x,t,param_ct);
opts = odeset('RelTol',1e-6,'AbsTol',1e-9);
[T,Y] = ode15s(hep_sol,[0 200],[0.078,0.525273,1.283961,0],opts);
[T,Y] = ode15s(hep_sol,0:0.001:5000,Y(end,:),opts);

%% Solution

plot3(Y(:,3),Y(:,2),Y(:,1),'r','LineWidth',2)
zlabel('Ca^{2+}_i \muM')
xlabel('Ca^{2+}_t \muM')
ylabel('h')
ax=gca;
set(ax,'Linewidth',3)
ax.FontSize=20;
box off
% grid off   

