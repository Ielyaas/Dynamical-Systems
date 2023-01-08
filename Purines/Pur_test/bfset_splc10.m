clear
close all
clc

%% LOAD DATA

Fig1 = dlmread('HB2P_rec1sig_plc10_test.csv',',',1,1);
Fig2 = dlmread('HB2P_rec1sig_plc10_del0_test.csv',',',1,1);

%% PLOTS

figure(1)
plot_part_bif_b(Fig1,5,12,12,1e-3,1,3,1)
hold on
plot_part_bif_g(Fig2,5,12,12,1e-3,1,3,1);
axis([0 2 0 2])