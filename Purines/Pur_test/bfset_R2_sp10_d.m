clear
close all
clc

%% LOAD FILE

Fig1 = dlmread('HB12P_R2_sp10.csv',',',1,1);
Fig2 = dlmread('HB12Pm_R2_sp10.csv',',',1,1);
Fig3 = dlmread('HB22P_R2_sp10.csv',',',1,1);
Fig4 = dlmread('HB22Pm_R2_sp10.csv',',',1,1);

Fig5 = dlmread('HB12P_R2_sp10_d0.csv',',',1,1);
Fig6 = dlmread('HB12Pm_R2_sp10_d0.csv',',',1,1);
Fig7 = dlmread('HB22P_R2_sp10_d0.csv',',',1,1);
Fig8 = dlmread('HB22Pm_R2_sp10_d0.csv',',',1,1);

%% PLOTS

figure(1)
plot_part_bif_b(Fig1,5,12,12,1e-3,1,3,1)
hold on
plot_part_bif_b(Fig2,5,12,12,1e-3,1,3,1)
hold on
plot_part_bif_b(Fig3,5,12,12,1e-3,1,3,1)
hold on
plot_part_bif_b(Fig4,5,12,12,1e-3,1,3,1)
hold on
plot_part_bif_r(Fig5,5,12,12,1e-3,1,3,1)
hold on
plot_part_bif_r(Fig6,5,12,12,1e-3,1,3,1)
hold on
plot_part_bif_r(Fig7,5,12,12,1e-3,1,3,1)
hold on
plot_part_bif_r(Fig8,5,12,12,1e-3,1,3,1)
hold on
axis([0 2 0 2])
% title('Bifurcation set, effect of influx-activated PLC/PKC (R1)')
xlabel('V_{PLC}')
ylabel('K_{PLC}')
text(1.5,1.93,'\sigma_{PLC} = 10','Color','b','FontSize',40)
hold on
text(1.5,1.8,'\sigma_{PLC} = 10, \delta = 0','Color','r','FontSize',40)
grid minor
ax=gca;
set(ax,'Linewidth',4)
ax.FontSize=70;
box off
hold off
set(gcf,'position',[10,10,1750,1400]) %[xpos, ypos, Width, Height]
saveas(gcf,'wu_figure4','epsc')
hold off