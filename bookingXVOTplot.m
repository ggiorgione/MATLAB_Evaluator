%booking per VOT plot

load bookingXVOT1.mat
bVOT1 = bVOT;
bVOTCounts1 = bVOTCounts;

load bookingXVOT2.mat
bVOT2 = bVOT;
bVOTCounts2 = bVOTCounts;

load bookingXVOT3.mat
bVOT3 = bVOT;
bVOTCounts3 = bVOTCounts;

load bookingXVOT4.mat
bVOT4 = bVOT;
bVOTCounts4 = bVOTCounts;

if length(bVOTCounts3) ~= 4
    bVOTCounts3 = [bVOTCounts3;VOTlist1];
    bVOTCounts3 = sortrows(bVOTCounts3);
end

%% 2-3
TotalbVOTCounts = [bVOTCounts2 bVOTCounts3];
labelTotalbVOTCounts = TotalbVOTCounts(:,1);
TotalbVOTCounts(:,1) = [];
TotalbVOTCounts(:,2) = [];

TotalbVOTCountsPlot = bar(TotalbVOTCounts,'FaceColor','r');
hold on
TotalbVOTCountsPlot(2).FaceColor = 'blue';
xlabel('Income Factor [€/h]');
ylabel('# Bookings');
title('Number of Bookings per Income Factor');
set(gca,'XTickLabel',num2str(labelTotalbVOTCounts));
legend('Fixed Pricing','Availability Based Dynamic Pricing')
legend('location','northwest');
filename = sprintf('Number of Bookings per Income Factor 2-3.png');
saveas(gca,filename);
hold off

%% 2-4
TotalbVOTCounts = [bVOTCounts2 bVOTCounts4];
labelTotalbVOTCounts = TotalbVOTCounts(:,1);
TotalbVOTCounts(:,1) = [];
TotalbVOTCounts(:,2) = [];

TotalbVOTCountsPlot = bar(TotalbVOTCounts,'FaceColor','r');
hold on
TotalbVOTCountsPlot(2).FaceColor = 'magenta';
xlabel('Income Factor [€/h]');
ylabel('# Bookings');
title('Number of Bookings per Income Factor');
set(gca,'XTickLabel',num2str(labelTotalbVOTCounts));
legend('Fixed Pricing','Availability Based Dynamic Pricing')
legend('location','northwest');
filename = sprintf('Number of Bookings per Income Factor 2-4.png');
saveas(gca,filename);
hold off


