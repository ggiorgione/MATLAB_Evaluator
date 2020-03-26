%%%%%%%%%%%%%%
%Driving Time%
%%%%%%%%%%%%%%

DrivingTimePercentage = inputTable;
DrivingTimePercentage = DrivingTimePercentage(:,[13 10 1]); %Caring only about the inVehicleTime (5) and the vehicleId (8)


%Sums all the utilization time for the same vehicle - https://stackoverflow.com/questions/50025485/matlab-how-can-i-sum-all-the-rows-of-the-first-column-when-on-the-second-column
[VehId,~,id] = unique(DrivingTimePercentage(:,1),'stable');
filename = sprintf('Driving_Time_%i.mat',y);
save(filename,'DrivingTimePercentage');

DrivingTimePercentage = table2array(DrivingTimePercentage);
VehId = table2array(VehId);
DrivingTimePercentage = [accumarray(id,DrivingTimePercentage(:,2)), VehId];
SortedDrivingTimePercentage = sortrows(DrivingTimePercentage,1,'descend');

%Sums all the driving time giving back a global driving time
CTot=sum(SortedDrivingTimePercentage);
TotalDrivingTimeSecs = CTot(:,1);
TotalDrivingTimeMin = TotalDrivingTimeSecs/60;

%%%%%%%%%%%%%%%
%Starting Time%
%%%%%%%%%%%%%%%


StartingTime = inputTable(:,[3]); %Caring only about the StartingTime (3)
StartingTime = table2array(StartingTime);

%Sums all the utilization time for the same vehicle - https://stackoverflow.com/questions/50025485/matlab-how-can-i-sum-all-the-rows-of-the-first-column-when-on-the-second-column
[VehId,~,id] = unique(StartingTime(:,1),'stable');
filename = sprintf('StartingTime_%i.mat',y);
save(filename,'StartingTime');

%%%%%%%%%%%%%%
%Booking Time%
%%%%%%%%%%%%%%

%Retrieves data from the .txt file and puts it in a rectangular matrix
DTP = strcat(num2str(ITERS),'/run1.',num2str(ITERS),'.CS.txt'); %file name = 'myfile01.txt' 
input = strcat(inputBaseITER,DTP);                      %merge 2 or more strings
delimiterIn = ",";
BookingTimePercentage = inputTable(:,[1 15 15]);
BookingTimePercentage = table2array(BookingTimePercentage);
BookingTimePercentage(:,2) = (BookingTimePercentage(:,2)/(DayHours*3600))*100;

%Sums all the utilization time for the same vehicle - https://stackoverflow.com/questions/50025485/matlab-how-can-i-sum-all-the-rows-of-the-first-column-when-on-the-second-column
[VehId,~,id] = unique(BookingTimePercentage(:,2),'stable');
filename = sprintf('Booking_Time_%i.mat',y);
save(filename,'BookingTimePercentage');
BookingTimePercentage = [accumarray(id,BookingTimePercentage(:,3)), VehId];
SortedBookingTimePercentage = sortrows(BookingTimePercentage,1,'descend'); 

%Sums all the booking time giving back a global driving time
CTot=sum(SortedBookingTimePercentage);
TotalBookingTimeSecs = CTot(:,1);
TotalBookingTimeMin = TotalBookingTimeSecs/60;
TotalBookingTimehour = TotalBookingTimeMin/60;


%%%%%%%%%%%%%%%%
%Total Distance%
%%%%%%%%%%%%%%%%

VehXDist = inputTable(:,[9 13]);                           %Caring only about the Distance (9) and the vehicleId (13)
VehXDist = table2array(VehXDist);
Distance = VehXDist(:,1); 

DistanceTot = sum(Distance)/1000;
VehXDist(:,1) = VehXDist(:,1)/1000;
VehXDist = sortrows(VehXDist,2);

%Vehicle X Kilometer
[VehXDistunique,~,idx] = unique(VehXDist(:,2));
nu = numel(VehXDistunique);
VehXDist_sum = zeros(nu,size(VehXDist,2));
for ii = 1:nu
    VehXDist_sum(ii,:) = sum(VehXDist(idx==ii,1));
end
VehXDist_sum(:,2) = VehXDistunique;

VehXDist_sum = sortrows(VehXDist_sum,1);
plot(1:numel(VehXDist_sum(:,2)),VehXDist_sum(:,1),'r');    %Plot the 1st simulation Shifting Rental Starts
hold on
title('Fleet Utilization 1');
ylabel('Vehicle * Km');
xlabel('Veh');
hold off

VehXDist_sum_TOT=sum(VehXDist_sum(:,1));

filename = sprintf('VehXDist_sum_TOT%i.mat',y);
save(filename,'VehXDist_sum_TOT');
filename = sprintf('VehXDist_sum%i.mat',y);
save(filename,'VehXDist_sum');

%%%%%%%%%%%%%%%%%%%%%%%
%Shifting Rental Start%
%%%%%%%%%%%%%%%%%%%%%%%

SRS = inputTable(:,[1 3]); %Caring only about the Starting time (3) and the personID (1)
SRS = table2array(SRS);
SRSh = SRS(:,2)/3600;
SRS(:,2) = SRSh;

filename = sprintf('SRS%i.mat',y);
save(filename,'SRS');

%%%%%%%%%%%%%%%%%%%
%Fleet Utilization%
%%%%%%%%%%%%%%%%%%%

Rentals = inputTable(:,[13 1]); %personID (1) and vehicleID (13)
Rentals = table2array(Rentals);

[VehId,~,id] = unique(Rentals(:,1),'stable');
VehTot = [accumarray(id,Rentals(:,2)), VehId];
VehTot = numel(VehTot(:,2));

%Vehicle X Km (or PAX X Km)

RentalsXKm = DistanceTot * numel(Rentals(:,2));
VehXKm = DistanceTot * VehTot;


%%%%%%%%%%%%%
%Access Time%
%%%%%%%%%%%%%

AccessTime = inputTable(:,[11 1]);
AccessTime = table2array(AccessTime);
AccessTime = sortrows(AccessTime,1);

AccessTimeTot=sum(AccessTime(:,1));
filename = sprintf('AccessTime%i.mat',y);
save(filename,'AccessTime','AccessTimeTot');

%AccessTime with the VOT
AccessTime = sortrows(AccessTime);                        %Sort by the ID
VOT_ID_AccessTime = ismember(VOT_ID,AccessTime);                  %Check same ID in VOT_ID and SRS1
VOT_ID_AccessTime(:,2) = VOT_ID_AccessTime(:,1);            
VOT_ID_AccessTime = VOT_ID_AccessTime.*VOT_ID;
VOT_ID_AccessTime = VOT_ID_AccessTime';
VOT_ID_AccessTime(VOT_ID_AccessTime==0) = [];               %Remove the 0s
VOT_ID_AccessTime = reshape(VOT_ID_AccessTime,2,[]);        %Reshape it as before [101x2]
VOT_ID_AccessTime = VOT_ID_AccessTime';
AccessTime = AccessTime(1:length(VOT_ID_AccessTime),:);
VOT_ID_AccessTime = VOT_ID_AccessTime(1:numel(AccessTime(:,1)),1:numel(AccessTime(1,:)));
VOT_ID_AccessTime = sortrows(VOT_ID_AccessTime,'ascend');

AccessTime_VOT = [AccessTime VOT_ID_AccessTime(:,2)];                   %Put them together
AccessTime_VOT = sortrows(AccessTime_VOT,3,'ascend');                   %sort by the VOT

AccessTime_VOT = [AccessTime_VOT(:,1) AccessTime_VOT(:,3)];

%Vehicle X Kilometer
[AccessTime_VOTunique,~,idx] = unique(AccessTime_VOT(:,2));
nu = numel(AccessTime_VOTunique);
AccessTime_VOT_sum = zeros(nu,size(AccessTime_VOT,2));
for ii = 1:nu
    AccessTime_VOT_sum(ii,:) = mean(AccessTime_VOT(idx==ii,1));
end
AccessTime_VOT_sum(:,2) = AccessTime_VOTunique;

filename = sprintf('AccessTime%i_VOT_sum.mat',y);
save(filename,'AccessTime_VOT_sum','AccessTime_VOTunique');