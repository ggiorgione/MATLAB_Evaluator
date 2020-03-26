%RESERVATION NUMBER

load AccessTimeValues.mat

[AccessTime1_VOTunique,~,idx] = unique(AccessTime1_VOT(:,2));
nu = numel(AccessTime1_VOTunique);
ResNumb1 = zeros(nu,size(AccessTime1_VOT,2));
for ii = 1:nu
    ResNumb1(ii,:) = numel(AccessTime1_VOT(idx==ii,1));
end
ResNumb1(:,2) = AccessTime1_VOTunique;

[AccessTime2_VOTunique,~,idx] = unique(AccessTime2_VOT(:,2));
nu = numel(AccessTime2_VOTunique);
ResNumb2 = zeros(nu,size(AccessTime2_VOT,2));
for ii = 1:nu
    ResNumb2(ii,:) = numel(AccessTime2_VOT(idx==ii,1));
end
ResNumb2(:,2) = AccessTime2_VOTunique;

[AccessTime3_VOTunique,~,idx] = unique(AccessTime3_VOT(:,2));
nu = numel(AccessTime3_VOTunique);
ResNumb3 = zeros(nu,size(AccessTime3_VOT,2));
for ii = 1:nu
    ResNumb3(ii,:) = numel(AccessTime3_VOT(idx==ii,1));
end
ResNumb3(:,2) = AccessTime3_VOTunique;

[AccessTime4_VOTunique,~,idx] = unique(AccessTime4_VOT(:,2));
nu = numel(AccessTime4_VOTunique);
ResNumb4 = zeros(nu,size(AccessTime4_VOT,2));
for ii = 1:nu
    ResNumb4(ii,:) = numel(AccessTime4_VOT(idx==ii,1));
end
ResNumb4(:,2) = AccessTime4_VOTunique;

%% Delta 1-2
plot(ResNumb1(:,2),ResNumb1(:,1),'g')
hold on
plot(ResNumb2(:,2),ResNumb2(:,1),'r');
% title('Shift in Reservations 1-2');
% maxReservations = max(ResNumb2,ResNumb1);
% maxReservations = maxReservations(:,1);
% ylim([0 max(maxReservations)]);
legend('Reservation FP','Reservation FP+IF','Location','northwest');
xlabel('VOT [€/h]');
xticks(ResNumb1(:,2));
%xtickangle(90)
ylabel('Reservations');
hold off

filename = sprintf('Shift in Reservations 1-2.png');
saveas(gca,filename);

%% Delta 2-3
plot(ResNumb2(:,2),ResNumb2(:,1),'r')
hold on
plot(ResNumb3(:,2),ResNumb3(:,1),'b');
title('Shift in Reservations');
% maxReservations = max(ResNumb3,ResNumb2);
% maxReservations = maxReservations(:,1);
% ylim([0 max(maxReservations)]);
legend('Reservations FP','Reservations ABDP','Location','northwest');
xlabel('IF [€]');
xticks(ResNumb2(:,2));
%xtickangle(90)
ylabel('Reservations');
hold off

filename = sprintf('Shift in Reservations 2-3.png');
saveas(gca,filename);

%% Delta 2-4
plot(ResNumb2(:,2),ResNumb2(:,1),'r')
hold on
plot(ResNumb4(:,2),ResNumb4(:,1),'m');
title('Shift in Reservations');
% maxReservations = max(ResNumb3,ResNumb2);
% maxReservations = maxReservations(:,1);
% ylim([0 max(maxReservations)]);
legend('Reservations FP','Reservations TBDP','Location','northwest');
xlabel('IF [€]');
xticks(ResNumb2(:,2));
%xtickangle(90)
ylabel('Reservations');
hold off

filename = sprintf('Shift in Reservations 2-4.png');
saveas(gca,filename);

