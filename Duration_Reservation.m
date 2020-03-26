%DURATION RESERVATION FOR VOT

load Driving_Time_1.mat
Driving_Time_1 = DrivingTimePercentage;
load Driving_Time_2.mat
Driving_Time_2 = DrivingTimePercentage;
load Driving_Time_3.mat
Driving_Time_3 = DrivingTimePercentage;
load Driving_Time_4.mat
Driving_Time_4 = DrivingTimePercentage;

load Booking_Time_1.mat
Booking_Time_1 = BookingTimePercentage;
load Booking_Time_2.mat
Booking_Time_2 = BookingTimePercentage;
load Booking_Time_3.mat
Booking_Time_3 = BookingTimePercentage;
load Booking_Time_4.mat
Booking_Time_4 = BookingTimePercentage;

%% Add the VOT to AccessTime# to check the VOT of people walking for SHIFTING RENTAL STARTS #1
Driving_Time_1(:,1) = [];
Driving_Time_1 = sortrows(Driving_Time_1,2);                              %Sort by the ID
Driving_Time_1 = table2array(Driving_Time_1);
VOT_ID_Rented = ismember(VOT_ID,Driving_Time_1);              %Check same ID in VOT_ID and Driving_Time_1
VOT_ID_Rented(:,2) = VOT_ID_Rented(:,1);            
VOT_ID_Rented = VOT_ID_Rented.*VOT_ID;
VOT_ID_Rented = VOT_ID_Rented';
VOT_ID_Rented(VOT_ID_Rented==0) = [];               %Remove the 0s
VOT_ID_Rented = reshape(VOT_ID_Rented,2,[]);        %Reshape it as before 
VOT_ID_Rented = VOT_ID_Rented';
VOT_ID_Rented = sortrows(VOT_ID_Rented,'ascend');
VOT_ID_Rented = VOT_ID_Rented(1:numel(Driving_Time_1(:,1)),:);                                                                                     %remove if "Dimensions of arrays being concatenated are not consistent."
Driving_Time_1_VOT = [Driving_Time_1 VOT_ID_Rented(:,2)];               %Put them together
Driving_Time_1_VOT = sortrows(Driving_Time_1_VOT,3,'ascend');           %sort by the VOT

%% Add the VOT to AccessTime# to check the VOT of people walking for SHIFTING RENTAL STARTS #2
Driving_Time_2(:,1) = [];
Driving_Time_2 = sortrows(Driving_Time_2);                              %Sort by the ID
Driving_Time_2 = table2array(Driving_Time_2);
VOT_ID_Rented = ismember(VOT_ID,Driving_Time_2);              %Check same ID in VOT_ID and Driving_Time_1
VOT_ID_Rented(:,2) = VOT_ID_Rented(:,1);            
VOT_ID_Rented = VOT_ID_Rented.*VOT_ID;
VOT_ID_Rented = VOT_ID_Rented';
VOT_ID_Rented(VOT_ID_Rented==0) = [];               %Remove the 0s
VOT_ID_Rented = reshape(VOT_ID_Rented,2,[]);        %Reshape it as before [109x2]
VOT_ID_Rented = VOT_ID_Rented';
VOT_ID_Rented = sortrows(VOT_ID_Rented,'ascend');
Driving_Time_2_VOT = [Driving_Time_2 VOT_ID_Rented(:,2)];               %Put them together
Driving_Time_2_VOT = sortrows(Driving_Time_2_VOT,3,'ascend');           %sort by the VOT


%% Add the VOT to AccessTime# to check the VOT of people walking for SHIFTING RENTAL STARTS #3
Driving_Time_3(:,1) = [];
Driving_Time_3 = sortrows(Driving_Time_3);                              %Sort by the ID
Driving_Time_3 = table2array(Driving_Time_3);
VOT_ID_Rented = ismember(VOT_ID,Driving_Time_3);              %Check same ID in VOT_ID and Driving_Time_1
VOT_ID_Rented(:,2) = VOT_ID_Rented(:,1);            
VOT_ID_Rented = VOT_ID_Rented.*VOT_ID;
VOT_ID_Rented = VOT_ID_Rented';
VOT_ID_Rented(VOT_ID_Rented==0) = [];               %Remove the 0s
VOT_ID_Rented = reshape(VOT_ID_Rented,2,[]);        %Reshape it as before [109x2]
VOT_ID_Rented = VOT_ID_Rented';
VOT_ID_Rented = sortrows(VOT_ID_Rented,'ascend');
VOT_ID_Rented = VOT_ID_Rented(1:numel(Driving_Time_3(:,1)),:);          %remove if "Dimensions of arrays being concatenated are not consistent."
Driving_Time_3_VOT = [Driving_Time_3 VOT_ID_Rented(:,2)];               %Put them together
Driving_Time_3_VOT = sortrows(Driving_Time_3_VOT,3,'ascend');           %sort by the VOT

%% Add the VOT to AccessTime# to check the VOT of people walking for SHIFTING RENTAL STARTS #4
Driving_Time_4(:,1) = [];
Driving_Time_4 = sortrows(Driving_Time_4);                              %Sort by the ID
Driving_Time_4 = table2array(Driving_Time_4);
VOT_ID_Rented = ismember(VOT_ID,Driving_Time_4);              %Check same ID in VOT_ID and Driving_Time_1
VOT_ID_Rented(:,2) = VOT_ID_Rented(:,1);            
VOT_ID_Rented = VOT_ID_Rented.*VOT_ID;
VOT_ID_Rented = VOT_ID_Rented';
VOT_ID_Rented(VOT_ID_Rented==0) = [];               %Remove the 0s
VOT_ID_Rented = reshape(VOT_ID_Rented,2,[]);        %Reshape it as before [109x2]
VOT_ID_Rented = VOT_ID_Rented';
VOT_ID_Rented = sortrows(VOT_ID_Rented,'ascend');
VOT_ID_Rented = VOT_ID_Rented(1:numel(Driving_Time_4(:,1)),:);          %remove if "Dimensions of arrays being concatenated are not consistent."
Driving_Time_4_VOT = [Driving_Time_4 VOT_ID_Rented(:,2)];               %Put them together
Driving_Time_4_VOT = sortrows(Driving_Time_4_VOT,3,'ascend');           %sort by the VOT


%% Evaluate the differences between two simulations based on the VOT

%Sim1
Driving_Time_1_VOT = Driving_Time_1_VOT(:,[1 3]);                       %Take the 2 column that are important

[Driving_Time_1_VOT_unique,~,idx] = unique(Driving_Time_1_VOT(:,2));    %create unique matrix and id the same values
nu = numel(Driving_Time_1_VOT_unique);
Driving_Time_1_VOT_sum = zeros(nu,size(Driving_Time_1_VOT,2));          %initialize the matrix
for ii = 1:nu
  Driving_Time_1_VOT_sum(ii,:) = mean(Driving_Time_1_VOT(idx==ii,:));    %sum the same time with the same VOT
end
Driving_Time_1_VOT_sum(:,2) = Driving_Time_1_VOT_unique;                %finalize the matrix setting the VOT

%Sim2
Driving_Time_2_VOT = Driving_Time_2_VOT(:,[1 3]);                       %Take the 2 column that are important

[Driving_Time_2_VOT_unique,~,idx] = unique(Driving_Time_2_VOT(:,2));    %create unique matrix and id the same values
nu = numel(Driving_Time_2_VOT_unique);
Driving_Time_2_VOT_sum = zeros(nu,size(Driving_Time_2_VOT,2));          %initialize the matrix
for ii = 1:nu
  Driving_Time_2_VOT_sum(ii,:) = mean(Driving_Time_2_VOT(idx==ii,:));    %sum the same time with the same VOT
end
Driving_Time_2_VOT_sum(:,2) = Driving_Time_2_VOT_unique;                %finalize the matrix setting the VOT

%Delta_Driving1_2 = Driving_Time_1_VOT_sum(:,1)-Driving_Time_2_VOT_sum(:,1);   %Check the Delta_Driving between the 2 simulations


%Sim3
Driving_Time_3_VOT = Driving_Time_3_VOT(:,[1 3]);                       %Take the 2 column that are important

[Driving_Time_3_VOT_unique,~,idx] = unique(Driving_Time_3_VOT(:,2));    %create unique matrix and id the same values
nu = numel(Driving_Time_3_VOT_unique);
Driving_Time_3_VOT_sum = zeros(nu,size(Driving_Time_3_VOT,2));          %initialize the matrix
for ii = 1:nu
  Driving_Time_3_VOT_sum(ii,:) = mean(Driving_Time_3_VOT(idx==ii,:));    %sum the same time with the same VOT
end
Driving_Time_3_VOT_sum(:,2) = Driving_Time_3_VOT_unique;                %finalize the matrix setting the VOT

Delta_Driving2_3 = Driving_Time_2_VOT_sum(:,1)-Driving_Time_3_VOT_sum(:,1);   %Check the Delta_Driving between the 2 simulation

%Sim4
Driving_Time_4_VOT = Driving_Time_4_VOT(:,[1 3]);                       %Take the 2 column that are important

[Driving_Time_4_VOT_unique,~,idx] = unique(Driving_Time_4_VOT(:,2));    %create unique matrix and id the same values
nu = numel(Driving_Time_4_VOT_unique);
Driving_Time_4_VOT_sum = zeros(nu,size(Driving_Time_4_VOT,2));          %initialize the matrix
for ii = 1:nu
  Driving_Time_4_VOT_sum(ii,:) = mean(Driving_Time_4_VOT(idx==ii,:));    %sum the same time with the same VOT
end
Driving_Time_4_VOT_sum(:,2) = Driving_Time_4_VOT_unique;                %finalize the matrix setting the VOT

Delta_Driving2_4 = Driving_Time_2_VOT_sum(:,1)-Driving_Time_4_VOT_sum(:,1);   %Check the Delta_Driving between the 2 simulation

%% Plot

%Delta_Driving STARTING TIME
%Plot the Delta_Driving time 1-2
% scatter(Driving_Time_1_VOT_unique,Delta_Driving1_2);
% hold on
% plot(0);
% title('Differential in Driving Time 1-2');
% xticks(Driving_Time_1_VOT_unique);
% xtickangle(90);
% xlabel('VOT');
% ylabel('Driving Time mean [s]');
% hold off
% filename = sprintf('Delta_Driving time 1-2.png');
% saveas(gca,filename);

%Plot the Delta_Driving time 2-3
scatter(Driving_Time_2_VOT_unique,Delta_Driving2_3,'b');
hold on
plot(0);
title('Differential in Driving Time 2-3');
xticks(Driving_Time_2_VOT_unique);
xtickangle(90);
xlabel('IF');
ylabel('Driving Time mean [s]');
filename = sprintf('Delta_Driving time 2-3.png');
saveas(gca,filename);
hold off

%Plot the Delta_Driving time 2-4
scatter(Driving_Time_2_VOT_unique,Delta_Driving2_4,'m');
hold on
plot(0);
title('Differential in Driving Time 2-4');
xticks(Driving_Time_2_VOT_unique);
xtickangle(90);
xlabel('IF');
ylabel('Driving Time mean [s]');
filename = sprintf('Delta_Driving time 2-4.png');
saveas(gca,filename);
hold off

%% For the booking 
%Add the VOT to AccessTime# to check the VOT of people walking for SHIFTING RENTAL STARTS #1
Booking_Time_1(:,2) = [];
Booking_Time_1 = sortrows(Booking_Time_1,2);                              %Sort by the ID
VOT_ID_Rented = ismember(VOT_ID,Booking_Time_1);              %Check same ID in VOT_ID and Booking_Time_1
VOT_ID_Rented(:,2) = VOT_ID_Rented(:,1);            
VOT_ID_Rented = VOT_ID_Rented.*VOT_ID;
VOT_ID_Rented = VOT_ID_Rented';
VOT_ID_Rented(VOT_ID_Rented==0) = [];               %Remove the 0s
VOT_ID_Rented = reshape(VOT_ID_Rented,2,[]);        %Reshape it as before 
VOT_ID_Rented = VOT_ID_Rented';
VOT_ID_Rented = sortrows(VOT_ID_Rented,'ascend');
VOT_ID_Rented = VOT_ID_Rented(1:numel(Booking_Time_1(:,1)),:);
Booking_Time_1_VOT = [Booking_Time_1 VOT_ID_Rented(:,2)];               %Put them together
Booking_Time_1_VOT = sortrows(Booking_Time_1_VOT,3,'ascend');           %sort by the VOT

%Add the VOT to AccessTime# to check the VOT of people walking for SHIFTING RENTAL STARTS #2
Booking_Time_2(:,2) = [];
Booking_Time_2 = sortrows(Booking_Time_2);                              %Sort by the ID
VOT_ID_Rented = ismember(VOT_ID,Booking_Time_2);              %Check same ID in VOT_ID and Booking_Time_1
VOT_ID_Rented(:,2) = VOT_ID_Rented(:,1);            
VOT_ID_Rented = VOT_ID_Rented.*VOT_ID;
VOT_ID_Rented = VOT_ID_Rented';
VOT_ID_Rented(VOT_ID_Rented==0) = [];               %Remove the 0s
VOT_ID_Rented = reshape(VOT_ID_Rented,2,[]);        %Reshape it as before [109x2]
VOT_ID_Rented = VOT_ID_Rented';
VOT_ID_Rented = sortrows(VOT_ID_Rented,'ascend');
Booking_Time_2_VOT = [Booking_Time_2 VOT_ID_Rented(:,2)];               %Put them together
Booking_Time_2_VOT = sortrows(Booking_Time_2_VOT,3,'ascend');           %sort by the VOT


%Add the VOT to AccessTime# to check the VOT of people walking for SHIFTING RENTAL STARTS #3
Booking_Time_3(:,2) = [];
Booking_Time_3 = sortrows(Booking_Time_3);                              %Sort by the ID
VOT_ID_Rented = ismember(VOT_ID,Booking_Time_3);              %Check same ID in VOT_ID and Booking_Time_1
VOT_ID_Rented(:,2) = VOT_ID_Rented(:,1);            
VOT_ID_Rented = VOT_ID_Rented.*VOT_ID;
VOT_ID_Rented = VOT_ID_Rented';
VOT_ID_Rented(VOT_ID_Rented==0) = [];               %Remove the 0s
VOT_ID_Rented = reshape(VOT_ID_Rented,2,[]);        %Reshape it as before [109x2]
VOT_ID_Rented = VOT_ID_Rented';
VOT_ID_Rented = sortrows(VOT_ID_Rented,'ascend');
VOT_ID_Rented = VOT_ID_Rented(1:numel(Booking_Time_3(:,1)),:);                                                                                  %remove if "Dimensions of arrays being concatenated are not consistent."
Booking_Time_3_VOT = [Booking_Time_3 VOT_ID_Rented(:,2)];               %Put them together
Booking_Time_3_VOT = sortrows(Booking_Time_3_VOT,3,'ascend');           %sort by the VOT

%Add the VOT to AccessTime# to check the VOT of people walking for SHIFTING RENTAL STARTS #4
Booking_Time_4(:,2) = [];
Booking_Time_4 = sortrows(Booking_Time_4);                              %Sort by the ID
VOT_ID_Rented = ismember(VOT_ID,Booking_Time_4);              %Check same ID in VOT_ID and Booking_Time_1
VOT_ID_Rented(:,2) = VOT_ID_Rented(:,1);            
VOT_ID_Rented = VOT_ID_Rented.*VOT_ID;
VOT_ID_Rented = VOT_ID_Rented';
VOT_ID_Rented(VOT_ID_Rented==0) = [];               %Remove the 0s
VOT_ID_Rented = reshape(VOT_ID_Rented,2,[]);        %Reshape it as before [109x2]
VOT_ID_Rented = VOT_ID_Rented';
VOT_ID_Rented = sortrows(VOT_ID_Rented,'ascend');
VOT_ID_Rented = VOT_ID_Rented(1:numel(Booking_Time_4(:,1)),:);                                                                                  %remove if "Dimensions of arrays being concatenated are not consistent."
Booking_Time_4_VOT = [Booking_Time_4 VOT_ID_Rented(:,2)];               %Put them together
Booking_Time_4_VOT = sortrows(Booking_Time_4_VOT,3,'ascend');           %sort by the VOT

%% Evaluate the differences between two simulations based on the VOT

%Sim1
Booking_Time_1_VOT = Booking_Time_1_VOT(:,[2 3]);                       %Take the 2 column that are important

[Booking_Time_1_VOT_unique,~,idx] = unique(Booking_Time_1_VOT(:,2));    %create unique matrix and id the same values
nu = numel(Booking_Time_1_VOT_unique);
Booking_Time_1_VOT_sum = zeros(nu,size(Booking_Time_1_VOT,2));          %initialize the matrix
for ii = 1:nu
  Booking_Time_1_VOT_sum(ii,:) = mean(Booking_Time_1_VOT(idx==ii,:));    %sum the same time with the same VOT
end
Booking_Time_1_VOT_sum(:,2) = Booking_Time_1_VOT_unique;                %finalize the matrix setting the VOT

%Sim2
Booking_Time_2_VOT = Booking_Time_2_VOT(:,[2 3]);                       %Take the 2 column that are important

[Booking_Time_2_VOT_unique,~,idx] = unique(Booking_Time_2_VOT(:,2));    %create unique matrix and id the same values
nu = numel(Booking_Time_2_VOT_unique);
Booking_Time_2_VOT_sum = zeros(nu,size(Booking_Time_2_VOT,2));          %initialize the matrix
for ii = 1:nu
  Booking_Time_2_VOT_sum(ii,:) = mean(Booking_Time_2_VOT(idx==ii,:));    %sum the same time with the same VOT
end
Booking_Time_2_VOT_sum(:,2) = Booking_Time_2_VOT_unique;                %finalize the matrix setting the VOT

%Delta_Booking1_2 = Booking_Time_1_VOT_sum(:,1)-Booking_Time_2_VOT_sum(:,1);   %Check the Delta_Booking between the 2 simulations

%Sim3
Booking_Time_3_VOT = Booking_Time_3_VOT(:,[2 3]);                       %Take the 2 column that are important

[Booking_Time_3_VOT_unique,~,idx] = unique(Booking_Time_3_VOT(:,2));    %create unique matrix and id the same values
nu = numel(Booking_Time_3_VOT_unique);
Booking_Time_3_VOT_sum = zeros(nu,size(Booking_Time_3_VOT,2));          %initialize the matrix
for ii = 1:nu
  Booking_Time_3_VOT_sum(ii,:) = mean(Booking_Time_3_VOT(idx==ii,:));    %sum the same time with the same VOT
end
Booking_Time_3_VOT_sum(:,2) = Booking_Time_3_VOT_unique;                %finalize the matrix setting the VOT

Delta_Booking2_3 = Booking_Time_2_VOT_sum(:,1)-Booking_Time_3_VOT_sum(:,1);   %Check the Delta_Booking between the 2 simulation

%Sim4
Booking_Time_4_VOT = Booking_Time_4_VOT(:,[2 4]);                       %Take the 2 column that are important

[Booking_Time_4_VOT_unique,~,idx] = unique(Booking_Time_4_VOT(:,2));    %create unique matrix and id the same values
nu = numel(Booking_Time_4_VOT_unique);
Booking_Time_4_VOT_sum = zeros(nu,size(Booking_Time_4_VOT,2));          %initialize the matrix
for ii = 1:nu
  Booking_Time_4_VOT_sum(ii,:) = mean(Booking_Time_4_VOT(idx==ii,:));    %sum the same time with the same VOT
end
Booking_Time_4_VOT_sum(:,2) = Booking_Time_4_VOT_unique;                %finalize the matrix setting the VOT

Delta_Booking2_4 = Booking_Time_2_VOT_sum(:,1)-Booking_Time_4_VOT_sum(:,1);   %Check the Delta_Booking between the 2 simulation

%% Plot

% %Delta_Booking STARTING TIME
% %Plot the Delta_Booking time 1-2
% scatter(Booking_Time_1_VOT_unique,Delta_Booking1_2);
% hold on
% plot(0);
% title('Differential in Booking Time 1-2');
% xticks(Booking_Time_1_VOT_unique);
% xtickangle(90);
% xlabel('VOT');
% ylabel('Booking Time mean [s]');
% hold off
% filename = sprintf('Delta_Booking time 1-2.png');
% saveas(gca,filename);

%Plot the Delta_Booking time 2-3
scatter(Booking_Time_2_VOT_unique,Delta_Booking2_3,'b');
hold on
plot(0);
title('Differential in Booking Time 2-3');
xticks(Booking_Time_2_VOT_unique);
xtickangle(90);
xlabel('VOT');
ylabel('Booking Time mean [s]');
filename = sprintf('Delta_Booking time 2-3.png');
saveas(gca,filename);
hold off

%Plot the Delta_Booking time 2-4
scatter(Booking_Time_2_VOT_unique,Delta_Booking2_4,'m');
hold on
plot(0);
title('Differential in Booking Time 2-4');
xticks(Booking_Time_2_VOT_unique);
xtickangle(90);
xlabel('VOT');
ylabel('Booking Time mean [s]');
filename = sprintf('Delta_Booking time 2-4.png');
saveas(gca,filename);
hold off