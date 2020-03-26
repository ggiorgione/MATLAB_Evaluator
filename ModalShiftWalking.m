%MODAL SPLIT for walking to carsharing DURING THE DAY
delimiterIn = "\t";

DemandWalking = readtable(inputleg,'Delimiter','\t');
%From en_route Save only: "time_1", "all", "car", "pt", "twoway vehicle"
%Trash: "time", "departures", "arrivals", "stuck"
%Trash all as well for: "egress_walk_tw", "access_walk_tw", "bike", "walk",
DemandWalking.time = [];

%Demand.departures_all = [];
DemandWalking.arrivals_all = [];
DemandWalking.stuck_all = [];
DemandWalking.en_route_all = [];

%Demand.departures_car = [];
DemandWalking.arrivals_car = [];
DemandWalking.stuck_car = [];
DemandWalking.en_route_car = [];

DemandWalking.departures_egress_walk_tw = [];
DemandWalking.arrivals_egress_walk_tw = [];
DemandWalking.stuck_egress_walk_tw = [];
DemandWalking.en_route_egress_walk_tw = [];

%Demand.departures_pt = [];
DemandWalking.arrivals_pt = [];
DemandWalking.stuck_pt = [];
DemandWalking.en_route_pt = [];

%Demand.departures_twoway_vehicle = [];
DemandWalking.arrivals_twoway_vehicle = [];
DemandWalking.stuck_twoway_vehicle = [];
DemandWalking.en_route_twoway_vehicle = [];

%DemandWalking.departures_access_walk_tw = [];
DemandWalking.arrivals_access_walk_tw = [];
DemandWalking.stuck_access_walk_tw = [];
DemandWalking.en_route_access_walk_tw = [];

DemandWalking.departures_bike = [];
DemandWalking.arrivals_bike = [];
DemandWalking.stuck_bike = [];
DemandWalking.en_route_bike = [];

DemandWalking.departures_walk = [];
DemandWalking.arrivals_walk = [];
DemandWalking.stuck_walk = [];
DemandWalking.en_route_walk = [];

DemandWalking = table2array(DemandWalking); % Obtains Time-All--WalkingTW-Car-Pt-Twoway

filename = sprintf('ModalShiftXTime%i.mat',y);
save(filename,'DemandWalking');