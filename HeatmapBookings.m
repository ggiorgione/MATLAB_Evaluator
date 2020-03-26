%Heatmap Bookings
delimiterIn = ",";

Bookings = readtable(inputheat,'Delimiter',',');
Bookings.carID = [];
Bookings.cost = [];
Bookings = table2array(Bookings);
Bookings = sortrows(Bookings);

HMBookings = ismember(lineIDs10pctXYIDdouble,Bookings);
for jj = 1:numel(HMBookings(:,1))
    if HMBookings(jj,1) == 1
        HMBookings(jj,2) = 1;
        HMBookings(jj,3) = 1;
    end
end
HMBookings = HMBookings .* lineIDs10pctXYIDdouble;
HMBookings = HMBookings(HMBookings~=0);
if  z==4 & y==3 & T==2
    Bookings = Bookings(1:length(Bookings)-1,:);
end
if  z==6 & y==2 & T==2
    Bookings = Bookings(1:length(Bookings)-1,:);
end
if  z==6 & y==4 & T==2
    Bookings = Bookings(1:length(Bookings)-1,:);
end
if  z==5 & y==3 & T==2
    Bookings = Bookings(1:length(Bookings)-1,:);
end
if  z==4 & y==3 & T==2
    Bookings = insertrows(Bookings,Bookings(end,:),Bookings(end,:));
end

% if  z==7 & y==1 & T==3
%     Bookings = Bookings(1:length(Bookings)-1,:);
% end

HMBookings = reshape(HMBookings,length(Bookings),size(lineIDs10pctXYIDdouble,2));

HMBookingsVOT = sortrows(HMBookings);                              %Sort by the ID
VOT_ID_Rented = ismember(VOT_ID,HMBookingsVOT);              %Check same ID in VOT_ID and SRS4
VOT_ID_Rented(:,2) = VOT_ID_Rented(:,1);            
VOT_ID_Rented = VOT_ID_Rented.*VOT_ID;
VOT_ID_Rented = VOT_ID_Rented';
VOT_ID_Rented(VOT_ID_Rented==0) = [];               %Remove the 0s
VOT_ID_Rented = reshape(VOT_ID_Rented,2,[]);        %Reshape it as before [409x2]
VOT_ID_Rented = VOT_ID_Rented';
VOT_ID_Rented = sortrows(VOT_ID_Rented,'ascend');
HMBookingsVOT = VOT_ID_Rented;
HMBookings = sortrows(HMBookings);
HMBookings = [HMBookings HMBookingsVOT(:,2)];
HMBookings = HMBookings';

filename = sprintf('IDXYBookings%i.csv',y);
fileID = fopen(filename,'w');
fprintf(fileID,'%d,%f,%f,%d\n',HMBookings);
fclose(fileID);
%xlswrite(filename,HMBookings);