%DEMAND PROFILE SHIFT PLOT

%% twoway 1-2
% load ModePercentage1.mat
% twoway=movmean(twoway,60);
% twoway1=twoway;
% twowayarrival1=movmean(twowayarrival,120);
% plot((time/3600),twoway,'g');    %Plot the 1st simulation Fleet utilization
% hold on
% %plot((time/3600),twowayarrival,'y');    
% load ModePercentage2.mat
% twoway=movmean(twoway,60);
% twoway2=twoway;
% twowayarrival2=movmean(twowayarrival,120);
% plot((time/3600),twoway,'r');    %Plot the 2nd simulation Fleet utilization
% %plot((time/3600),twowayarrival,'c');  
% title('Demand Profile Carsharing');
% xlim([0 24]);
% ylabel('# Vehicles');
% xlabel('Time [h]');
% legend('Fixed Pricing','Fixed Pricing + VOT','location','best');
% hold off
% filename = sprintf('Demand_Profile_twoway_1-2.png');
% saveas(gca,filename);
% hold off
% 
% %Difference in demand profile between sim1 and sim2
% plot((time/3600),(twoway1-twoway2),'r');
% hold on
% title('Carsharing Demand Profile Differential between FP-VOT and FP)');
% xlim([0 24]);
% ylabel('# Vehicles');
% xlabel('Time [h]');
% hold off
% filename = sprintf('Demand_Profile_Differential_twoway_1-2.png');
% saveas(gca,filename);
% hold off
% 
% %Difference in demand profile between sim2 departure and sim2 arrival
% plot((time/3600),(twoway2-twowayarrival2),'r');
% hold on
% title('FP Carsharing Demand Profile Differential Departure-Arrival');
% xlim([0 24]);
% ylabel('# Vehicles');
% xlabel('Time [h]');
% hold off
% filename = sprintf('Demand_Profile_Differential_twoway2_dep-arr.png');
% saveas(gca,filename);
% hold off

%% twoway 2-3
load ModePercentage2.mat
twoway=movmean(twoway,20);
twoway2=twoway;
twowayarrival2=movmean(twowayarrival,20);
plot((time/3600),twoway,'r');    %Plot the 2nd simulation Fleet utilization
hold on
load ModePercentage3.mat
twoway=movmean(twoway,20);
twoway3=twoway;
twowayarrival3=movmean(twowayarrival,20);
plot((time/3600),twoway,'b');    %Plot the 3rd simulation Fleet utilization
title('Carsharing Demand Profile');
xlim([0 24]);
ylabel('# Vehicles');
xlabel('Time [h]');
legend('Fixed Pricing','Availability Based Dynamic Pricing','location','best');
hold off
filename = sprintf('Demand_Profile_twoway_2-3.png');
saveas(gca,filename);
hold off

%Difference in demand profile between sim2 and sim3
plot((time/3600),(twoway2-twoway3),'b');
hold on
title('Carsharing Demand Profile Differential FP-ABDP');
xlim([0 24]);
ylabel('# Vehicles');
xlabel('Time [h]');
hold off
filename = sprintf('Demand_Profile_Differential_twoway_2-3.png');
saveas(gca,filename);
hold off

%Difference in demand profile between sim3 departure and sim3 arrival
plot((time/3600),(twoway3-twowayarrival3),'b');
hold on
title('ABDP Carsharing Demand Profile Differential Departure-Arrival');
xlim([0 24]);
ylabel('# Vehicles');
xlabel('Time [h]');
hold off
filename = sprintf('Demand_Profile_Differential_twoway3_dep-arr.png');
saveas(gca,filename);
hold off

%% twoway 2-4
load ModePercentage2.mat
twoway=movmean(twoway,20);
twoway2=twoway;
twowayarrival2=movmean(twowayarrival,20);
plot((time/3600),twoway,'r');    %Plot the 2nd simulation Fleet utilization
hold on
load ModePercentage4.mat
twoway=movmean(twoway,20);
twoway4=twoway;
twowayarrival4=movmean(twowayarrival,20);
plot((time/3600),twoway,'m');    %Plot the 4rd simulation Fleet utilization
title('Carsharing Demand Profile');
xlim([0 24]);
ylabel('# Vehicles');
xlabel('Time [h]');
legend('Fixed Pricing','Time Based Dynamic Pricing','location','best');
hold off
filename = sprintf('Demand_Profile_twoway_2-4.png');
saveas(gca,filename);
hold off

%Difference in demand profile between sim2 and sim4
plot((time/3600),(twoway2-twoway4),'m');
hold on
title('TBDP Carsharing Demand Profile Differential');
xlim([0 24]);
ylabel('# Vehicles');
xlabel('Time [h]');
hold off
filename = sprintf('Demand_Profile_Differential_twoway_2-4.png');
saveas(gca,filename);
hold off

%Difference in demand profile between sim4 departure and sim4 arrival
plot((time/3600),(twoway4-twowayarrival4),'m');
yyaxis left
hold on
title('TBDP Carsharing Demand Profile Differential Departure-Arrival');
xlim([0 24]);
ylabel('# Vehicles');
xlabel('Time [h]');
% stairs((timeBasePrice(:,1)),(timeBasePrice(:,2)),'k');
% yyaxis right
% ylabel('Time Based Price [€/min]');
% legend('Differential Departure-Arrival','Price','location','best');
hold off
filename = sprintf('Demand_Profile_Differential_twoway4_dep-arr.png');
saveas(gca,filename);
hold off

%% twoway 3-4
%Difference in demand profile between sim3 departure and sim3 arrival

plot((time/3600),(twoway4),'m');
hold on
plot((time/3600),(twoway2),'-r');
yyaxis left
title('Carsharing Demand Profile Differential Departure-Arrival');
xlim([0 24]);
ylabel('# Vehicles');
xlabel('Time [h]');
yyaxis right
stairs((timeBasePrice(:,1)),(timeBasePrice(:,2)),'--k');
hold on
plot(fixedPrice(:,1),fixedPrice(:,2),':k');
ylim([0 0.2]);
ylabel('Time Based Price [€/min]');
legend('TBDP Demand Profile','FP Demand Profile','TBDP','FP','location','northeast');
hold off
filename = sprintf('Demand_Profile_Differential_twoway34_dep-arr.png');
saveas(gca,filename);
close