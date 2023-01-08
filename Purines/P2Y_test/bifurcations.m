clear 
close all
clc

%% LOAD FILES

load('p2y1_bfdiag.dat')
load('p2y1_bfs_plcvkplc.dat')
load('p2y1_bfset_plcvpkc.dat')
load('p2y1_bfs_plcvdel.dat')
HB1 = dlmread('HB12P.csv',',',1,1);
HB1m = dlmread('HB12Pm.csv',',',1,1);
HB2 = dlmread('HB22P.csv',',',1,1);
HB2m = dlmread('HB22Pm.csv',',',1,1);
Hom = dlmread('Hom1.csv',',',1,1);

%% PLOTS

% figure(1)
% plot(p2y1_bfdiag(1:66,1),p2y1_bfdiag(1:66,2),'k','LineWidth',3)
% hold on
% plot(p2y1_bfdiag(67:388,1),p2y1_bfdiag(67:388,2),'k--','LineWidth',3)
% hold on
% plot(p2y1_bfdiag(389:1378,1),p2y1_bfdiag(389:1378,2),'k','LineWidth',3)
% hold on
% plot(p2y1_bfdiag(1379:1479,1),p2y1_bfdiag(1379:1479,2),'b--','LineWidth',3)
% hold on
% plot(p2y1_bfdiag(1379:1479,1),p2y1_bfdiag(1379:1479,3),'b--','LineWidth',3)
% hold on
% plot(p2y1_bfdiag(1598:2039,1),p2y1_bfdiag(1598:2039,2),'b--','LineWidth',3)
% hold on
% plot(p2y1_bfdiag(1598:2039,1),p2y1_bfdiag(1598:2039,3),'b--','LineWidth',3)
% hold on
% plot(p2y1_bfdiag(2157:end,1),p2y1_bfdiag(2157:end,2),'b--','LineWidth',3)
% hold on
% plot(p2y1_bfdiag(2157:end,1),p2y1_bfdiag(2157:end,3),'b--','LineWidth',3)
% hold on
% plot(p2y1_bfdiag(1480:1597,1),p2y1_bfdiag(1480:1597,2),'g','LineWidth',3)
% hold on
% plot(p2y1_bfdiag(1480:1597,1),p2y1_bfdiag(1480:1597,3),'g','LineWidth',3)
% hold on
% plot(p2y1_bfdiag(2040:2156,1),p2y1_bfdiag(2040:2156,2),'g','LineWidth',3)
% hold on
% plot(p2y1_bfdiag(2040:2156,1),p2y1_bfdiag(2040:2156,3),'g','LineWidth',3)
% axis([0 0.3 0 0.6])
% xlabel('V_{\rm PLC}')
% ylabel('c \muM')
% title('Bifurcation diagram')
% ax=gca;
% set(ax,'Linewidth',6)
% ax.FontSize=70;
% box off
% hold off
% set(gcf,'position',[10,10,1750,1400]) %[xpos, ypos, Width, Height]
% saveas(gcf,'figure1','epsc')

% figure(2)
% plot(p2y1_bfset_plcvpkc(1:50000,1),p2y1_bfset_plcvpkc(1:50000,2),'b','LineWidth',3)
% hold on
% plot(p2y1_bfset_plcvpkc(100006:end,1),p2y1_bfset_plcvpkc(100006:end,2),'g','LineWidth',3)
% hold on
% plot(p2y1_bfset_plcvpkc(50001:100000,1),p2y1_bfset_plcvpkc(50001:100000,2),'b','LineWidth',3)
% xlabel('V_{\rm PLC}')
% ylabel('V_{\rm PKC}')
% legend('HB','PD','Location','Best')
% ax=gca;
% set(ax,'Linewidth',6)
% ax.FontSize=70;
% box off
% hold off
% set(gcf,'position',[10,10,1750,1400]) %[xpos, ypos, Width, Height]
% saveas(gcf,'figure2','epsc')

% figure(3)
% plot(p2y1_bfs_plcvkplc(1:1182,1),p2y1_bfs_plcvkplc(1:1182,2),'b','LineWidth',3)
% hold on
% plot(p2y1_bfs_plcvkplc(4896:5754,1),p2y1_bfs_plcvkplc(4896:5754,2),'k','LineWidth',3)
% hold on
% plot(p2y1_bfs_plcvkplc(2186:3823,1),p2y1_bfs_plcvkplc(2186:3823,2),'b','LineWidth',3)
% hold on
% plot(p2y1_bfs_plcvkplc(1183:2185,1),p2y1_bfs_plcvkplc(1183:2185,2),'b','LineWidth',3)
% hold on
% plot(p2y1_bfs_plcvkplc(3824:4890,1),p2y1_bfs_plcvkplc(3824:4890,2),'b','LineWidth',3)
% hold on
% plot(p2y1_bfs_plcvkplc(5760:end,1),p2y1_bfs_plcvkplc(5760:end,2),'k','LineWidth',3)
% axis([0 2 0 2])
% xlabel('V_{\rm PLC}')
% ylabel('K_{\rm PLC}')
% legend('HB','SNPO','Location','NorthWest')
% ax=gca;
% set(ax,'Linewidth',6)
% ax.FontSize=70;
% box off
% hold off
% set(gcf,'position',[10,10,1750,1400]) %[xpos, ypos, Width, Height]
% saveas(gcf,'figure3','epsc')

% figure(4)
% plot_part_bif(HB1,5,12,12,1e-10,1,3,1)
% hold on
% plot_part_bif(HB1m,5,12,12,1e-10,1,3,1)
% hold on
% plot_part_bif(HB2,5,12,12,1e-10,1,3,1)
% hold on
% plot_part_bif(HB2m,5,12,12,1e-10,1,3,1)
% hold on

figure(5)
plot(p2y1_bfs_plcvdel(1:50000,1),p2y1_bfs_plcvdel(1:50000,2),'b','LineWidth',3)
hold on
plot(p2y1_bfs_plcvdel(50001:end,1),p2y1_bfs_plcvdel(50001:end,2),'b','LineWidth',3)
hold on
h = hline(2.5, {'r--', 'LineWidth', 3});
axis([0 0.5 0 55])
xlabel('V_{\rm PLC}')
ylabel('\delta')
title('Homotopy')
ax=gca;
set(ax,'Linewidth',6)
ax.FontSize=70;
box off
hold off
set(gcf,'position',[10,10,1750,1400]) %[xpos, ypos, Width, Height]
saveas(gcf,'figure5','epsc')

% figure(6)
% plot_part_bif(Hom,5,12,12,1e-10,1,3,1)




















