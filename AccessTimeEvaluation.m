%Output for every simulation:
%Access time with VOT

load AccessTime1.mat
AccessTime1 = AccessTime;
load AccessTime2.mat
AccessTime2 = AccessTime;
load AccessTime3.mat
AccessTime3 = AccessTime;
load AccessTime4.mat
AccessTime4 = AccessTime;
clear AccessTime;

Y1 = 1:numel(AccessTime1(:,2));
Y1 = Y1';
Y2 = 1:numel(AccessTime2(:,2));
Y2 = Y2';
Y3 = 1:numel(AccessTime3(:,2));
Y3 = Y3';
Y4 = 1:numel(AccessTime4(:,2));
Y4 = Y4';

%DELTA ACCESS TIME

%Add the VOT to AccessTime# to check the VOT of people walking for SHIFTING RENTAL STARTS #1
AccessTime1 = sortrows(AccessTime1,2);                      %Sort by the ID
VOT_ID_Rented = ismember(VOT_ID,AccessTime1);               %Check same ID in VOT_ID and AccessTime
VOT_ID_Rented(:,2) = VOT_ID_Rented(:,1);            
VOT_ID_Rented = VOT_ID_Rented.*VOT_ID;
VOT_ID_Rented = VOT_ID_Rented';
VOT_ID_Rented(VOT_ID_Rented==0) = [];                       %Remove the 0s
VOT_ID_Rented = reshape(VOT_ID_Rented,2,[]);                %Reshape it as before
VOT_ID_Rented = VOT_ID_Rented';
VOT_ID_Rented = sortrows(VOT_ID_Rented,'ascend');
AccessTime1 = AccessTime1(1:numel(VOT_ID_Rented(:,1)),:);
AccessTime1_VOT = [AccessTime1 VOT_ID_Rented(:,2)];         %Put them together
AccessTime1_VOT = sortrows(AccessTime1_VOT,3,'ascend');     %sort by the VOT

%Add the VOT to AccessTime# to check the VOT of people walking for SHIFTING RENTAL STARTS #3
AccessTime2 = sortrows(AccessTime2,2);                      %Sort by the ID
VOT_ID_Rented = ismember(VOT_ID,AccessTime2);               %Check same ID in VOT_ID and AccessTime
VOT_ID_Rented(:,2) = VOT_ID_Rented(:,1);            
VOT_ID_Rented = VOT_ID_Rented.*VOT_ID;
VOT_ID_Rented = VOT_ID_Rented';
VOT_ID_Rented(VOT_ID_Rented==0) = [];                       %Remove the 0s
VOT_ID_Rented = reshape(VOT_ID_Rented,2,[]);                %Reshape it as before
VOT_ID_Rented = VOT_ID_Rented';
VOT_ID_Rented = sortrows(VOT_ID_Rented,'ascend');
AccessTime2 = AccessTime2(1:numel(VOT_ID_Rented(:,1)),:);                     %Put them together
AccessTime2_VOT = [AccessTime2 VOT_ID_Rented(:,2)];         %Put them together
AccessTime2_VOT = sortrows(AccessTime2_VOT,3,'ascend');     %sort by the VOT

%Add the VOT to AccessTime# to check the VOT of people walking for SHIFTING RENTAL STARTS #4
AccessTime3 = sortrows(AccessTime3,2);                      %Sort by the ID
VOT_ID_Rented = ismember(VOT_ID,AccessTime3);               %Check same ID in VOT_ID and AccessTime
VOT_ID_Rented(:,2) = VOT_ID_Rented(:,1);            
VOT_ID_Rented = VOT_ID_Rented.*VOT_ID;
VOT_ID_Rented = VOT_ID_Rented';
VOT_ID_Rented(VOT_ID_Rented==0) = [];                       %Remove the 0s
VOT_ID_Rented = reshape(VOT_ID_Rented,2,[]);                %Reshape it as before
VOT_ID_Rented = VOT_ID_Rented';
VOT_ID_Rented = sortrows(VOT_ID_Rented,'ascend');
AccessTime3 = AccessTime3(1:length(VOT_ID_Rented),:);
AccessTime3_VOT = [AccessTime3 VOT_ID_Rented(:,2)];         %Put them together
AccessTime3_VOT = sortrows(AccessTime3_VOT,3,'ascend');     %sort by the VOT

%Add the VOT to AccessTime# to check the VOT of people walking for SHIFTING RENTAL STARTS #4
AccessTime4 = sortrows(AccessTime4,2);                      %Sort by the ID
VOT_ID_Rented = ismember(VOT_ID,AccessTime4);               %Check same ID in VOT_ID and AccessTime
VOT_ID_Rented(:,2) = VOT_ID_Rented(:,1);            
VOT_ID_Rented = VOT_ID_Rented.*VOT_ID;
VOT_ID_Rented = VOT_ID_Rented';
VOT_ID_Rented(VOT_ID_Rented==0) = [];                       %Remove the 0s
VOT_ID_Rented = reshape(VOT_ID_Rented,2,[]);                %Reshape it as before
VOT_ID_Rented = VOT_ID_Rented';
VOT_ID_Rented = sortrows(VOT_ID_Rented,'ascend');
AccessTime4 = AccessTime4(1:length(VOT_ID_Rented),:);
AccessTime4_VOT = [AccessTime4 VOT_ID_Rented(:,2)];         %Put them together
AccessTime4_VOT = sortrows(AccessTime4_VOT,3,'ascend');     %sort by the VOT

%Evaluate the differences between two simulations based on the VOT
%Sim1
AccessTime1_VOT = AccessTime1_VOT(:,[1 3]);                       %Take the 2 column that are important

[AccessTime1_VOT_unique,~,idx] = unique(AccessTime1_VOT(:,2));    %create unique matrix and id the same values
nu = numel(AccessTime1_VOT_unique);
AccessTime1_VOT_sum = zeros(nu,size(AccessTime1_VOT,2));          %initialize the matrix
for ii = 1:nu
  AccessTime1_VOT_sum(ii,:) = mean(AccessTime1_VOT(idx==ii,:));    %sum the same time with the same VOT
end
AccessTime1_VOT_sum(:,2) = AccessTime1_VOT_unique;                %finalize the matrix setting the VOT

AccessTime1_VOT_sum = [AccessTime1_VOT_sum(:,2) AccessTime1_VOT_sum(:,1)];

%Check that there are all the VOTs
if length(AccessTime1_VOT_sum(:,1)) ~= length(IF(:,1))
    for ctrl = 1:length(IF)
        if ctrl == (length(IF)-1)  && length(AccessTime1_VOT_sum(:,1)) ~= length(IF(:,1))
            AccessTime1_VOT_sum = insertrows(AccessTime1_VOT_sum,IF(ctrl+1,:),ctrl+1);
        end
        if AccessTime1_VOT_sum(:,1) == IF(1,1)
            AccessTime1_VOT_sum(2:length(IF),:) = IF(2:length(IF),:);
        end
        if AccessTime1_VOT_sum(ctrl,1) ~= IF(ctrl,1) && length(AccessTime1_VOT_sum(:,1)) ~= length(IF(:,1))
            AccessTime1_VOT_sum = insertrows(AccessTime1_VOT_sum,IF(ctrl,:),ctrl);
        end
    end 
end
AccessTime1_VOT_sum = sortrows(AccessTime1_VOT_sum);

AccessTime2_VOT = AccessTime2_VOT(:,[1 3]);                       %Take the 2 column that are important

[AccessTime2_VOT_unique,~,idx] = unique(AccessTime2_VOT(:,2));    %create unique matrix and id the same values
nu = numel(AccessTime2_VOT_unique);
AccessTime2_VOT_sum = zeros(nu,size(AccessTime2_VOT,2));          %initialize the matrix
for ii = 1:nu
  AccessTime2_VOT_sum(ii,:) = mean(AccessTime2_VOT(idx==ii,:));    %sum the same time with the same VOT
end
AccessTime2_VOT_sum(:,2) = AccessTime2_VOT_unique;                %finalize the matrix setting the VOT

AccessTime2_VOT_sum = [AccessTime2_VOT_sum(:,2) AccessTime2_VOT_sum(:,1)];

%Check that there are all the VOTs
if length(AccessTime2_VOT_sum(:,1)) ~= length(IF(:,1))
    for ctrl = 1:length(IF)
        if ctrl == (length(IF)-1) && length(AccessTime2_VOT_sum(:,1)) ~= length(IF(:,1))
            AccessTime2_VOT_sum = insertrows(AccessTime2_VOT_sum,IF(ctrl+1,:),ctrl+1);
        end
        if AccessTime2_VOT_sum(:,1) == IF(1,1)
            AccessTime2_VOT_sum(2:length(IF),:) = IF(2:length(IF),:);
        end
        if AccessTime2_VOT_sum(ctrl,1) ~= IF(ctrl,1) && length(AccessTime2_VOT_sum(:,1)) ~= length(IF(:,1))
            AccessTime2_VOT_sum = insertrows(AccessTime2_VOT_sum,IF(ctrl,:),ctrl);
        end
    end 
end
AccessTime2_VOT_sum = sortrows(AccessTime2_VOT_sum);

%DELTA
%Delta1_2 = AccessTime1_VOT_sum(:,1)-AccessTime2_VOT_sum(:,1);   %Check the delta between the 2 simulations

%Sim3
AccessTime3_VOT = AccessTime3_VOT(:,[1 3]);                       %Take the 2 column that are important

[AccessTime3_VOT_unique,~,idx] = unique(AccessTime3_VOT(:,2));    %create unique matrix and id the same values
nu = numel(AccessTime3_VOT_unique);
AccessTime3_VOT_sum = zeros(nu,size(AccessTime3_VOT,2));          %initialize the matrix
for ii = 1:nu
  AccessTime3_VOT_sum(ii,:) = mean(AccessTime3_VOT(idx==ii,:));    %sum the same time with the same VOT
end
AccessTime3_VOT_sum(:,2) = AccessTime3_VOT_unique;                %finalize the matrix setting the VOT

AccessTime3_VOT_sum = [AccessTime3_VOT_sum(:,2) AccessTime3_VOT_sum(:,1)];

%Check that there are all the VOTs
if length(AccessTime3_VOT_sum(:,1)) ~= length(IF(:,1))
    for ctrl = 1:length(IF)
        if ctrl == (length(IF)-1)  && length(AccessTime3_VOT_sum(:,1)) ~= length(IF(:,1))
            AccessTime3_VOT_sum = insertrows(AccessTime3_VOT_sum,IF(ctrl+1,:),ctrl+1);
        end
        if AccessTime3_VOT_sum(:,1) == IF(1,1)
            AccessTime3_VOT_sum(2:length(IF),:) = IF(2:length(IF),:);
        end
        if AccessTime3_VOT_sum(ctrl,1) ~= IF(ctrl,1) && length(AccessTime3_VOT_sum(:,1)) ~= length(IF(:,1))
            AccessTime3_VOT_sum = insertrows(AccessTime3_VOT_sum,IF(ctrl,:),ctrl);
        end
    end 
end
AccessTime3_VOT_sum = sortrows(AccessTime3_VOT_sum);

%Sim4
AccessTime4_VOT = AccessTime4_VOT(:,[1 3]);                       %Take the 2 column that are important

[AccessTime4_VOT_unique,~,idx] = unique(AccessTime4_VOT(:,2));    %create unique matrix and id the same values
nu = numel(AccessTime4_VOT_unique);
AccessTime4_VOT_sum = zeros(nu,size(AccessTime4_VOT,2));          %initialize the matrix
for ii = 1:nu
  AccessTime4_VOT_sum(ii,:) = mean(AccessTime4_VOT(idx==ii,:));    %sum the same time with the same VOT
end
AccessTime4_VOT_sum(:,2) = AccessTime4_VOT_unique;                %finalize the matrix setting the VOT

AccessTime4_VOT_sum = [AccessTime4_VOT_sum(:,2) AccessTime4_VOT_sum(:,1)];

%Check that there are all the VOTs
if length(AccessTime4_VOT_sum(:,1)) ~= length(IF(:,1))
    for ctrl = 1:length(IF)
        if ctrl == (length(IF)-1)  && length(AccessTime4_VOT_sum(:,1)) ~= length(IF(:,1))
            AccessTime4_VOT_sum = insertrows(AccessTime4_VOT_sum,IF(ctrl+1,:),ctrl+1);
        end
        if AccessTime4_VOT_sum(:,1) == IF(1,1)
            AccessTime4_VOT_sum(2:length(IF),:) = IF(2:length(IF),:);
        end
        if AccessTime4_VOT_sum(ctrl,1) ~= IF(ctrl,1) && length(AccessTime4_VOT_sum(:,1)) ~= length(IF(:,1))
            AccessTime4_VOT_sum = insertrows(AccessTime4_VOT_sum,IF(ctrl,:),ctrl);
        end
    end 
end
AccessTime4_VOT_sum = sortrows(AccessTime4_VOT_sum);

%DELTA
Delta2_3 = AccessTime2_VOT_sum(:,1)-AccessTime3_VOT_sum(:,1);   %Check the delta between the 2 simulation
Delta2_4 = AccessTime2_VOT_sum(:,1)-AccessTime4_VOT_sum(:,1);   %Check the delta between the 2 simulation

filename = ('AccessTimeValues.mat');
save(filename, 'AccessTime1', 'AccessTime1_VOT', 'AccessTime1_VOT_sum', 'AccessTime1_VOT_unique', 'AccessTime3', 'AccessTime3_VOT', 'AccessTime3_VOT_sum', 'AccessTime3_VOT_unique', 'AccessTime3_VOT_unique', 'AccessTime2', 'AccessTime2_VOT', 'AccessTime2_VOT_sum', 'AccessTime2_VOT_unique', 'AccessTime2_VOT_unique');    %'Delta1_2', 'Delta2_3'
