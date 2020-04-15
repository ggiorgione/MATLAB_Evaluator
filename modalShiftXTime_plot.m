%MODAL SPLIT DURING THE DAY - plot

%% 1
% load ModalShiftXTime1.mat
% 
% Time = Demand(:,1);
% Timehour = Time./3600;
% Modes = [Demand(:,3) Demand(:,4) Demand(:,5)];
% Sum = Demand(:,2);
% 
% DemandPerc = Modes./Sum;
% DemandPerc(isnan(DemandPerc)) = 0;
% DemandPercTransition = [DemandPerc(:,3) DemandPerc(:,1) DemandPerc(:,2)];
% DemandPerc = DemandPercTransition*100;
% %DemandPerc(:,4) = 1-(DemandPerc(:,1)+DemandPerc(:,2)+DemandPerc(:,3));
% 
% plot(Timehour,DemandPerc(:,3),'g');
% xlim([0 30]);
% xlabel('Time [h]');
% ylabel('Carsharing Demand [%]');
% title('Carsharing Demand Profile Share');
% filename = sprintf('Twoway Demand Profile Share1.png');
% saveas(gca,filename);
% 
% bar(Timehour,DemandPerc,'stacked')
% set(gca, 'YScale', 'log')
% xlim([0 24]);
% ylim([0 100]);
% xlabel('Time [h]');
% ylabel('Modal Split [%]');
% title('Modal Split');
% legend('Carsharing','car','pt','Others');
% filename = sprintf('Modal Split1.png');
% saveas(gca,filename);
% 
% filename = sprintf('ModalSplit1.csv',y);
% fileID = fopen(filename,'w');
% ModalSplit = [Timehour DemandPerc];
% fprintf(fileID,'%f,%f,%f\n',ModalSplit');
% fclose(fileID);

%% 2
load ModalShiftXTime2.mat
Time = Demand(:,1);
Timehour = Time./3600;
Modes = [Demand(:,3) Demand(:,4) Demand(:,5)]; %Car PT Carsharing
Sum = Demand(:,2);

DemandPerc = Modes./Sum;
DemandPerc(isnan(DemandPerc)) = 0;
DemandPercTransition = [DemandPerc(:,3) DemandPerc(:,1) DemandPerc(:,2)]; %Carsharing Car PT
DemandPerc = DemandPercTransition*100;
%DemandPerc(:,4) = 1-(DemandPerc(:,1)+DemandPerc(:,2)+DemandPerc(:,3));

plot(Timehour,DemandPerc(:,3),'r')
xlim([0 30]);
xlabel('Time [h]');
ylabel('Carsharing Demand [%]');
title('Carsharing Demand Profile Share');
filename = sprintf('Twoway Demand Profile Share2.png');
saveas(gca,filename);

bar(Timehour,DemandPerc,'stacked')
set(gca, 'YScale', 'log')
xlim([0 24]);
ylim([0 inf]);
xlabel('Time [h]');
ylabel('Modal Split [%]');
title('Modal Split');
legend('Carsharing','car','pt','Others');
filename = sprintf('Modal Split2.png');
saveas(gca,filename);
% set(gca, 'YScale', 'linear')

filename = sprintf('ModalSplit2.csv',y);
fileID = fopen(filename,'w');
ModalSplit = DemandPerc;
fprintf(fileID,'%f,%f,%f\n',ModalSplit');
fclose(fileID);

%% 3
load ModalShiftXTime3.mat
Time = Demand(:,1);
Timehour = Time./3600;
Modes = [Demand(:,3) Demand(:,4) Demand(:,5)];
Sum = Demand(:,2);

DemandPerc = Modes./Sum;
DemandPerc(isnan(DemandPerc)) = 0;
DemandPercTransition = [DemandPerc(:,3) DemandPerc(:,1) DemandPerc(:,2)];
DemandPerc = DemandPercTransition*100;
%DemandPerc(:,4) = 1-(DemandPerc(:,1)+DemandPerc(:,2)+DemandPerc(:,3));

plot(Timehour,DemandPerc(:,3),'b')
xlim([0 30]);
xlabel('Time [h]');
ylabel('Carsharing Demand [%]');
title('Carsharing Demand Profile Share');
filename = sprintf('Twoway Demand Profile Share3.png');
saveas(gca,filename);

bar(Timehour,DemandPerc,'stacked')
set(gca, 'YScale', 'log')
xlim([0 24]);
ylim([0 inf]);
xlabel('Time [h]');
ylabel('Modal Split [%]');
title('Modal Split');
legend('Carsharing','car','pt','Others');
filename = sprintf('Modal Split3.png');
saveas(gca,filename);
% set(gca, 'YScale', 'linear')

filename = sprintf('ModalSplit3.csv',y);
fileID = fopen(filename,'w');
ModalSplit = DemandPerc;
fprintf(fileID,'%f,%f,%f\n',ModalSplit');
fclose(fileID);

%% 4
load ModalShiftXTime4.mat
Time = Demand(:,1);
Timehour = Time./3600;
Modes = [Demand(:,3) Demand(:,4) Demand(:,5)];
Sum = Demand(:,2);

DemandPerc = Modes./Sum;
DemandPerc(isnan(DemandPerc)) = 0;
DemandPercTransition = [DemandPerc(:,3) DemandPerc(:,1) DemandPerc(:,2)];
DemandPerc = DemandPercTransition*100;
%DemandPerc(:,4) = 1-(DemandPerc(:,1)+DemandPerc(:,2)+DemandPerc(:,3));

plot(Timehour,DemandPerc(:,3),'m')
xlim([0 30]);
xlabel('Time [h]');
ylabel('Carsharing Demand [%]');
title('Carsharing Demand Profile Share');
filename = sprintf('Twoway Demand Profile Share4.png');
saveas(gca,filename);

bar(Timehour,DemandPerc,'stacked')
set(gca, 'YScale', 'log')
xlim([0 24]);
ylim([0 inf]);
xlabel('Time [h]');
ylabel('Modal Split [%]');
title('Modal Split');
legend('Carsharing','car','pt','Others');
filename = sprintf('Modal Split4.png');
saveas(gca,filename);
% set(gca, 'YScale', 'linear')

filename = sprintf('ModalSplit4.csv',y);
fileID = fopen(filename,'w');
ModalSplit = DemandPerc;
fprintf(fileID,'%f,%f,%f\n',ModalSplit');
fclose(fileID);