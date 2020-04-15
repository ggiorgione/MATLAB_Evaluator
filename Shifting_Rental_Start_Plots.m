%% Add the VOT to AccessTime# to check the VOT of people walking for SHIFTING RENTAL STARTS #1
% load SRS1.mat
% SRS1 = SRS;
% SRS1 = sortrows(SRS1);                              %Sort by the ID
% VOT_ID_Rented = ismember(VOT_ID,SRS1);              %Check same ID in VOT_ID and SRS1
% VOT_ID_Rented(:,2) = VOT_ID_Rented(:,1);            
% VOT_ID_Rented = VOT_ID_Rented.*VOT_ID;
% VOT_ID_Rented = VOT_ID_Rented';
% VOT_ID_Rented(VOT_ID_Rented==0) = [];               %Remove the 0s
% VOT_ID_Rented = reshape(VOT_ID_Rented,2,[]);        %Reshape it as before [109x2]
% VOT_ID_Rented = VOT_ID_Rented';
% VOT_ID_Rented = sortrows(VOT_ID_Rented,'ascend');
% SRS1_VOT = [SRS1 VOT_ID_Rented(:,2)];               %Put them together
% SRS1_VOT = sortrows(SRS1_VOT,3,'ascend');           %sort by the VOT


%% Add the VOT to AccessTime# to check the VOT of people walking for SHIFTING RENTAL STARTS #2
load SRS2.mat
SRS2 = SRS;
SRS2 = sortrows(SRS2);                              %Sort by the ID
VOT_ID_Rented = ismember(VOT_ID,SRS2);              %Check same ID in VOT_ID and SRS1
VOT_ID_Rented(:,2) = VOT_ID_Rented(:,1);            
VOT_ID_Rented = VOT_ID_Rented.*VOT_ID;
VOT_ID_Rented = VOT_ID_Rented';
VOT_ID_Rented(VOT_ID_Rented==0) = [];               %Remove the 0s
VOT_ID_Rented = reshape(VOT_ID_Rented,2,[]);        %Reshape it as before [109x2]
VOT_ID_Rented = VOT_ID_Rented';
VOT_ID_Rented = sortrows(VOT_ID_Rented,'ascend');
SRS2 = SRS2(1:numel(VOT_ID_Rented(:,1)),:);                     %Put them together
SRS2_VOT = [SRS2 VOT_ID_Rented(:,2)];               %Put them together
SRS2_VOT = sortrows(SRS2_VOT,3,'ascend');           %sort by the VOT


%% Add the VOT to AccessTime# to check the VOT of people walking for SHIFTING RENTAL STARTS #3
load SRS3.mat
SRS3 = SRS;
SRS3 = sortrows(SRS3);                              %Sort by the ID
VOT_ID_Rented = ismember(VOT_ID,SRS3);              %Check same ID in VOT_ID and SRS1
VOT_ID_Rented(:,2) = VOT_ID_Rented(:,1);            
VOT_ID_Rented = VOT_ID_Rented.*VOT_ID;
VOT_ID_Rented = VOT_ID_Rented';
VOT_ID_Rented(VOT_ID_Rented==0) = [];               %Remove the 0s
VOT_ID_Rented = reshape(VOT_ID_Rented,2,[]);        %Reshape it as before [109x2]
VOT_ID_Rented = VOT_ID_Rented';
VOT_ID_Rented = sortrows(VOT_ID_Rented,'ascend');
SRS3 = SRS3(1:length(VOT_ID_Rented),:);
SRS3_VOT = [SRS3 VOT_ID_Rented(:,2)];               %Put them together
SRS3_VOT = sortrows(SRS3_VOT,3,'ascend');           %sort by the VOT

%% Add the VOT to AccessTime# to check the VOT of people walking for SHIFTING RENTAL STARTS #4
load SRS4.mat
SRS4 = SRS;
SRS4 = sortrows(SRS4);                              %Sort by the ID
VOT_ID_Rented = ismember(VOT_ID,SRS4);              %Check same ID in VOT_ID and SRS1
VOT_ID_Rented(:,2) = VOT_ID_Rented(:,1);            
VOT_ID_Rented = VOT_ID_Rented.*VOT_ID;
VOT_ID_Rented = VOT_ID_Rented';
VOT_ID_Rented(VOT_ID_Rented==0) = [];               %Remove the 0s
VOT_ID_Rented = reshape(VOT_ID_Rented,2,[]);        %Reshape it as before [109x2]
VOT_ID_Rented = VOT_ID_Rented';
VOT_ID_Rented = sortrows(VOT_ID_Rented,'ascend');
SRS4 = SRS4(1:length(VOT_ID_Rented),:);
SRS4_VOT = [SRS4 VOT_ID_Rented(:,2)];               %Put them together
SRS4_VOT = sortrows(SRS4_VOT,3,'ascend');           %sort by the VOT

%% Evaluate the differences between two simulations based on the VOT ###1-2
% 
% %Sim1
% SRS1_VOT = SRS1_VOT(:,[2 3]);                       %Take the 2 column that are important
% 
% [SRS1_VOT_unique,~,idx] = unique(SRS1_VOT(:,2));    %create unique matrix and id the same values
% nu = numel(SRS1_VOT_unique);
% SRS1_VOT_sum = zeros(nu,size(SRS1_VOT,2));          %initialize the matrix
% for ii = 1:nu
%   SRS1_VOT_sum(ii,:) = mean(SRS1_VOT(idx==ii,:));    %sum the same time with the same VOT
% end
% SRS1_VOT_sum(:,2) = SRS1_VOT_unique;                %finalize the matrix setting the VOT
% 
% SRS1_VOT_sum = [SRS1_VOT_sum(:,2) SRS1_VOT_sum(:,1)];
% 
% %Check that there are all the VOTs
% if isempty(length(SRS1_VOT_sum)) == 1
%     SRS1_VOT_sum = VOT;
% else
%     if SRS1_VOT_sum(end,1) == VOT(end,1)
%         if length(SRS1_VOT_sum) ~= length(VOT)
%             for ctrl = 1:1:length(ctrl)
%                 if SRS1_VOT_sum(ctrl,1) ~= VOT(ctrl,1)
%                     SRS1_VOT_sum = insertrows(SRS1_VOT_sum,VOT(ctrl,:),ctrl-1);
%                 end
%             end
%         end
%     else
%         SRS1_VOT_sum = insertrows(SRS1_VOT_sum,VOT(end,:),length(ctrl));    
%     end
% end
% 
% %Sim2
% SRS2_VOT = SRS2_VOT(:,[2 3]);                       %Take the 2 column that are important
% 
% [SRS2_VOT_unique,~,idx] = unique(SRS2_VOT(:,2));    %create unique matrix and id the same values
% nu = numel(SRS2_VOT_unique);
% SRS2_VOT_sum = zeros(nu,size(SRS2_VOT,2));          %initialize the matrix
% for ii = 1:nu
%   SRS2_VOT_sum(ii,:) = mean(SRS2_VOT(idx==ii,:));    %sum the same time with the same VOT
% end
% SRS2_VOT_sum(:,2) = SRS2_VOT_unique;                %finalize the matrix setting the VOT
% 
% SRS2_VOT_sum = [SRS2_VOT_sum(:,2) SRS2_VOT_sum(:,1)];
% 
% %Check that there are all the VOTs
% if isempty(length(SRS2_VOT_sum)) == 1
%     SRS2_VOT_sum = VOT;
% else
%     if SRS2_VOT_sum(end,1) == VOT(end,1)
%         if length(SRS2_VOT_sum) ~= length(VOT)
%             for ctrl = 1:1:length(ctrl)
%                 if SRS2_VOT_sum(ctrl,1) ~= VOT(ctrl,1)
%                     SRS2_VOT_sum = insertrows(SRS2_VOT_sum,VOT(ctrl,:),ctrl-1);
%                 end
%             end
%         end
%     else
%         SRS2_VOT_sum = insertrows(SRS2_VOT_sum,VOT(end,:),length(ctrl));    
%     end
% end
% 
% %Delta1_2 = SRS1_VOT_sum(:,1)-SRS2_VOT_sum(:,1);   %Check the delta between the 2 simulations

%% Evaluate the differences between two simulations based on the VOT ###2-3

%Sim2
SRS2_VOT = SRS2_VOT(:,[2 3]);                       %Take the 2 column that are important

[SRS2_VOT_unique,~,idx] = unique(SRS2_VOT(:,2));    %create unique matrix and id the same values
nu = numel(SRS2_VOT_unique);
SRS2_VOT_sum = zeros(nu,size(SRS2_VOT,2));          %initialize the matrix
for ii = 1:nu
  SRS2_VOT_sum(ii,:) = mean(SRS2_VOT(idx==ii,:));    %sum the same time with the same VOT
end
SRS2_VOT_sum(:,2) = SRS2_VOT_unique;                %finalize the matrix setting the VOT

SRS2_VOT_sum = [SRS2_VOT_sum(:,2) SRS2_VOT_sum(:,1)];

%Check that there are all the VOTs
if length(SRS2_VOT_sum(:,1)) ~= length(VOT(:,1))
    for ctrl = 1:length(VOT)
        if ctrl == (length(VOT)-1) && length(SRS2_VOT_sum(:,1)) ~= length(VOT(:,1))
            SRS2_VOT_sum = insertrows(SRS2_VOT_sum,VOT(ctrl+1,:),ctrl+1);
        end
        if SRS2_VOT_sum(:,1) == VOT(1,1)
            SRS2_VOT_sum(2:length(VOT),:) = VOT(2:length(VOT),:);
        end
        if SRS2_VOT_sum(ctrl,1) ~= VOT(ctrl,1) && length(SRS2_VOT_sum(:,1)) ~= length(VOT(:,1))
            SRS2_VOT_sum = insertrows(SRS2_VOT_sum,VOT(ctrl,:),ctrl);
        end
    end 
end
SRS2_VOT_sum = sortrows(SRS2_VOT_sum);

%Sim3
SRS3_VOT = SRS3_VOT(:,[2 3]);                       %Take the 2 column that are important

[SRS3_VOT_unique,~,idx] = unique(SRS3_VOT(:,2));    %create unique matrix and id the same values
nu = numel(SRS3_VOT_unique);
SRS3_VOT_sum = zeros(nu,size(SRS3_VOT,2));          %initialize the matrix
for ii = 1:nu
  SRS3_VOT_sum(ii,:) = mean(SRS3_VOT(idx==ii,:));    %sum the same time with the same VOT
end
SRS3_VOT_sum(:,2) = SRS3_VOT_unique;                %finalize the matrix setting the VOT

SRS3_VOT_sum = [SRS3_VOT_sum(:,2) SRS3_VOT_sum(:,1)];

%Check that there are all the VOTs
if length(SRS3_VOT_sum(:,1)) ~= length(VOT(:,1))
    for ctrl = 1:length(VOT)
        if ctrl == (length(VOT)-1) && length(SRS3_VOT_sum(:,1)) ~= length(VOT(:,1))
            SRS3_VOT_sum = insertrows(SRS3_VOT_sum,VOT(ctrl+1,:),ctrl+1);
        end
        if SRS3_VOT_sum(:,1) == VOT(1,1)
            SRS3_VOT_sum(2:length(VOT),:) = VOT(2:length(VOT),:);
        end
        if SRS3_VOT_sum(ctrl,1) ~= VOT(ctrl,1) && length(SRS3_VOT_sum(:,1)) ~= length(VOT(:,1))
            SRS3_VOT_sum = insertrows(SRS3_VOT_sum,VOT(ctrl,:),ctrl);
        end
    end 
end
SRS3_VOT_sum = sortrows(SRS3_VOT_sum);

Delta2_3 = SRS2_VOT_sum(:,1)-SRS3_VOT_sum(:,1);   %Check the delta between the 2 simulation


%Sim4
SRS4_VOT = SRS4_VOT(:,[2 3]);                       %Take the 2 column that are important

[SRS4_VOT_unique,~,idx] = unique(SRS4_VOT(:,2));    %create unique matrix and id the same values
nu = numel(SRS4_VOT_unique);
SRS4_VOT_sum = zeros(nu,size(SRS4_VOT,2));          %initialize the matrix
for ii = 1:nu
  SRS4_VOT_sum(ii,:) = mean(SRS4_VOT(idx==ii,:));    %sum the same time with the same VOT
end
SRS4_VOT_sum(:,2) = SRS4_VOT_unique;                %finalize the matrix setting the VOT

SRS4_VOT_sum = [SRS4_VOT_sum(:,2) SRS4_VOT_sum(:,1)];

%Check that there are all the VOTs
if length(SRS4_VOT_sum(:,1)) ~= length(VOT(:,1))
    for ctrl = 1:length(VOT)
        if ctrl == (length(VOT)-1) && length(SRS4_VOT_sum(:,1)) ~= length(VOT(:,1))
            SRS4_VOT_sum = insertrows(SRS4_VOT_sum,VOT(ctrl+1,:),ctrl+1);
        end
        if SRS4_VOT_sum(:,1) == VOT(1,1)
            SRS4_VOT_sum(2:length(VOT),:) = VOT(2:length(VOT),:);
        end
        if SRS4_VOT_sum(ctrl,1) ~= VOT(ctrl,1) && length(SRS4_VOT_sum(:,1)) ~= length(VOT(:,1))
            SRS4_VOT_sum = insertrows(SRS4_VOT_sum,VOT(ctrl,:),ctrl);
        end
    end 
end
SRS4_VOT_sum = sortrows(SRS4_VOT_sum);


Delta2_4 = SRS2_VOT_sum(:,1)-SRS4_VOT_sum(:,1);   %Check the delta between the 2 simulation

%% DELTA STARTING TIME Plot
%Plot the Delta time 1-2
% scatter(SRS1_VOT_unique,Delta1_2);
% hold on
% plot(0);
% title('Shifting in Rental Starting Time 1-2');
% xticks(SRS1_VOT_unique);
% xtickangle(90);
% xlabel('VOT');
% ylabel('Shifting Rental Starting Time mean [s]');
% hold off
% filename = sprintf('Delta time 1-2.png');
% saveas(gca,filename);

%Plot the Delta time 2-3
scatter(VOT(:,1),Delta2_3,'b');
hold on
plot(0);
title('Shifting in Rental Starting Time');
xticks(SRS2_VOT_unique);
xtickangle(90);
xlabel('VOT [€]');
ylabel('Shifting Rental Starting Time mean [h]');
filename = sprintf('Delta time 2-3.png');
saveas(gca,filename);
hold off

%Plot the Delta time 2-4
scatter(VOT(:,1),Delta2_4,'m');
hold on
plot(0);
title('Shifting in Rental Starting Time');
xticks(SRS2_VOT_unique);
xtickangle(90);
xlabel('VOT [€]');
ylabel('Shifting Rental Starting Time mean [h]');
filename = sprintf('Delta time 2-4.png');
saveas(gca,filename);
hold off