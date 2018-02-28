% visualize test results

clear variables
close all

% load results data

data = load('results.mat');
adjs = data.adjs;

% histogram of number of pairings for individuals

numcell = arrayfun(@(x) x.numfits,adjs,'UniformOutput',false);
nummat = cell2mat(numcell);
numvec = nummat(:);

valcell = arrayfun(@(x) x.maxfits,adjs,'UniformOutput',false);
valvec = cell2mat(valcell);

figure
set(gcf,'Units','normalized','Position',[0.1 0.1 0.3 0.8],'Color',[1 1 1])

subplot(2,1,1)

histogram(numvec,'Normalization','cdf')
grid on
axis tight

xlabel('Kumppaniehdokkaiden lukum\"a\"ar\"a','FontSize',16,...
    'Interpreter','latex')
ylabel('Summatodenn\"ak\"oisyys','FontSize',16,...
    'Interpreter','latex')
set(gca,'FontSize',16,'TickLabelInterpreter','latex')

subplot(2,1,2)

boxplot(valvec(valvec > 0),'Orientation','horizontal','Widths',2)
grid on

xlabel('Suurin sopivuusarvo','FontSize',16,'Interpreter','latex')

pos = get(gca,'Position');
pos(4) = pos(4)/3;
pos(2) = pos(2) + 2*pos(4);
set(gca,'FontSize',16,'YTicklabel',{' '},'TickLabelInterpreter','latex',...
    'Position',pos)

export_fig tuloskuva -pdf