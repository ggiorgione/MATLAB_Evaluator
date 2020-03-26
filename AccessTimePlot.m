load AccessTime1_VOT_sum.mat
AccessTime1_VOT_unique = AccessTime_VOT_unique;
load AccessTime2_VOT_sum.mat
AccessTime2_VOT_unique = AccessTime_VOT_unique;
load AccessTime3_VOT_sum.mat
AccessTime3_VOT_unique = AccessTime_VOT_unique;


%Plot the Delta time 1-2
scatter(AccessTime1_VOT_unique,Delta1_2);
hold on
plot(0);
title('Differential Access Time 1-2');
xticks(AccessTime1_VOT_unique);
xtickangle(90);
xlabel('VOT');
ylabel('Access Time mean [s]');
hold off
filename = sprintf('Delta Access Time 1-2.png');
saveas(gca,filename);

%Plot the Delta time 2-3
scatter(AccessTime2_VOT_unique,Delta2_3);
hold on
plot(0);
title('Differential Access Time 2-3');
xticks(AccessTime3_VOT_unique);
xtickangle(90);
xlabel('VOT');
ylabel('Access Time mean [s]');
filename = sprintf('Delta Access Time 2-3.png');
saveas(gca,filename);
hold off