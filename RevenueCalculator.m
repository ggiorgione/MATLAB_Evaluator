%Revenue Calculator

revenueList = inputTable;
revenueList = table2array(revenueList(:,[1 13 14 15 9])); %Caring only about the PersonID (1) vehicleID (13) cost (14) bookingTime (15) distance (9)

vehicleCount = length(revenueList);

totRevenue = sum(revenueList(:,3));
totBookingTime = sum(revenueList(:,4))/3600;
totBookingDistance = sum(revenueList(:,5))/1000;

revenueXVehicle = totRevenue/vehicleCount;
bookingTimeXVehicle = totBookingTime/vehicleCount;
bookingDistanceXVehicle = totBookingDistance/vehicleCount;

hourlyRevenue = revenueXVehicle/bookingTimeXVehicle;
kilometricRevenue = revenueXVehicle/bookingDistanceXVehicle;

filename = sprintf('Revenue_%i.mat',y);
save(filename,'totRevenue','totBookingTime','totBookingDistance','revenueXVehicle','bookingTimeXVehicle','bookingDistanceXVehicle','hourlyRevenue','kilometricRevenue');