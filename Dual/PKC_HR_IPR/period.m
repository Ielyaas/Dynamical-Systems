clear 
close all
clc

%% Load files

po = dlmread('PO1.csv',',',[225 1 702 20]);
load('perp.mat')

%
% figure(1)
% plot(perp(508:803,1),perp(508:803,2),'k','LineWidth',4)
% xlabel('IP_3 pulse intensity')
% ylabel('period (s)')
% % title('Hormone-induced')
% set(gca,'FontSize',20)
% ax=gca;
% set(ax,'Linewidth',6)
% ax.FontSize=70;
% box off
% hold off
% set(gcf,'position',[10,10,1750,1400]) %[xpos, ypos, Width, Height]
% saveas(gcf,'Slide8a','epsc')

figure(2)
plot_part_bif_per(po,5,7,20,0.01,1,4,0)
xlabel('[Agonist]')
ylabel('period (s)')
% title('Hormone-induced')
set(gca,'FontSize',20)
ax=gca;
set(ax,'Linewidth',6)
ax.FontSize=70;
box off
hold off
set(gcf,'position',[10,10,1750,1400]) %[xpos, ypos, Width, Height]
saveas(gcf,'figure8b','epsc')