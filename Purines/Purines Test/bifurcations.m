clear
close all
clc

%% LOAD FILES

eq = dlmread('Eq.csv',',',1,1);
po = dlmread('PO1.csv',',',1,1);
HB = dlmread('HB2P.csv',',',1,1);
HB2 = dlmread('HB2P2.csv',',',1,1);
HB3 = dlmread('HB2P3.csv',',',1,1);

%% PLOTS

% figure(1)
% plot_part_bif(HB,5,12,12,0.01,1,2,1)
% 
% figure(2)
% plot_part_bif(HB2,5,12,12,0.01,1,2,1)

figure(3)
plot_part_bif(HB3,5,12,12,0.01,1,2,1)