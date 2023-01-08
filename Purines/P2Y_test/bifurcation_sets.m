clear
close all
clc

%% LOAD FILE

% Receptor 1
FIG1 = dlmread('HB2P_rec1del0in0.csv',',',1,1);
FIG1m = dlmread('HB2P_rec1del0in0m.csv',',',1,1);
FIG2 = dlmread('HB2P_rec1del0in1.csv',',',1,1);
FIG2m = dlmread('HB2P_rec1del0in1m.csv',',',1,1);
FIG3 = dlmread('HB2P_rec1del1in0.csv',',',1,1);
FIG3m = dlmread('HB2P_rec1del1in0m.csv',',',1,1);
FIG4 = dlmread('HB2P_rec1del1in1.csv',',',1,1);
FIG4m = dlmread('HB2P_rec1del1in1m.csv',',',1,1);

% Receptor 2
FIG5 = dlmread('HB2P_rec2del0in0.csv',',',1,1);
FIG5m = dlmread('HB2P_rec2del0in0m.csv',',',1,1);
FIG6 = dlmread('HB2P_rec2del0in1.csv',',',1,1);
FIG6m = dlmread('HB2P_rec2del0in1m.csv',',',1,1);
FIG7 = dlmread('HB2P_rec2del1in0.csv',',',1,1);
FIG7m = dlmread('HB2P_rec2del1in0m.csv',',',1,1);
FIG8 = dlmread('HB2P_rec2del1in1.csv',',',1,1);
FIG8m = dlmread('HB2P_rec2del1in1m.csv',',',1,1);

%% PLOTS

% figure(1)
% plot_part_bif_b(FIG1,5,12,12,1e-3,1,3,1);
% hold on
% plot_part_bif_b(FIG1m,5,12,12,1e-3,1,3,1)
% hold on
% plot_part_bif_g(FIG3,5,12,12,1e-3,1,3,1);
% hold on
% plot_part_bif_g(FIG3m,5,12,12,1e-3,1,3,1)
% axis([0 2 0 2])
% title('Receptor 1 (no influx activated PKC)')
% xlabel('V_{PLC}')
% ylabel('K_{PLC}')
% text(0.01,1.94,'\delta = 2.5','Color','g','FontSize',70)
% hold on
% text(0.01,1.8,'\delta = 0','Color','r','FontSize',70)
% grid
% ax=gca;
% set(ax,'Linewidth',6)
% ax.FontSize=70;
% box off
% hold off
% set(gcf,'position',[10,10,1750,1400]) %[xpos, ypos, Width, Height]
% % saveas(gcf,'bfset_figure1','epsc')
% hold off

% figure(2)
% plot_part_bif_b(FIG2,5,12,12,1e-10,1,3,1)
% hold on
% plot_part_bif_b(FIG2m,5,12,12,1e-10,1,3,1)
% hold on
% plot_part_bif_g(FIG4,5,12,12,1e-10,1,3,1)
% hold on
% plot_part_bif_g(FIG4m,5,12,12,1e-10,1,3,1)
% axis([0 2 0 2])
% title('Receptor 1 (influx activated PKC)')
% xlabel('V_{PLC}')
% ylabel('K_{PLC}')
% text(0.01,1.94,'\delta = 2.5','Color','g','FontSize',70)
% hold on
% text(0.01,1.8,'\delta = 0','Color','r','FontSize',70)
% grid
% ax=gca;
% set(ax,'Linewidth',6)
% ax.FontSize=70;
% box off
% hold off
% set(gcf,'position',[10,10,1750,1400]) %[xpos, ypos, Width, Height]
% saveas(gcf,'bfset_figure2','epsc')
% hold off
% 
figure(3)
plot_part_bif_b(FIG5,5,12,12,1e-10,1,3,1)
hold on
plot_part_bif_b(FIG5m,5,12,12,1e-10,1,3,1)
hold on
plot_part_bif_g(FIG7,5,12,12,1e-10,1,3,1)
hold on
plot_part_bif_g(FIG7m,5,12,12,1e-10,1,3,1)
axis([0 2 0 2])
title('Receptor 2 (no influx activated PKC)')
xlabel('V_{PLC}')
ylabel('K_{PLC}')
text(0.01,1.94,'\delta = 2.5','Color','g','FontSize',70)
hold on
text(0.01,1.8,'\delta = 0','Color','r','FontSize',70)
grid
ax=gca;
set(ax,'Linewidth',6)
ax.FontSize=70;
box off
hold off
set(gcf,'position',[10,10,1750,1400]) %[xpos, ypos, Width, Height]
saveas(gcf,'bfset_figure3','epsc')
hold off
% 
% figure(4)
% plot_part_bif_b(FIG6,5,12,12,1e-10,1,3,1)
% hold on
% plot_part_bif_b(FIG6m,5,12,12,1e-10,1,3,1)
% hold on
% plot_part_bif_g(FIG8,5,12,12,1e-10,1,3,1)
% hold on
% plot_part_bif_g(FIG8m,5,12,12,1e-10,1,3,1)
% axis([0 2 0 2])
% title('Receptor 2 (influx activated PKC)')
% xlabel('V_{PLC}')
% ylabel('K_{PLC}')
% text(0.01,1.94,'\delta = 2.5','Color','g','FontSize',70)
% hold on
% text(0.01,1.8,'\delta = 0','Color','r','FontSize',70)
% grid
% ax=gca;
% set(ax,'Linewidth',6)
% ax.FontSize=70;
% box off
% hold off
% set(gcf,'position',[10,10,1750,1400]) %[xpos, ypos, Width, Height]
% saveas(gcf,'bfset_figure4','epsc')
% hold off
