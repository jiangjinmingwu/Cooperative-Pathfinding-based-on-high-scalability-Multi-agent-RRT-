
x = 1:6000;
plot(x,runtime,'DisplayName','MARRTs','Color','k','LineWidth',2);
hold on;
plot(x,runtimeG,'--r','DisplayName','MARRTsPF','LineWidth',2);
plot(x,is_runtime,':g','DisplayName','isMARRTs','LineWidth',2);
plot(x,is_runtimeG,'-.b','DisplayName','isMARRTsPF','LineWidth',2);
ylim manual
xlim manual
ylim([0,5000])
xlim([0,6000]);
xticks(0:1000:6000);
yticks(0:1000:5000);
ytickangle(90)
ax = gca;
ax.FontSize = 13;
title('First-solution performance curve');
xlabel('instances');
ylabel('runtime(ms)');
set(gcf,'Position',[400,400,660,450]);
legend('Location','southoutside','Orientation','horizontal');
hold off;

 
% suboptimality = [first_suboptimality;best_suboptimality;first_suboptimalityG;best_suboptimalityG;...
%      is_first_suboptimality;is_best_suboptimality;is_first_suboptimalityG;is_best_suboptimalityG];
% g1 = repmat({'MA-RRTs;1st sol.'},size(first_suboptimality,1),1);
% g2 = repmat({'MA-RRTs;best sol.'},size(best_suboptimality,1),1);
% g3 = repmat({'MA-RRTsG;1st sol.'},size(first_suboptimalityG,1),1);
% g4 = repmat({'MA-RRTsG;best sol.'},size(best_suboptimalityG,1),1);
% g5 = repmat({'isMA-RRTs;1st sol.'},size(is_first_suboptimality,1),1);
% g6 = repmat({'isMA-RRTs;best sol.'},size(is_best_suboptimality,1),1);
% g7 = repmat({'isMA-RRTsG;1st sol.'},size(is_first_suboptimalityG,1),1);
% g8 = repmat({'isMA-RRTsG;best sol.'},size(is_best_suboptimalityG,1),1);
% g = [g1;g2;g3;g4;g5;g6;g7;g8];
% boxplot(suboptimality,g,'Symbol','o');
% xt = {'\begin{tabular}{c} MA-RRTs \\ 1st sol. \end{tabular}';...
%     '\begin{tabular}{c} MA-RRTs \\ best sol. \end{tabular}';...
%     '\begin{tabular}{c} MA-RRTsPF \\ 1st sol. \end{tabular}';...
%     '\begin{tabular}{c} MA-RRTsPF \\ best sol. \end{tabular}';...
%     '\begin{tabular}{c} isMA-RRTs \\ 1st sol. \end{tabular}';...
%     '\begin{tabular}{c} isMA-RRTs \\ best sol. \end{tabular}';...
%     '\begin{tabular}{c} isMA-RRTsPF \\ 1st sol. \end{tabular}';...
%     '\begin{tabular}{c} isMA-RRTsPF \\ best sol. \end{tabular}';};
% %// use the tick label at location 5 on the x axis
% set(gca,'XTickLabel',xt,'TickLabelInterpreter', 'latex','FontName','Times');
% ylim manual
% ylim([0,200])
% yticks(0:50:200);
% ytickangle(90)
% ax = gca;
% ax.FontSize = 13;
% ax.XAxis.FontSize = 8;
% set(gcf,'Position',[400,400,720,300]);
% yl = ylabel('Suboptimality(extra %)');
% yl.FontSize = 13;