clear
close all
clc

load('Vpkc0.mat')
figure(1)
plot(Vpkc0(1:11,4),Vpkc0(1:11,12),'r','LineWidth',2)
hold on
plot(Vpkc0(48:293,4),Vpkc0(48:293,12),'r','LineWidth',2)
hold on
plot(Vpkc0(12:47,4),Vpkc0(12:47,12),'k--','LineWidth',2)
hold on
plot(Vpkc0(294:324,4),Vpkc0(294:324,7),'b--','LineWidth',2)
hold on
plot(Vpkc0(294:324,4),Vpkc0(294:324,12),'b--','LineWidth',2)
hold on
plot(Vpkc0(339:end,4),Vpkc0(339:end,7),'b--','LineWidth',2)
hold on
plot(Vpkc0(339:end,4),Vpkc0(339:end,12),'b--','LineWidth',2)
hold on
plot(Vpkc0(324:338,4),Vpkc0(324:338,7),'g','LineWidth',2)
hold on
plot(Vpkc0(324:338,4),Vpkc0(324:338,12),'g','LineWidth',2)
axis([0 1.5 0 0.7])
xlabel('V_{plc} \muMs^{-1}')
ylabel('[Ca^{2+}_i] \muM')
set(gca,'FontSize',40,'fontweight','b','fontname','arial')
ax=gca;
set(ax,'Linewidth',3)
ax.FontSize=30;
box off

load('Vpkc01.mat')
figure(2)
plot(Vpkc01(1:117,4),Vpkc01(1:117,12),'r','LineWidth',2)
hold on
plot(Vpkc01(1092:2795,4),Vpkc01(1092:2795,12),'r','LineWidth',2)
hold on
plot(Vpkc01(118:1091,4),Vpkc01(118:1091,12),'k--','LineWidth',2)
hold on
plot(Vpkc01(2796:5619,4),Vpkc01(2796:5619,7),'b--','LineWidth',2)
hold on
plot(Vpkc01(2796:5619,4),Vpkc01(2796:5619,12),'b--','LineWidth',2)
hold on
plot(Vpkc01(5907:end,4),Vpkc01(5907:end,7),'b--','LineWidth',2)
hold on
plot(Vpkc01(5907:end,4),Vpkc01(5907:end,12),'b--','LineWidth',2)
hold on
plot(Vpkc01(5620:5906,4),Vpkc01(5620:5906,7),'g','LineWidth',2)
hold on
plot(Vpkc01(5620:5906,4),Vpkc01(5620:5906,12),'g','LineWidth',2)
axis([0 25 0 0.7])
xlabel('V_{plc} \muMs^{-1}')
ylabel('[Ca^{2+}_i] \muM')
set(gca,'FontSize',40,'fontweight','b','fontname','arial')
ax=gca;
set(ax,'Linewidth',3)
ax.FontSize=30;
box off

load('Vpkc04.mat')
figure(3)
plot(Vpkc04(1:150,4),Vpkc04(1:150,12),'r','LineWidth',2)
hold on
plot(Vpkc04(1206:2792,4),Vpkc04(1206:2792,12),'r','LineWidth',2)
hold on
plot(Vpkc04(151:1205,4),Vpkc04(151:1205,12),'k--','LineWidth',2)
hold on
plot(Vpkc04(2793:2900,4),Vpkc04(2793:2900,7),'b--','LineWidth',2)
hold on
plot(Vpkc04(2793:2900,4),Vpkc04(2793:2900,12),'b--','LineWidth',2)
hold on
plot(Vpkc04(3162:end,4),Vpkc04(3162:end,7),'b--','LineWidth',2)
hold on
plot(Vpkc04(3162:end,4),Vpkc04(3162:end,12),'b--','LineWidth',2)
hold on
plot(Vpkc04(2901:3161,4),Vpkc04(2901:3161,7),'g','LineWidth',2)
hold on
plot(Vpkc04(2901:3161,4),Vpkc04(2901:3161,12),'g','LineWidth',2)
axis([0 25 0 0.7])
xlabel('V_{plc} \muMs^{-1}')
ylabel('[Ca^{2+}_i] \muM')
set(gca,'FontSize',40,'fontweight','b','fontname','arial')
ax=gca;
set(ax,'Linewidth',3)
ax.FontSize=30;
box off

load('Vpkc1.mat')
figure(4)
plot(Vpkc1(1:19,4),Vpkc1(1:19,12),'r','LineWidth',2)
hold on
plot(Vpkc1(128:284),Vpkc1(128:284,12),'y','LineWidth',2)
hold on
plot(Vpkc1(20:127,4),Vpkc1(20:127,12),'k--','LineWidth',2)
hold on
plot(Vpkc1(285:308,4),Vpkc1(285:308,7),'b--','LineWidth',2)
hold on
plot(Vpkc1(285:308,4),Vpkc1(285:308,12),'b--','LineWidth',2)
hold on
plot(Vpkc1(336:end,4),Vpkc1(336:end,7),'b--','LineWidth',2)
hold on
plot(Vpkc1(336:end,4),Vpkc1(336:end,12),'b--','LineWidth',2)
hold on
plot(Vpkc1(309:335,4),Vpkc1(309:335,7),'g','LineWidth',2)
hold on
plot(Vpkc1(309:335,4),Vpkc1(309:335,12),'g','LineWidth',2)
axis([0 25 0 0.7])
xlabel('V_{plc} \muMs^{-1}')
ylabel('[Ca^{2+}_i] \muM')
set(gca,'FontSize',40,'fontweight','b','fontname','arial')
ax=gca;
set(ax,'Linewidth',3)
ax.FontSize=30;
box off
tilefigs