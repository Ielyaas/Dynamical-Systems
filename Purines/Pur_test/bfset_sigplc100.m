clear
close all
clc

%% LOAD FILE

IN0 = dlmread('HB2P.csv',',',1,1);
IN0_D0 = dlmread('HB2P_d0.csv',',',1,1);
IN1 = dlmread('HB2P_in1.csv',',',1,1);
IN1_D0 = dlmread('HB2P_in1_d0.csv',',',1,1);

%% PLOTS

% figure(1)
% plot_part_bif_b(IN0,5,12,12,1e-10,1,3,1)
% hold on
% plot_part_bif_g(IN0_D0,5,12,12,1e-10,1,3,1)

figure(2)
plot_part_bif_k(IN1,5,12,12,1e-10,1,3,1)
hold on
plot_part_bif_r(IN1_D0,5,12,12,1e-10,1,3,1)