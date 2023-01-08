clear 
close all
clc

%% Load files


eq = dlmread('Eq.csv',',',1,1);
po = dlmread('PO1.csv',',',1,1,[1 1 693 20]);
is = dlmread('Is.csv',',',1,1);
is2 = dlmread('Is2.csv',',',1,1);
is3 = dlmread('Is3.csv',',',1,1);

%% Plots

plot_part_bif(eq,5,10,19,0.01,1,4,1)
hold on
plot_part_bif(po,5,11,20,0.01,1,4,0)
hold on
plot_part_bif(po,5,16,20,0.01,1,4,0)
hold on
plot_part_bif_is(is,5,11,20,0.01,1,4,0)
hold on
plot_part_bif_is(is,5,16,20,0.01,1,4,0)
hold on
plot_part_bif_is2(is2,5,11,20,0.01,1,4,0)
hold on
plot_part_bif_is2(is2,5,16,20,0.01,1,4,0)
hold on
plot_part_bif_is3(is3,5,11,20,0.01,1,4,0)
hold on
plot_part_bif_is3(is3,5,16,20,0.01,1,4,0)
hold on
plot(0.0124319,0.0876152,'o','MarkerSize',20,...
    'MarkerEdgeColor','k','MarkerFaceColor',[0 0 0]+0.9)
hold on
plot(0.144363,0.14327,'o','MarkerSize',20,...
    'MarkerEdgeColor','k','MarkerFaceColor',[0 0 0]+0.9)
hold on
plot(0.0470527,0.646155,'o','MarkerSize',20,...
    'MarkerEdgeColor','k','MarkerFaceColor',[0 0 0]+0.9)
hold on
plot(0.236707,0.332406,'o','MarkerSize',20,...
    'MarkerEdgeColor','k','MarkerFaceColor',[0 0 0]+0.9)
hold on
text(0.24,0.3325,'SNPO','FontSize',50)
hold on
text(0.0145,0.088,'HB','FontSize',50)
hold on
text(0.126,0.16,'HB','FontSize',50)
hold on
text(0.0275,0.646155,'PD','FontSize',50)
hold on
% plot(0.01,0,'o','MarkerSize',40,'MarkerEdgeColor','r','MarkerFaceColor','r')
% hold on
text(0.1,0.77,'I^0','FontSize',70)
hold on
text(0.16,0.76,'I^1','FontSize',70)
hold on
text(0.19,0.74,'I^2','FontSize',70)
hold on
text(0.1,0.65,'i','color',[0.9290 0.6940 0.1250],'FontSize',70)
hold on
text(0.16,0.65,'ii','color',[0.9290 0.6940 0.1250],'FontSize',70)
hold on
text(0.187,0.47,'iii','color',[0.9290 0.6940 0.1250],'FontSize',70)
hold on
text(0.04,0.35,'a','color',[0.4940 0.1840 0.5560],'FontSize',70)
hold on
text(0.055,0.35,'b','color',[0.4940 0.1840 0.5560],'FontSize',70)
hold on
text(0.16,0.35,'c','color',[0.4940 0.1840 0.5560],'FontSize',70)
axis([0 0.27 0 0.8])
xlabel('V_{PLC} (\muM/s)')
ylabel('[Ca^{2+}]_i \muM')
ax=gca;
set(ax,'Linewidth',6)
ax.FontSize=70;
% ax.YAxis.Visible = 'off';
box off
hold off
% set(gca,'ytick',[],'Ycolor','w','box','off')
set(gcf,'position',[10,10,1750,1400]) %[xpos, ypos, Width, Height]
saveas(gcf,'figure10','epsc')
% tilefigs