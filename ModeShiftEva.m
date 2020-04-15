%DEMAND PROFILE SHIFT EVALUATION
load ModePercentage1.mat
twowayPERC1 = twowayPERC;
ptPERC1 = ptPERC;
carPERC1 = carPERC;
softPERC1 = 100-twowayPERC-ptPERC-carPERC;
load ModePercentage2.mat
twowayPERC2 = twowayPERC;
ptPERC2 = ptPERC;
carPERC2 = carPERC;
softPERC2 = 100-twowayPERC-ptPERC-carPERC;
load ModePercentage3.mat
twowayPERC3 = twowayPERC;
ptPERC3 = ptPERC;
carPERC3 = carPERC;
softPERC3 = 100-twowayPERC-ptPERC-carPERC;
load ModePercentage4.mat
twowayPERC4 = twowayPERC;
ptPERC4 = ptPERC;
carPERC4 = carPERC;
softPERC4 = 100-twowayPERC-ptPERC-carPERC;

totaltwoway = [twowayPERC1 twowayPERC2 twowayPERC3 twowayPERC4];
totalpt = [ptPERC1 ptPERC2 ptPERC3 ptPERC4];
totalcar = [carPERC1 carPERC2 carPERC3 carPERC4];
totalsoft = [softPERC1 softPERC2 softPERC3 softPERC4];
totaltotal =[];
totaltotal(4,:) = totaltwoway;
totaltotal(2,:) = totalpt;
totaltotal(3,:) = totalcar;
totaltotal(1,:) = totalsoft;
totaltotal = totaltotal';
% log(totaltotal);

c = categorical({'Sim01','Sim02','Sim03','Sim04'});
bar(c,totaltotal,'stacked')
legend('Soft Modes','Public Transport','Car','Carsharing');
ylim([0 inf]);
hold off

filename = sprintf('Mode_Shift_Histogram.mat');
save(filename,'carPERC', 'carPERC1', 'carPERC2', 'carPERC3', 'otherModesPERC', 'ptPERC', 'ptPERC1', 'ptPERC2', 'ptPERC3', 'softPERC1', 'softPERC2', 'softPERC3', 'twowayPERC', 'twowayPERC1', 'twowayPERC2', 'twowayPERC3');

%Evaluate the modal shift





