% Analysis of the Python code about the comparisons on the agents' bookings

SimRunK = 2:1:4; % Simulations run that we are interested in (FP, ABDP, TBDP)
SimTypeStr = {'FP';'ABDP';'TBDP';'FP_ABDP';'FP_TBDP'};
VOTStr = {'VOT'};

%% Import text files

inputBP = [];
for j = 1:size(SimTypeStr)
    % Import text files
    inputBP.(SimTypeStr{j}) = strcat(inputBaseType,(sprintf('/BasicPlan4CS_%i.txt',j+1)));                                                  %merge 2 or more strings
    delimiterIn = ",";
    BasicPlan4CS.(SimTypeStr{j}) = table2cell(readtable(inputBP.(SimTypeStr{j}),'Delimiter','\t'));
    BasicPlan4CS.(SimTypeStr{j}) = [BasicPlan4CS.(SimTypeStr{j})(:,1) BasicPlan4CS.(SimTypeStr{j})];
    % Introduce the VOT in the BasicPlan4CS
    for i = 1:length(BasicPlan4CS.(SimTypeStr{j}))
        tempVOT_BasicPlan4CS.(SimTypeStr{j}) = cell2mat(sortrows(BasicPlan4CS.(SimTypeStr{j})(:,1)));                        %Sort by the ID
        tempVOT_BasicPlan4CS.(SimTypeStr{j}) = ismember(VOT_ID,tempVOT_BasicPlan4CS.(SimTypeStr{j}));                  %Check same ID in VOT_ID and SRS1
        tempVOT_BasicPlan4CS.(SimTypeStr{j})(:,2) = tempVOT_BasicPlan4CS.(SimTypeStr{j})(:,1);            
        tempVOT_BasicPlan4CS.(SimTypeStr{j}) = tempVOT_BasicPlan4CS.(SimTypeStr{j}).*VOT_ID;
        tempVOT_BasicPlan4CS.(SimTypeStr{j}) = tempVOT_BasicPlan4CS.(SimTypeStr{j})';
        tempVOT_BasicPlan4CS.(SimTypeStr{j})(tempVOT_BasicPlan4CS.(SimTypeStr{j})==0) = [];               %Remove the 0s
        tempVOT_BasicPlan4CS.(SimTypeStr{j}) = reshape(tempVOT_BasicPlan4CS.(SimTypeStr{j}),2,[]);        %Reshape it as before [101x2]
        tempVOT_BasicPlan4CS.(SimTypeStr{j}) = tempVOT_BasicPlan4CS.(SimTypeStr{j})';
    end
    for i = 1:length((BasicPlan4CS.(SimTypeStr{j})(:,1)))
        for k = 1:length(tempVOT_BasicPlan4CS.(SimTypeStr{j}))
            if isequal((BasicPlan4CS.(SimTypeStr{j})(i,1)),{tempVOT_BasicPlan4CS.(SimTypeStr{j})(k,1)})
                BasicPlan4CS.(SimTypeStr{j})(i,2) = {tempVOT_BasicPlan4CS.(SimTypeStr{j})(k,2)};
            end
        end
    end
end

% Put together BasicPlan and PlanDifference (at the end)
allPlans = BasicPlan4CS;
clear BasicPlan4CS;

%% Count the modes used and activities done

% take the type of modes and activities
for i = 1:length(SimTypeStr)
    modes.(SimTypeStr{i}) = unique(allPlans.(string(SimTypeStr(i)))(:,7));
    modes.(SimTypeStr{i})(1,:) = [];
    activities.(SimTypeStr{i}) = unique(allPlans.(string(SimTypeStr(i)))(:,4));
end

% Checks who used which mode
for i = 1:length(SimTypeStr)
    for j = 1:length(modes.(SimTypeStr{i}))
       for k = 1:length(allPlans.(string(SimTypeStr(i))))
            temp(j,k) = ismember(allPlans.(string(SimTypeStr(i))){k,7},modes.(SimTypeStr{i})(j,1));
       end
    end
    memberModes.(string(SimTypeStr(i))) = temp;
    temp = [];
end
clear temp

% Group all the same modes and sum them up for every group
for i = 1:length(SimTypeStr)
    for j = 1:size(memberModes.(string(SimTypeStr(i))),1)
        modeUsage.(string(SimTypeStr(i)))(j,1) = sum(memberModes.(string(SimTypeStr(i)))(j,:));
    end
    modes.(string(SimTypeStr(i))) = [modes.(string(SimTypeStr(i))) num2cell(modeUsage.(string(SimTypeStr(i)))(:,1))];
end

% Checks who made which activity
for i = 1:length(SimTypeStr)
    for j = 1:length(activities.(SimTypeStr{i}))
       for k = 1:length(allPlans.(string(SimTypeStr(i))))
            temp(j,k) = ismember(allPlans.(string(SimTypeStr(i))){k,4},activities.(SimTypeStr{i})(j,1));
       end
    end
    memberActivities.(string(SimTypeStr(i))) = temp;
    temp = [];
end

% Group all the same activities and sum them up for every group
for i = 1:length(SimTypeStr)
    for j = 1:size(memberActivities.(string(SimTypeStr(i))),1)
        activityMade.(string(SimTypeStr(i)))(j,1) = sum(memberActivities.(string(SimTypeStr(i)))(j,:));
    end
    activities.(string(SimTypeStr(i))) = [activities.(string(SimTypeStr(i))) num2cell(activityMade.(string(SimTypeStr(i)))(:,1))];
end

% Differences between FP and ABDP and TBDP in percentage
activities.FP_ABDP{1,3} = 0;
activities.FP_TBDP{1,3} = 0;
for i = 1:length(activities.FP)
    temp_a = cell2mat(activities.FP(i,2));
    temp_b = cell2mat(activities.FP_ABDP(i+1,2));
    temp_c = cell2mat(activities.FP_TBDP(i+1,2));
    activities.FP_ABDP{i+1,3} = ((temp_a-temp_b)/temp_a)*100;
    activities.FP_TBDP{i+1,3} = ((temp_a-temp_c)/temp_a)*100;
end
clear temp_a;
clear temp_b;
clear temp_c;

%% Divides the previous counts by VOT

% list of all agents who didn't execute their plan
clear activityNotExecuted;
for i = 1:length(SimTypeStr)
    for j = 1:length(allPlans.(string(SimTypeStr{i})))
        if ~isnan(cell2mat(allPlans.(string(SimTypeStr{i}))(j,1))) && ~isnan(cell2mat(allPlans.(string(SimTypeStr{i}))(j+1,1)))
            activityNotExecuted.(string(SimTypeStr(i)))(j,:) = allPlans.(string(SimTypeStr{i}))(j,1:3);
        end
    end
end

for i = 4:length(SimTypeStr) %remove the []
    temp_size = size(activityNotExecuted.(string(SimTypeStr(i))));
    activityNotExecuted.(string(SimTypeStr(i))) = activityNotExecuted.(string(SimTypeStr(i)))(~cellfun('isempty',activityNotExecuted.(string(SimTypeStr(i)))));
    activityNotExecuted.(string(SimTypeStr(i))) = reshape(activityNotExecuted.(string(SimTypeStr(i))),[],temp_size(:,2));
end
clear temp_size

% Total number of plans lost
activityNotExecuted.totalFP_ABDP = length(activityNotExecuted.FP_ABDP);
activityNotExecuted.totalFP_TBDP = length(activityNotExecuted.FP_TBDP);

% Plans lost per VOT
for i = 4:length(SimTypeStr)
    activityNotExecuted.(string(SimTypeStr(i))) = sortrows(activityNotExecuted.(string(SimTypeStr(i))),2);
    [temp_a,temp_b] = groupcounts(cell2mat(activityNotExecuted.(string(SimTypeStr(i)))(:,2)));
    activityNotExecuted.(string(SimTypeStr(i)) + '_' + VOTStr) = [temp_b temp_a];
end
clear temp_a;
clear temp_b;

% Score of plans lost per VOT
for i = 4:length(SimTypeStr)
    scoreActivityNotExecuted.(string(SimTypeStr(i))) = sortrows(activityNotExecuted.(string(SimTypeStr(i))),2);
    temp_a = accumarray(round(cell2mat(scoreActivityNotExecuted.(string(SimTypeStr(i)))(:,2))),cell2mat(scoreActivityNotExecuted.(string(SimTypeStr(i)))(:,3)));
    scoreActivityNotExecuted.(string(SimTypeStr(i)) + '_' + VOTStr) = [VOTlist temp_a];
end
clear temp_a;

%% Scoring count
clear score;

for i = 1:length(SimTypeStr)
    for j = 1:length(allPlans.(string(SimTypeStr{i})))
        if ~isnan(cell2mat(allPlans.(string(SimTypeStr{i}))(j,1)))
            score.(string(SimTypeStr(i)))(j,:) = allPlans.(string(SimTypeStr{i}))(j,1:3);
        end
    end
end

% Removes the []
for i = 1:length(SimTypeStr) 
    temp_size = size(score.(string(SimTypeStr(i))));
    score.(string(SimTypeStr(i))) = score.(string(SimTypeStr(i)))(~cellfun('isempty',score.(string(SimTypeStr(i)))));
    score.(string(SimTypeStr(i))) = reshape(score.(string(SimTypeStr(i))),[],temp_size(:,2));
end

% Scores per VOT
for i = 1:length(SimTypeStr)
    score.(string(SimTypeStr(i))) = sortrows(score.(string(SimTypeStr(i))),2);
    [temp_a,temp_b] = groupcounts(cell2mat(score.(string(SimTypeStr(i)))(:,2)));
    score.(string(SimTypeStr(i)) + '_' + VOTStr) = [temp_b temp_a];
end
clear temp_a;
clear temp_b;

for i = 1:length(SimTypeStr)
    score.(string(SimTypeStr(i)) + '_' + VOTStr) = zeros(size(score.(string(SimTypeStr(i))), 1), 1);
    for v = unique(cell2mat(score.(string(SimTypeStr(i)))(:,2)))'
       rows = cell2mat(score.(string(SimTypeStr(i)))(:, 2)) == v;
       sums = cumsum([0; cell2mat(score.(string(SimTypeStr(i)))(rows, 3))]);
       score.(string(SimTypeStr(i)) + '_' + VOTStr)(rows) = sums(end);     
    end
    score.(string(SimTypeStr(i)) + '_' + VOTStr) = unique(score.(string(SimTypeStr(i)) + '_' + VOTStr));
    score.(string(SimTypeStr(i)) + '_' + VOTStr) = [VOTlist score.(string(SimTypeStr(i)) + '_' + VOTStr)];
end
clear rows

%% Acquire parameters to create the normal distribution for the score

colors = {'r';'b';'m';'y';'c'};
for i = 1:length(SimTypeStr)
    NormDistParameters = fitdist(sortrows(cell2mat(score.(string(SimTypeStr(i)))(:,3))),'Normal');
    NormDist = normpdf(sortrows(cell2mat(score.(string(SimTypeStr(i)))(:,3))),NormDistParameters.mu,NormDistParameters.sigma);
    plotScatter = plot(sortrows(cell2mat(score.(string(SimTypeStr(i)))(:,3))),NormDist,colors{i});
    hold on
end
title('Score Normal Distribution');
legend('FP','ABDP','TBDP','FP-ABDP','FP-TBDP','location','northwest');
filename = sprintf('Score_Normal_Distribution.png');
saveas(gca,filename);






