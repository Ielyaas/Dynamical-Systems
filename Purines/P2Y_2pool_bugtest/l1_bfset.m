clear
close all
clc

%% LOAD FILE

Fig1 = dlmread('Hom_l1_H1.csv',',',1,1);
Fig2 = dlmread('Hom_l1_H11.csv',',',1,1);
Fig3 = dlmread('Hom_l1_H2.csv',',',1,1);
Fig4 = dlmread('Hom_l1_H21.csv',',',1,1);
Fig5 = dlmread('Hom_l1_H3.csv',',',1,1);
Fig6 = dlmread('Hom_l1_H31.csv',',',1,1);
Fig7 = dlmread('Hom_l1_H4.csv',',',1,1);
Fig8 = dlmread('Hom_l1_H41.csv',',',1,1);

%% PLOTS

figure(1)
plot_part_bif_b(Fig1,5,12,12,1e-3,1,3,1);
hold on
plot_part_bif_b(Fig2,5,12,12,1e-3,1,3,1)
hold on
plot_part_bif_g(Fig3,5,12,12,1e-3,1,3,1);
hold on
plot_part_bif_g(Fig4,5,12,12,1e-3,1,3,1)
hold on
plot_part_bif_k(Fig5,5,12,12,1e-3,1,3,1);
hold on
plot_part_bif_k(Fig6,5,12,12,1e-3,1,3,1)
hold on
plot_part_bif_r(Fig7,5,12,12,1e-3,1,3,1);
hold on
plot_part_bif_r(Fig8,5,12,12,1e-3,1,3,1)
title('Receptor 1 (no influx activated PKC)')
xlabel('V_{PLC}')
ylabel('\lambda_3')
ax=gca;
set(ax,'Linewidth',6)
ax.FontSize=70;
box off
hold off
set(gcf,'position',[10,10,1750,1400]) %[xpos, ypos, Width, Height]
% saveas(gcf,'bfset_figure1','epsc')
hold off