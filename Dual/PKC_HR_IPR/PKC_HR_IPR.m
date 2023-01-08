clear
close all
clc

%% Load Files

HB1 = dlmread('HB12P.csv',',',1,1);
HB2 = dlmread('HB22P.csv',',',1,1);
PD = dlmread('PD2P1.csv',',',1,1);
SNP0 = dlmread('SNP2P1.csv',',',1,1);

%% Plots

% plot_part_bif(HB1,5,12,10,0.01,1,2,1)
% plot_part_bif(HB2,5,12,10,0.01,1,2,0)
% plot_part_bif(PD,5,11,10,0.01,1,2,1)
plot_part_bif(SNP0,5,11,10,0.01,1,2,0)