clear 
close all
clc

%% Load files


eq = dlmread('Eq.csv',',',1,1);
po = dlmread('PO1.csv',',',1,1);
is = dlmread('Is.csv',',',1,1);
is2 = dlmread('Is2.csv',',',1,1);
is3 = dlmread('Is3.csv',',',1,1);
is4 = dlmread('Is4.csv',',',1,1);
is5 = dlmread('Is5.csv',',',1,1);
is6 = dlmread('Is6.csv',',',1,1);
is7 = dlmread('Is7.csv',',',1,1);

%% Plots

plot_part_bif(eq,5,7,15,0.01,1,2,1)
hold on
plot_part_bif(po,5,8,16,0.01,1,2.5,0)
hold on
plot_part_bif(po,5,12,16,0.01,1,2.5,0)
hold on
plot_part_bif_is(is,5,8,16,0.01,1,2.5,0)
hold on
plot_part_bif_is2(is2,5,8,16,0.01,1,2.5,0)
hold on
plot_part_bif_is3(is3,5,8,16,0.01,1,2.5,0)
hold on
% plot_part_bif_is4(is4,5,8,16,0.01,1,2.5,0)
% hold on
% plot_part_bif_is5(is5,5,8,16,0.01,1,2.5,0)
% hold on
% plot_part_bif_is6(is6,5,8,16,0.01,1,2.5,0)
% hold on
% plot_part_bif_is6(is7,5,8,16,0.01,1,2,0)
% hold on
plot(0.0587046,0.0932856,'o','MarkerSize',15,...
    'MarkerEdgeColor','k','MarkerFaceColor',[0 0 0]+0.9)
hold on
plot(0.545424,0.149998,'o','MarkerSize',15,...
    'MarkerEdgeColor','k','MarkerFaceColor',[0 0 0]+0.9)
hold on
plot(0.600387,0.24263,'o','MarkerSize',15,...
    'MarkerEdgeColor','k','MarkerFaceColor',[0 0 0]+0.9)
hold on
plot(0.208994,0.510659,'o','MarkerSize',15,...
    'MarkerEdgeColor','k','MarkerFaceColor',[0 0 0]+0.9)
hold on
text(0.61,0.24263,'SNPO','FontSize',20)
hold on
text(0.03,0.105,'HB','FontSize',20)
hold on
text(0.56,0.165,'HB','FontSize',20)
hold on
text(0.215,0.519,'PD','FontSize',20)
hold on
text(0.35,0.605,'I^1','FontSize',30)
hold on
text(0.44,0.605,'I^2','FontSize',30)
hold on
text(0.49,0.598,'I^3','FontSize',30)
% hold on
% text(0.51,0.595,'I^4','FontSize',30)
% hold on
% text(0.52,0.586,'I^5','FontSize',30)
% hold on
% text(0.53,0.57,'I^6','FontSize',30)
axis([0 0.7 0 0.7])
xlabel('V_{PLC} \muMs^{-1}','fontweight','b','fontname','arial')
ylabel('[Ca^{2+}]_i \muM','fontsize',20,'fontweight','b','fontname','arial')
ax=gca;
set(ax,'Linewidth',3)
ax.FontSize=40;
box off

tilefigs