%revenueCalculatorPlot

%% load Revenue_1.mat
% load Revenue_1.mat
% totRevenue1 = totRevenue;
% totBookingTime1 = totBookingTime;
% totBookingDistance1 = totBookingDistance;
% 
% revenueXVehicle1 = revenueXVehicle;
% bookingTimeXVehicle1 = bookingTimeXVehicle;
% bookingDistanceXVehicle1 = bookingDistanceXVehicle;
% 
% hourlyRevenue1 = hourlyRevenue;
% kilometricRevenue1 = kilometricRevenue;

%% load Revenue_2.mat
load Revenue_2.mat
totRevenue2 = totRevenue;
totBookingTime2 = totBookingTime;
totBookingDistance2 = totBookingDistance;

revenueXVehicle2 = revenueXVehicle;
bookingTimeXVehicle2 = bookingTimeXVehicle;
bookingDistanceXVehicle2 = bookingDistanceXVehicle;

hourlyRevenue2 = hourlyRevenue;
kilometricRevenue2 = kilometricRevenue;

%% load Revenue_3.mat
load Revenue_3.mat
totRevenue3 = totRevenue;
totBookingTime3 = totBookingTime;
totBookingDistance3 = totBookingDistance;

revenueXVehicle3 = revenueXVehicle;
bookingTimeXVehicle3 = bookingTimeXVehicle;
bookingDistanceXVehicle3 = bookingDistanceXVehicle;

hourlyRevenue3 = hourlyRevenue;
kilometricRevenue3 = kilometricRevenue;

%% load Revenue_4.mat
load Revenue_4.mat
totRevenue4 = totRevenue;
totBookingTime4 = totBookingTime;
totBookingDistance4 = totBookingDistance;

revenueXVehicle4 = revenueXVehicle;
bookingTimeXVehicle4 = bookingTimeXVehicle;
bookingDistanceXVehicle4 = bookingDistanceXVehicle;

hourlyRevenue4 = hourlyRevenue;
kilometricRevenue4 = kilometricRevenue;

%% 2-3

% Plot overall revenue
overallRevenuePlot = bar(1,totRevenue2,'FaceColor','r');
hold on
overallRevenuePlot = bar(2,totRevenue3,'FaceColor','b');
title('Revenue');
ylabel('Total Revenue [€]');
xticks([1 2]);
xticklabels({'Fixed Pricing','Availability Based Dynamic Pricing'});
hold off
filename = sprintf('totRevenue2-3.png');
saveas(gca,filename);

% Plot overall time
overallBookingTimePlot = bar(1,totBookingTime2,'FaceColor','r');
hold on
overallBookingTimePlot = bar(2,totBookingTime3,'FaceColor','b');
title('BookingTime');
ylabel('Total Booking Time [€]');
xticks([1 2]);
xticklabels({'Fixed Pricing','Availability Based Dynamic Pricing'});
hold off
filename = sprintf('totBookingTime2-3.png');
saveas(gca,filename);

% Plot overall Distance
overallBookingDistancePlot = bar(1,totBookingDistance2,'FaceColor','r');
hold on
overallBookingTimePlot = bar(2,totBookingDistance3,'FaceColor','b');
title('BookingDistance');
ylabel('Total Booking Distance [€]');
xticks([1 2]);
xticklabels({'Fixed Pricing','Availability Based Dynamic Pricing'});
hold off
filename = sprintf('totBookingDistance2-3.png');
saveas(gca,filename);

% revenueXVehicle
overallrevenueXVehiclePlot = bar(1,revenueXVehicle2,'FaceColor','r');
hold on
overallBookingTimePlot = bar(2,revenueXVehicle3,'FaceColor','b');
title('Revenue per Vehicle');
ylabel('Revenue per Vehicle [€]');
xticks([1 2]);
xticklabels({'Fixed Pricing','Availability Based Dynamic Pricing'});
hold off
filename = sprintf('revenueXVehicle2-3.png');
saveas(gca,filename);

% bookingTimeXVehicle
overallbookingTimeXVehiclePlot = bar(1,bookingTimeXVehicle2,'FaceColor','r');
hold on
overallBookingTimePlot = bar(2,bookingTimeXVehicle3,'FaceColor','b');
title('Booking Time per Vehicle');
ylabel('Booking Time per Vehicle [h]');
xticks([1 2]);
xticklabels({'Fixed Pricing','Availability Based Dynamic Pricing'});
hold off
filename = sprintf('Booking Time per Vehicle2-3.png');
saveas(gca,filename);

% bookingDistanceXVehicle
overallbookingDistanceXVehiclePlot = bar(1,bookingDistanceXVehicle2,'FaceColor','r');
hold on
overallBookingTimePlot = bar(2,bookingDistanceXVehicle3,'FaceColor','b');
title('Booking Distance per Vehicle');
ylabel('Booking Distance per Vehicle [Km]');
xticks([1 2]);
xticklabels({'Fixed Pricing','Availability Based Dynamic Pricing'});
hold off
filename = sprintf('Booking Distance per Vehicle2-3.png');
saveas(gca,filename);

% hourlyRevenue
overallhourlyRevenuePlot = bar(1,hourlyRevenue2,'FaceColor','r');
hold on
overallBookingTimePlot = bar(2,hourlyRevenue3,'FaceColor','b');
title('Hourly Revenue');
xticks([1 2]);
ylabel('Hourly Revenue [€/h]');
xticklabels({'Fixed Pricing','Availability Based Dynamic Pricing'});
hold off
filename = sprintf('Hourly Revenue2-3.png');
saveas(gca,filename);

% kilometricRevenue
overallkilometricRevenuePlot = bar(1,kilometricRevenue2,'FaceColor','r');
hold on
overallBookingTimePlot = bar(2,kilometricRevenue3,'FaceColor','b');
title('Kilometric Revenue');
ylabel('Kilometric Revenue [€/Km]');
xticks([1 2]);
xticklabels({'Fixed Pricing','Availability Based Dynamic Pricing'});
hold off
filename = sprintf('kilometric Revenue2-3.png');
saveas(gca,filename);

%% 2-4

% Plot overall revenue
overallRevenuePlot = bar(1,totRevenue2,'FaceColor','r');
hold on
overallRevenuePlot = bar(2,totRevenue4,'FaceColor','m');
title('Revenue');
ylabel('Total Revenue [€]');
xticks([1 2]);
xticklabels({'Fixed Pricing','Time Based Dynamic Pricing'});
hold off
filename = sprintf('totRevenue2-4.png');
saveas(gca,filename);

% Plot overall time
overallBookingTimePlot = bar(1,totBookingTime2,'FaceColor','r');
hold on
overallBookingTimePlot = bar(2,totBookingTime4,'FaceColor','m');
title('BookingTime');
ylabel('Total Booking Time [h]');
xticks([1 2]);
xticklabels({'Fixed Pricing','Time Based Dynamic Pricing'});
hold off
filename = sprintf('totBookingTime2-4.png');
saveas(gca,filename);

% Plot overall Distance
overallBookingDistancePlot = bar(1,totBookingDistance2,'FaceColor','r');
hold on
overallBookingTimePlot = bar(2,totBookingDistance4,'FaceColor','m');
title('BookingDistance');
ylabel('Total Booking Distance [Km]');
xticks([1 2]);
xticklabels({'Fixed Pricing','Time Based Dynamic Pricing'});
hold off
filename = sprintf('totBookingDistance2-4.png');
saveas(gca,filename);

% revenueXVehicle
overallrevenueXVehiclePlot = bar(1,revenueXVehicle2,'FaceColor','r');
hold on
overallBookingTimePlot = bar(2,revenueXVehicle4,'FaceColor','m');
title('Revenue per Vehicle');
ylabel('Revenue per Vehicle [€]');
xticks([1 2]);
xticklabels({'Fixed Pricing','Time Based Dynamic Pricing'});
hold off
filename = sprintf('revenueXVehicle2-4.png');
saveas(gca,filename);

% bookingTimeXVehicle
overallbookingTimeXVehiclePlot = bar(1,bookingTimeXVehicle2,'FaceColor','r');
hold on
overallBookingTimePlot = bar(2,bookingTimeXVehicle4,'FaceColor','m');
title('Booking Time per Vehicle');
ylabel('Booking Time per Vehicle [h]');
xticks([1 2]);
xticklabels({'Fixed Pricing','Time Based Dynamic Pricing'});
hold off
filename = sprintf('Booking Time per Vehicle2-4.png');
saveas(gca,filename);

% bookingDistanceXVehicle
overallbookingDistanceXVehiclePlot = bar(1,bookingDistanceXVehicle2,'FaceColor','r');
hold on
overallBookingTimePlot = bar(2,bookingDistanceXVehicle4,'FaceColor','m');
title('Booking Distance per Vehicle');
ylabel('Booking Distance per Vehicle [Km]');
xticks([1 2]);
xticklabels({'Fixed Pricing','Time Based Dynamic Pricing'});
hold off
filename = sprintf('Booking Distance per Vehicle2-4.png');
saveas(gca,filename);

% hourlyRevenue
overallhourlyRevenuePlot = bar(1,hourlyRevenue2,'FaceColor','r');
hold on
overallBookingTimePlot = bar(2,hourlyRevenue4,'FaceColor','m');
title('Hourly Revenue');
xticks([1 2]);
ylabel('Hourly Revenue [€/h]');
xticklabels({'Fixed Pricing','Time Based Dynamic Pricing'});
hold off
filename = sprintf('Hourly Revenue2-4.png');
saveas(gca,filename);

% kilometricRevenue
overallkilometricRevenuePlot = bar(1,kilometricRevenue2,'FaceColor','r');
hold on
overallBookingTimePlot = bar(2,kilometricRevenue4,'FaceColor','m');
title('Kilometric Revenue');
ylabel('Kilometric Revenue [€/Km]');
xticks([1 2]);
xticklabels({'Fixed Pricing','Time Based Dynamic Pricing'});
hold off
filename = sprintf('kilometric Revenue2-4.png');
saveas(gca,filename);