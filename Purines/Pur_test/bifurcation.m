clear
close all
clc

%% LOAD FILE

load('bfsetvplckplc061019.dat')
load('bfsetvplckplcrec1061019.dat')
load('bfsetvplckplcrec2061019.dat')
load('bfsetvplckplcCC41019.dat')
load('bfsetvplckplcCCrec1.dat')
load('bfsetvplckplcCCrec2.dat')
HB2 = dlmread('HB2P.csv',',',1,1);
HB2_2 = dlmread('HB2P2.csv',',',1,1);
HB2_R1 = dlmread('HB2P_rec1.csv',',',1,1);
HB2_R2 = dlmread('HB2P_rec2.csv',',',1,1);
HB2_2R1 = dlmread('HB2P2_rec1.csv',',',1,1);
HB2_2R2 = dlmread('HB2P2_rec2.csv',',',1,1);

%% PLOTS

% figure(1)
% plot(bfsetvplckplc061019(1:1108,1),bfsetvplckplc061019(1:1108,2),'k','LineWidth',3)
% hold on
% plot(bfsetvplckplc061019(1109:2056,1),bfsetvplckplc061019(1109:2056,2),'k','LineWidth',3)
% hold on
% plot(bfsetvplckplc061019(2062:2141,1),bfsetvplckplc061019(2062:2141,2),'k--','LineWidth',3)
% hold on
% plot(bfsetvplckplc061019(2142:2295,1),bfsetvplckplc061019(2142:2295,2),'k','LineWidth',3)
% hold on
% plot(bfsetvplckplc061019(3548:3596,1),bfsetvplckplc061019(3548:3596,2),'k','LineWidth',3)
% hold on
% plot(bfsetvplckplc061019(4586:4671,1),bfsetvplckplc061019(4586:4671,2),'k--','LineWidth',3)
% hold on
% plot_part_bif(HB2,5,12,12,1e-10,1,3,1)
% hold on
% plot_part_bif(HB2_2,5,12,12,1e-10,1,3,1)
% hold on
% plot(bfsetvplckplcCC41019(1:100000,1),bfsetvplckplcCC41019(1:100000,2),'g','LineWidth',3)
% hold on
% plot(bfsetvplckplcCC41019(100001:101112,1),bfsetvplckplcCC41019(100001:101112,2),'g','LineWidth',3)
% hold on
% plot(bfsetvplckplcCC41019(101113:101388,1),bfsetvplckplcCC41019(101113:101388,2),'g','LineWidth',3)
% hold on
% plot(bfsetvplckplcCC41019(102770:102788,1),bfsetvplckplcCC41019(102770:102788,2),'g','LineWidth',3)
% hold on
% plot(bfsetvplckplcCC41019(150276:153555,1),bfsetvplckplcCC41019(150276:153555,2),'g','LineWidth',3)
% hold on
% plot(bfsetvplckplcCC41019(153556:154620,1),bfsetvplckplcCC41019(153556:154620,2),'b--','LineWidth',3)
% hold on
% plot(bfsetvplckplcCC41019(154621:end,1),bfsetvplckplcCC41019(154621:end,2),'b--','LineWidth',3)
% hold on
% text(1.6,1.94,'\delta = 2.5','Color','k','FontSize',70)
% hold on
% text(1.6,1.8,'\delta = 0','Color','r','FontSize',70)
% hold on
% text(1.6,1.65,'CC','Color','g','FontSize',70)
% % grid minor
% axis([0 2 0 2])
% xlabel('V_{\rm PLC}')
% ylabel('K_{\rm PLC}')
% ax=gca;
% set(ax,'Linewidth',6)
% ax.FontSize=70;
% box off
% hold off
% set(gcf,'position',[10,10,1750,1400]) %[xpos, ypos, Width, Height]
% saveas(gcf,'figure1','epsc')

% RECEPTOR 1
figure(2)
plot_part_bif(HB2_R1,5,12,12,1e-10,1,3,1)
hold on
plot_part_bif(HB2_2R1,5,12,12,1e-10,1,3,1)
hold on
plot(bfsetvplckplcCCrec1(1:1007,1),bfsetvplckplcCCrec1(1:1007,2),'g','LineWidth',3)
hold on
plot(bfsetvplckplcCCrec1(1008:101007,1),bfsetvplckplcCCrec1(1008:101007,2),'g','LineWidth',3)
hold on
plot(bfsetvplckplcCCrec1(101008:102011,1),bfsetvplckplcCCrec1(101008:102011,2),'b--','LineWidth',3)
hold on
plot(bfsetvplckplcCCrec1(102770:102788,1),bfsetvplckplcCCrec1(102770:102788,2),'b--','LineWidth',3)
hold on
plot(bfsetvplckplcCCrec1(102012:103819,1),bfsetvplckplcCCrec1(102012:103819,2),'b--','LineWidth',3)
hold on
plot(bfsetvplckplcCCrec1(103820:103988,1),bfsetvplckplcCCrec1(103820:103988,2),'g','LineWidth',3)
hold on
plot(bfsetvplckplcrec1061019(1:1045,1),bfsetvplckplcrec1061019(1:1045,2),'k','LineWidth',3)
hold on
plot(bfsetvplckplcrec1061019(1046:1723,1),bfsetvplckplcrec1061019(1046:1723,2),'k','LineWidth',3)
hold on
plot(bfsetvplckplcrec1061019(1730:1843,1),bfsetvplckplcrec1061019(1730:1843,2),'k','LineWidth',3)
hold on
plot(bfsetvplckplcrec1061019(2995:3183,1),bfsetvplckplcrec1061019(2995:3183,2),'k','LineWidth',3)
hold on
text(0.01,1.94,'\delta = 2.5','Color','k','FontSize',70)
hold on
text(0.01,1.8,'\delta = 0','Color','r','FontSize',70)
hold on
text(0.01,1.65,'CC','Color','g','FontSize',70)
% grid minor
axis([0 10 0 2])
xlabel('V_{\rm PLC}')
ylabel('K_{\rm PLC}')
ax=gca;
set(ax,'Linewidth',6)
ax.FontSize=70;
box off
hold off
set(gcf,'position',[10,10,1750,1400]) %[xpos, ypos, Width, Height]
saveas(gcf,'figure2','epsc')

% % RECEPTOR 2
% figure(3)
% plot_part_bif(HB2_R2,5,12,12,1e-10,1,3,1)
% hold on
% plot_part_bif(HB2_2R2,5,12,12,1e-10,1,3,1)
% hold on
% plot(bfsetvplckplcCCrec2(1:1086,1),bfsetvplckplcCCrec2(1:1086,2),'g','LineWidth',3)
% hold on
% plot(bfsetvplckplcCCrec2(1087:101086,1),bfsetvplckplcCCrec2(1087:101086,2),'g','LineWidth',3)
% hold on
% plot(bfsetvplckplcCCrec2(101087:102116,1),bfsetvplckplcCCrec2(101087:102116,2),'b--','LineWidth',3)
% hold on
% plot(bfsetvplckplcCCrec2(102117:103013,1),bfsetvplckplcCCrec2(102117:103013,2),'g','LineWidth',3)
% hold on
% plot(bfsetvplckplcCCrec2(104991:105024,1),bfsetvplckplcCCrec2(104991:105024,2),'g','LineWidth',3)
% hold on
% plot(bfsetvplckplcCCrec2(114606:end,1),bfsetvplckplcCCrec2(114606:end,2),'b--','LineWidth',3)
% hold on
% plot(bfsetvplckplcrec2061019(1:1101,1),bfsetvplckplcrec2061019(1:1101,2),'k','LineWidth',3)
% hold on
% plot(bfsetvplckplcrec2061019(1102:2033,1),bfsetvplckplcrec2061019(1102:2033,2),'k','LineWidth',3)
% hold on
% plot(bfsetvplckplcrec2061019(2039:2129,1),bfsetvplckplcrec2061019(2039:2129,2),'k--','LineWidth',3)
% hold on
% plot(bfsetvplckplcrec2061019(2130:2343,1),bfsetvplckplcrec2061019(2130:2343,2),'k','LineWidth',3)
% hold on
% plot(bfsetvplckplcrec2061019(3653:3707,1),bfsetvplckplcrec2061019(3653:3707,2),'k','LineWidth',3)
% hold on
% plot(bfsetvplckplcrec2061019(4688:4789,1),bfsetvplckplcrec2061019(4688:4789,2),'k--','LineWidth',3)
% hold on
% text(0.01,1.94,'\delta = 2.5','Color','k','FontSize',70)
% hold on
% text(0.01,1.8,'\delta = 0','Color','r','FontSize',70)
% hold on
% text(0.01,1.65,'CC','Color','g','FontSize',70)
% % grid minor
% axis([0 2 0 2])
% xlabel('V_{\rm PLC}')
% ylabel('K_{\rm PLC}')
% ax=gca;
% set(ax,'Linewidth',6)
% ax.FontSize=70;
% box off
% hold off
% set(gcf,'position',[10,10,1750,1400]) %[xpos, ypos, Width, Height]
% saveas(gcf,'figure3','epsc')
