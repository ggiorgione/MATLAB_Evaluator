ITERS=300;                                                                              %Number of last iteration to find the folder
SimTrial = (15); % z: ["Berlin_"SimTrial"]; 
SimType = (3:1:3);  % T: 1 = Heterogeneus --- 2 = Radial --- 3 = CoAxial
SimRun = (1:1:4);   % y                                                                  %Simulations name to find the folder
DayHours = 30;                                                                         %Simulation Time
DaySeconds = DayHours*3600;

%IFs (Income Factors)
VOT = [0.5 2 3 4; 0 0 0 0];
VOT = VOT';
ctrl = [1 2 3 4];   %Number of VOT sectors

%% matfile to load
load ('/Users/giulio.giorgione/Documents/MATLAB/SimEvaluator/toLoad/lineIDs10pctXYIDdouble.mat');
load ('/Users/giulio.giorgione/Documents/MATLAB/SimEvaluator/toLoad/VOTlist.mat');
load ('/Users/giulio.giorgione/Documents/MATLAB/SimEvaluator/toLoad/StationsIDentifier2.mat');
load ('/Users/giulio.giorgione/Documents/MATLAB/SimEvaluator/toLoad/StationsIDentifier3.mat');
load ('/Users/giulio.giorgione/Documents/MATLAB/SimEvaluator/toLoad/timeBasePrice.mat');
load ('/Users/giulio.giorgione/Documents/MATLAB/SimEvaluator/toLoad/fixedPrice.mat');

%%
%     % Coloumns in CS.txt
%     %1      	2           	3       	4       5           6           7           8       
%     %personID	carsharingType	startTime	endTIme	startLink	pickupLink	dropoffLink	endLink	
%     %9          10              11          12          13          14      15          16          17
%     %distance	inVehicleTime	accessTime	egressTime	vehicleID   cost    bookingTime	companyID	vehicleType

for z=SimTrial
    inputBase1 = sprintf('/Users/giulio.giorgione/Documents/MATLAB');
    inputBase2 = sprintf('/Berlin_%i',z);
    inputBaseTrial = strcat(inputBase1, inputBase2);
    
    for T=SimType
        load (sprintf('/Users/giulio.giorgione/Documents/MATLAB/SimEvaluator/toLoad/VOT_ID_%i.mat',T));
        inputBase3 = sprintf('/%i',T);
        inputBaseType = strcat(inputBaseTrial, inputBase3);
        
        for y=SimRun
        %% Different Input
        %     inputBase1 = sprintf('/Users/giulio.giorgione/Documents/MATLAB/SimEvaluator/%i',y);	%Folder
        %     inputBase2 = '/output/org/matsim/contrib/carsharing/runExample/RunCarsharingTest/';
        %     inputBase = strcat(inputBase1, inputBase2);
        %     inputBaseITER = strcat(inputBase,'ITERS/it.');
        %%
            inputBase4 = sprintf('/%i',y);
            inputBaseRun = strcat(inputBaseType, inputBase4);            
            inputBaseITER = strcat(inputBaseRun,'/it.');

            DTP = strcat(num2str(ITERS),'/run1.',num2str(ITERS),'.CS.txt');                     %Reads the .CS.txt file with carsharing data
            input = strcat(inputBaseITER,DTP);                                                  %merge 2 or more strings
            delimiterIn = ",";
            inputTable = readtable(input,'Delimiter',',');

            DTPleg = strcat(num2str(ITERS),'/run1.',num2str(ITERS),'.legHistogram.txt');        %file name = 'myfile01.txt' 
            inputleg = strcat(inputBaseITER,DTPleg);                                            %merge 2 or more strings

            DTPequil = strcat(num2str(ITERS),'/run1.',num2str(ITERS),'.RentedCarsXStation.txt');%file name = 'myfile01.txt' 
            inputequil = strcat(inputBaseITER,DTPequil);                                        %merge 2 or more strings

            DTP = strcat(num2str(ITERS),'/run1.',num2str(ITERS),'.RentalCost.txt');             %file name = 'myfile01.txt' 
            inputheat = strcat(inputBaseITER,DTP);                                              %merge 2 or more strings

            run('DrivingBookingFleetAccessDistance.m');
            run('DemandProfileShift.m');
            %run('Equilibrium_at_the_Station.m');
            run('HeatmapBookings.m');
            run('ModalShiftWalking.m');
            run('modalShiftXTime.m');
            run('RevenueCalculator.m');
            run('bookingXVOT');
            if y==1
                continue
            end
            run('StationsBooking.m');
        end

        run('AccessTimeEvaluation.m');
        %run('AccessTimePlot.m');
        run('ReservNumber.m');
        run('DemandProfileShiftPlot.m');
        %run('Duration_Reservation.m');
        run('modalShiftXTime_plot.m');
        run('ModeShiftEva.m');
        run('Plot_Fleet_Utilization.m');
        run('Shifting_Rental_Start_Plots.m');
        run('NReservXVOT.m');
        run('revenueCalculatorPlot.m');
        run('bookingXVOTplot.m');
        run('AnalisysXVOT.m')
        
        if y==1
            continue
        end
        run('StationsBookingPlot.m');
        run('Spider_Plot.m');

        
        copyfile ('/Users/giulio.giorgione/Documents/MATLAB/SimEvaluator', sprintf('/Users/giulio.giorgione/Documents/MATLAB/Berlin_%i/%i/%i/',z,T));
    end
end
close