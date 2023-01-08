clear
close all
clc

%% LOAD FILES

Fig1 = dlmread('HB12P_R1_sp10.csv',',',1,1);
Fig2 = dlmread('HB12Pm_R1_sp10.csv',',',1,1);
Fig3 = dlmread('HB22P_R1_sp10.csv',',',1,1);
Fig4 = dlmread('HB22Pm_R1_sp10.csv',',',1,1);

Fig5 = dlmread('HB12P_R1_sp10_in0.csv',',',1,1);
Fig6 = dlmread('HB12Pm_R1_sp10_in0.csv',',',1,1);
Fig7 = dlmread('HB22P_R1_sp10_in0.csv',',',1,1);
Fig8 = dlmread('HB22Pm_R1_sp10_in0.csv',',',1,1);

Fig9 = dlmread('HB12P_R1_sp0_in1.csv',',',1,1);
Fig10 = dlmread('HB12Pm_R1_sp0_in1.csv',',',1,1);
Fig11 = dlmread('HB22P_R1_sp0_in1.csv',',',1,1);
Fig12 = dlmread('HB22Pm_R1_sp0_in1.csv',',',1,1);

Fig13 = dlmread('HB12P_R1_sp0_in0.csv',',',1,1);
Fig14 = dlmread('HB12Pm_R1_sp0_in0.csv',',',1,1);
Fig15 = dlmread('HB22P_R1_sp0_in0.csv',',',1,1);
Fig16 = dlmread('HB22Pm_R1_sp0_in0.csv',',',1,1);

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
plot_part_bif_g(Fig5,5,12,12,1e-3,1,3,1)
hold on
plot_part_bif_g(Fig6,5,12,12,1e-3,1,3,1)
hold on
plot_part_bif_g(Fig7,5,12,12,1e-3,1,3,1)
hold on
plot_part_bif_g(Fig8,5,12,12,1e-3,1,3,1)
hold on
plot_part_bif_k(Fig9,5,12,12,1e-3,1,3,1)
hold on
plot_part_bif_k(Fig10,5,12,12,1e-3,1,3,1)
hold on
plot_part_bif_k(Fig11,5,12,12,1e-3,1,3,1)
hold on
plot_part_bif_k(Fig12,5,12,12,1e-3,1,3,1)
hold on
plot_part_bif_r(Fig13,5,12,12,1e-3,1,3,1)
hold on
plot_part_bif_r(Fig14,5,12,12,1e-3,1,3,1)
hold on
plot_part_bif_r(Fig15,5,12,12,1e-3,1,3,1)
hold on
plot_part_bif_r(Fig16,5,12,12,1e-3,1,3,1)
hold on
axis([0 2 0 2])
% title('Bifurcation set, effect of influx-activated PLC/PKC (R1)')
xlabel('V_{PLC}')
ylabel('K_{PLC}')
text(1.4,1.93,'\sigma_{PLC} = 10, PKC_i = 1','Color','b','FontSize',45)
hold on
text(1.4,1.8,'\sigma_{PLC} = 10, PKC_i = 0','Color','g','FontSize',45)
hold on
text(1.4,1.67,'\sigma_{PLC} = 0, PKC_i = 1','Color','k','FontSize',45)
hold on
text(1.4,1.54,'\sigma_{PLC} = 0, PKC_i = 0','Color','r','FontSize',45)
% grid
ax=gca;
set(ax,'Linewidth',6)
ax.FontSize=70;
box off
hold off
set(gcf,'position',[10,10,1750,1400]) %[xpos, ypos, Width, Height]
saveas(gcf,'wu_figure2','epsc')
hold off