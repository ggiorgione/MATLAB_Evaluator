Demand = readtable(inputleg,'Delimiter','\t');
%From en_route Save only: "time_1", "all", "car", "pt", "twoway vehicle"
%Trash: "time", "departures", "arrivals", "stuck"
%Trash all as well for: "egress_walk_tw", "access_walk_tw", "bike", "walk",
Demand.time = [];

%Demand.departures_all = [];
Demand.arrivals_all = [];
Demand.stuck_all = [];
Demand.en_route_all = [];

%Demand.departures_car = [];
Demand.arrivals_car = [];
Demand.stuck_car = [];
Demand.en_route_car = [];

Demand.departures_egress_walk_tw = [];
Demand.arrivals_egress_walk_tw = [];
Demand.stuck_egress_walk_tw = [];
Demand.en_route_egress_walk_tw = [];

%Demand.departures_pt = [];
Demand.arrivals_pt = [];
Demand.stuck_pt = [];
Demand.en_route_pt = [];

%Demand.departures_twoway_vehicle = [];
%Demand.arrivals_twoway_vehicle = [];
Demand.stuck_twoway_vehicle = [];
Demand.en_route_twoway_vehicle = [];

Demand.departures_access_walk_tw = [];
Demand.arrivals_access_walk_tw = [];
Demand.stuck_access_walk_tw = [];
Demand.en_route_access_walk_tw = [];

Demand.departures_bike = [];
Demand.arrivals_bike = [];
Demand.stuck_bike = [];
Demand.en_route_bike = [];

Demand.departures_walk = [];
Demand.arrivals_walk = [];
Demand.stuck_walk = [];
Demand.en_route_walk = [];

Demand = table2array(Demand); % Obtains Time-All-Car-Pt-Twoway

%Percentage of the total
time = Demand(:,1);
all = Demand(:,2);
car = Demand(:,3);
pt = Demand(:,4);
twoway = Demand(:,5);
twowayarrival = Demand(:,6);

allSUM = sum(all);
carSUM = sum(car);
ptSUM = sum(pt);
twowaySUM = sum(twoway);

carPERC = (carSUM/allSUM)*100;
ptPERC = (ptSUM/allSUM)*100;
twowayPERC = (twowaySUM/allSUM)*100;
otherModesPERC = 100 - carPERC - ptPERC - twowayPERC;
    
filename = sprintf('ModePercentage%i.mat',y);
save(filename,'carPERC','ptPERC','twowayPERC','otherModesPERC','time','all','car','pt','twoway','twowayarrival');