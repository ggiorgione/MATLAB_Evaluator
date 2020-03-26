%Num reservation X VOT

load SRS1.mat
SRS1 = SRS;
load SRS2.mat
SRS2 = SRS;
load SRS3.mat
SRS3 = SRS;
load SRS4.mat
SRS4 = SRS;

%% 1
% NRXVOT1 = sortrows(SRS1);                              %Sort by the ID
% VOT_ID_Rented = ismember(VOT_ID,NRXVOT1);              %Check same ID in VOT_ID and SRS1
% VOT_ID_Rented(:,2) = VOT_ID_Rented(:,1);            
% VOT_ID_Rented = VOT_ID_Rented.*VOT_ID;
% VOT_ID_Rented = VOT_ID_Rented';
% VOT_ID_Rented(VOT_ID_Rented==0) = [];               %Remove the 0s
% VOT_ID_Rented = reshape(VOT_ID_Rented,2,[]);        %Reshape it as before [109x2]
% VOT_ID_Rented = VOT_ID_Rented';
% VOT_ID_Rented = sortrows(VOT_ID_Rented,'ascend');
% NRXVOT1_VOT = VOT_ID_Rented;               %Put them together
% 
% %Put together all the time with the same VOT
% 
% [NRXVOT1_VOTunique,~,idx] = unique(NRXVOT1_VOT(:,2));
% nu = numel(NRXVOT1_VOTunique);
% NRXVOT1_VOT_sum = zeros(nu,size(NRXVOT1_VOT,2));
% d = {};
% for i=1:nu
%     c = numel(find(idx==i));
%     d{i} = c;
% end
% d = d';
% f = cell2mat(d);
% NRXVOT1_VOT_sum = [f NRXVOT1_VOTunique];
% 
% bar(NRXVOT1_VOT_sum(:,1),'g')
% %ylim([0 30]);
% xlabel('IF [€]');
% ylabel('# Bookings');
% title('Number of Bookings per IF');
% xticklabels({'0.5','2','3','4'});
% filename = sprintf('Bookings per IF_1.png');
% saveas(gca,filename);

%% 2
NRXVOT2 = sortrows(SRS2);                              %Sort by the ID
VOT_ID_Rented = ismember(VOT_ID,NRXVOT2);              %Check same ID in VOT_ID and SRS3
VOT_ID_Rented(:,2) = VOT_ID_Rented(:,1);            
VOT_ID_Rented = VOT_ID_Rented.*VOT_ID;
VOT_ID_Rented = VOT_ID_Rented';
VOT_ID_Rented(VOT_ID_Rented==0) = [];               %Remove the 0s
VOT_ID_Rented = reshape(VOT_ID_Rented,2,[]);        %Reshape it as before [309x2]
VOT_ID_Rented = VOT_ID_Rented';
VOT_ID_Rented = sortrows(VOT_ID_Rented,'ascend');
NRXVOT2_VOT = VOT_ID_Rented;               %Put them together


%Put together all the time with the same VOT

[NRXVOT2_VOTunique,~,idx] = unique(NRXVOT2_VOT(:,2));
nu = numel(NRXVOT2_VOTunique);
NRXVOT2_VOT_sum = zeros(nu,size(NRXVOT2_VOT,2));
d = {};
for i=1:nu
    c = numel(find(idx==i));
    d{i} = c;
end
d = d';
f = cell2mat(d);
NRXVOT2_VOT_sum = [f NRXVOT2_VOTunique];

bar(NRXVOT2_VOT_sum(:,1),'r')
%ylim([0 30]);
xlabel('IF [€]');
ylabel('# Bookings');
title('Number of Bookings per IF');
xticklabels({'0.5','2','3','4'});
filename = sprintf('Bookings per IF_2.png');
saveas(gca,filename);

%% 3
NRXVOT3 = sortrows(SRS3);                              %Sort by the ID
VOT_ID_Rented = ismember(VOT_ID,NRXVOT3);              %Check same ID in VOT_ID and SRS4
VOT_ID_Rented(:,2) = VOT_ID_Rented(:,1);            
VOT_ID_Rented = VOT_ID_Rented.*VOT_ID;
VOT_ID_Rented = VOT_ID_Rented';
VOT_ID_Rented(VOT_ID_Rented==0) = [];               %Remove the 0s
VOT_ID_Rented = reshape(VOT_ID_Rented,2,[]);        %Reshape it as before [409x2]
VOT_ID_Rented = VOT_ID_Rented';
VOT_ID_Rented = sortrows(VOT_ID_Rented,'ascend');
NRXVOT3_VOT = VOT_ID_Rented;               %Put them together


%Put together all the time with the same VOT

[NRXVOT3_VOTunique,~,idx] = unique(NRXVOT3_VOT(:,2));
nu = numel(NRXVOT3_VOTunique);
NRXVOT3_VOT_sum = zeros(nu,size(NRXVOT3_VOT,2));
d = {};
for i=1:nu
    c = numel(find(idx==i));
    d{i} = c;
end
d = d';
f = cell2mat(d);
NRXVOT3_VOT_sum = [f NRXVOT3_VOTunique];

bar(NRXVOT3_VOT_sum(:,1),'b')
%ylim([0 30]);
xlabel('IF [€]');
ylabel('# Bookings');
title('Number of Bookings per IF');
xticklabels({'0.5','2','3','4'});
filename = sprintf('Bookings per IF_3.png');
saveas(gca,filename);
filename = sprintf('Bookings per IF_3.png');
saveas(gca,filename);

%% 4
NRXVOT4 = sortrows(SRS4);                              %Sort by the ID
VOT_ID_Rented = ismember(VOT_ID,NRXVOT4);              %Check same ID in VOT_ID and SRS4
VOT_ID_Rented(:,2) = VOT_ID_Rented(:,1);            
VOT_ID_Rented = VOT_ID_Rented.*VOT_ID;
VOT_ID_Rented = VOT_ID_Rented';
VOT_ID_Rented(VOT_ID_Rented==0) = [];               %Remove the 0s
VOT_ID_Rented = reshape(VOT_ID_Rented,2,[]);        %Reshape it as before [409x2]
VOT_ID_Rented = VOT_ID_Rented';
VOT_ID_Rented = sortrows(VOT_ID_Rented,'ascend');
NRXVOT4_VOT = VOT_ID_Rented;               %Put them together


%Put together all the time with the same VOT

[NRXVOT4_VOTunique,~,idx] = unique(NRXVOT4_VOT(:,2));
nu = numel(NRXVOT4_VOTunique);
NRXVOT4_VOT_sum = zeros(nu,size(NRXVOT4_VOT,2));
d = {};
for i=1:nu
    c = numel(find(idx==i));
    d{i} = c;
end
d = d';
f = cell2mat(d);
NRXVOT4_VOT_sum = [f NRXVOT4_VOTunique];

bar(NRXVOT4_VOT_sum(:,1),'m')
%ylim([0 30]);
xlabel('IF [€]');
ylabel('# Bookings');
title('Number of Bookings per IF');
xticklabels({'0.5','2','3','4'});
filename = sprintf('Bookings per IF_4.png');
saveas(gca,filename);