%Booking Per VOT


delimiterIn = ",";

bVOT = readtable(inputheat,'Delimiter',',');
bVOT.carID = [];
bVOT.cost = [];
bVOT = table2array(bVOT);
bVOT = sortrows(bVOT);
VOT_ID_bVOT = ismember(VOT_ID,bVOT);              %Check same ID in VOT_ID and SRS1
VOT_ID_bVOT(:,2) = VOT_ID_bVOT(:,1);            
VOT_ID_bVOT = VOT_ID_bVOT.*VOT_ID;
VOT_ID_bVOT = VOT_ID_bVOT';
VOT_ID_bVOT(VOT_ID_bVOT==0) = [];               %Remove the 0s
VOT_ID_bVOT = reshape(VOT_ID_bVOT,2,[]);        %Reshape it as before [109x2]
VOT_ID_bVOT = VOT_ID_bVOT';
VOT_ID_bVOT = sortrows(VOT_ID_bVOT,'ascend');
bVOT = VOT_ID_bVOT(:,2);

bVOTCounts = sum(bVOT==bVOT');
bVOTCounts = [bVOT bVOTCounts'];
bVOTCounts = sortrows(bVOTCounts);
[~,idx]=unique(bVOTCounts(:,1));
c = VOTlist;
bVOTCounts=bVOTCounts(idx,:);

%Check that there are all the VOTs
if length(bVOTCounts(:,1)) ~= length(IF(:,1))
    for ctrl = 1:length(IF)
        if ctrl == (length(IF)-1)  && length(bVOTCounts(:,1)) ~= length(IF(:,1))
            bVOTCounts = insertrows(bVOTCounts,IF(ctrl+1,:),ctrl+1);
        end
        if bVOTCounts(:,1) == IF(1,1)
            bVOTCounts(2:length(IF),:) = IF(2:length(IF),:)
        end
        if bVOTCounts(ctrl,1) ~= IF(ctrl,1) && length(bVOTCounts(:,1)) ~= length(IF(:,1))
            bVOTCounts = insertrows(bVOTCounts,IF(ctrl,:),ctrl);
        end
    end 
end
bVOTCounts = sortrows(bVOTCounts);

filename = sprintf('bookingXVOT%i.mat',y);
save(filename,'bVOT','bVOTCounts');