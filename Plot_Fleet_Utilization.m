load VehXDist_sum1.mat
VehXDist_sum1=VehXDist_sum;
load VehXDist_sum2.mat
VehXDist_sum2=VehXDist_sum;
load VehXDist_sum3.mat
VehXDist_sum3=VehXDist_sum;
load VehXDist_sum4.mat
VehXDist_sum4=VehXDist_sum;

VehXDist_sum = sortrows(VehXDist_sum,1);
plot(1:numel(VehXDist_sum1(:,2)),VehXDist_sum1(:,1),'g');    %Plot the 1st simulation Fleet utilization
hold on
plot(1:numel(VehXDist_sum2(:,2)),VehXDist_sum2(:,1),'r');    %Plot the 2nd simulation Fleet utilization
plot(1:numel(VehXDist_sum3(:,2)),VehXDist_sum3(:,1),'b');    %Plot the 3rd simulation Fleet utilization
plot(1:numel(VehXDist_sum4(:,2)),VehXDist_sum4(:,1),'m');    %Plot the 4rd simulation Fleet utilization
title('Fleet Utilization 1');
ylabel('Vehicle * Km');
xlabel('VehId');
hold off

filename = sprintf('FleetUtilization_%i.png','T');
saveas(gca,filename);