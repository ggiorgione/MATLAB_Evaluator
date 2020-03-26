%Booking for each station and for the same station VOT
delimiterIn = ",";

SBooking = readtable(inputequil,'Delimiter',',');
SBooking = table2array(SBooking);
SBooking = sortrows(SBooking);
SBooking(:,1) = [];

%count how many times a specific station appears

%load(sprintf('/Users/giulio.giorgione/Documents/MATLAB/SimEvaluator/toLoad/StationsIDentifier%i',y));

x = StationsIDentifier(:,1);
N = numel(StationsIDentifier(:,1));
count = zeros(N,1);
   for k = 1:N
      count(k) = sum(SBooking==x(k));
   end
StationsBookingCounts = ([ x(:) count ]);

filename = sprintf('StationsBookingCounts%i.mat',y);
save(filename,'StationsBookingCounts');