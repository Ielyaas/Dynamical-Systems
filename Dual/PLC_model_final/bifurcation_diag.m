clear 
close all
clc

%% Load files


eq = dlmread('Eq.csv',',',1,1);
po = dlmread('PO1.csv',',',1,1,[1 1 646 18]);
is = dlmread('Is.csv',',',1,1);
is2 = dlmread('Is2.csv',',',1,1);
% is3 = dlmread('Is3.csv',',',1,1);

%% Plots

plot_part_bif(eq,5,9,17,0.01,1,4,1)
hold on
plot_part_bif(po,5,10,18,0.01,1,4,0)
hold on
plot_part_bif(po,5,14,18,0.01,1,4,0)
hold on
plot_part_bif_is(is,5,10,18,0.01,1,4,0)
hold on
plot_part_bif_is(is,5,14,18,0.01,1,4,0)
hold on
plot_part_bif_is2(is2,5,10,18,0.01,1,4,0)
hold on
plot_part_bif_is2(is2,5,14,18,0.01,1,4,0)
hold on
% plot_part_bif_is3(is3,5,11,20,0.01,1,4,0)
% hold on
% plot_part_bif_is3(is3,5,16,20,0.01,1,4,0)
hold on
plot(0.0525489,8.75240e-02,'o','MarkerSize',20,...
    'MarkerEdgeColor','k','MarkerFaceColor',[0 0 0]+0.9)
hold on
plot(4.54840e-01,1.43270e-01,'o','MarkerSize',20,...
    'MarkerEdgeColor','k','MarkerFaceColor',[0 0 0]+0.9)
hold on
plot(1.66652e-01,6.57658e-01,'o','MarkerSize',20,...
    'MarkerEdgeColor','k','MarkerFaceColor',[0 0 0]+0.9)
hold on
plot(6.63345e-01,3.48734e-01,'o','MarkerSize',20,...
    'MarkerEdgeColor','k','MarkerFaceColor',[0 0 0]+0.9)
hold on
text(0.67,3.48734e-01,'SNPO','FontSize',50)
hold on
text(0.0635,0.0895,'HB','FontSize',50)
hold on
text(0.41,0.165,'HB','FontSize',50)
hold on
text(0.115,6.57658e-01,'PD','FontSize',50)
hold on
% % plot(0.01,0,'o','MarkerSize',40,'MarkerEdgeColor','r','MarkerFaceColor','r')
% % hold on
text(0.4,0.82,'I^0','FontSize',70)
hold on
text(0.58,0.82,'I^1','FontSize',70)
hold on
% text(0.19,0.74,'I^2','FontSize',70)
% hold on
text(0.22,0.7,'i','color',[0.9290 0.6940 0.1250],'FontSize',70)
hold on
text(0.58,0.7,'ii','color',[0.9290 0.6940 0.1250],'FontSize',70)
hold on
% text(0.187,0.47,'iii','color',[0.9290 0.6940 0.1250],'FontSize',70)
% hold on
text(0.1,0.35,'a','color',[0.4940 0.1840 0.5560],'FontSize',70)
hold on
text(0.18,0.35,'b','color',[0.4940 0.1840 0.5560],'FontSize',70)
hold on
text(0.57,0.35,'c','color',[0.4940 0.1840 0.5560],'FontSize',70)
axis([0 0.8 0 0.9])
xlabel('V_{PLC} (\muM/s)')
ylabel('[Ca^{2+}]_i \muM')
ax=gca;
set(ax,'Linewidth',6)
ax.FontSize=70;
% ax.YAxis.Visible = 'off';
box off
hold off
% set(gca,'ytick',[],'Ycolor','w','box','off')
set(gcf,'position',[10,10,2000,1400]) %[xpos, ypos, Width, Height]
saveas(gcf,'figure10','epsc')
% tilefigs