%% K-means clustering of Score & number of activities
clusters = (1:4);
KMatrixKmeans = [];

for i = 1:size(SimTypeStr)
    totScore.(string(SimTypeStr(i))) = sum(cell2mat(score.(string(SimTypeStr(i)))(:,3)));
    totActivities.(string(SimTypeStr(i))) = sum(cell2mat(activityXAgent.(string(SimTypeStr(i)))(:,2)));
    KMatrixScoAct.(string(SimTypeStr(i))) = [cell2mat(score.(string(SimTypeStr(i)))(:,3))/totScore.(string(SimTypeStr(i))) cell2mat(activityXAgent.(string(SimTypeStr(i)))(:,2))/totActivities.(string(SimTypeStr(i))) cell2mat(score.(string(SimTypeStr(i)))(:,1:2))];
end



for j = 1:length(clusters)
    for i = 1:size(SimTypeStr)
        KmeansScoAct.(SimTypeStr{i}) = kmeans(KMatrixScoAct.(string(SimTypeStr(i)))(:,1:2),length(clusters),'Distance','sqeuclidean','Replicates',10);
        KmeansScoAct.(SimTypeStr{i}) = [KmeansScoAct.(SimTypeStr{i}) KMatrixScoAct.(string(SimTypeStr(i)))];
    end
end

%% Further Clusterization
% for i = 1:length(clusters)
%     clustersString(i) = sprintf('cluster%i',i);
% end
% for i = 1:size(SimTypeStr)
%    for k = 1:length(clusters)
%        for j = 1:length((Kmeans.(SimTypeStr{i})))
%             if isequal(clusters(k),Kmeans.(SimTypeStr{i})(j))
%                 KMatrixKmeans.(SimTypeStr{i}).(clustersString{k})(j,:) =  [KMatrix.(SimTypeStr{i})(j,:) Kmeans.(SimTypeStr{i})(j)];
%             end
%         end
%     end
% end
% 
% for i = 1:size(SimTypeStr)  %remove the []
%    for k = 1:length(clusters)
%     temp_size = size(KMatrixKmeans.(string(SimTypeStr(i))).(clustersString{k}));
%     KMatrixKmeans.(string(SimTypeStr(i))).(clustersString{k}) = KMatrixKmeans.(string(SimTypeStr(i))).(clustersString{k})(~cellfun('isempty',KMatrixKmeans.(string(SimTypeStr(i))).(clustersString{k})));
%     KMatrixKmeans.(string(SimTypeStr(i))).(clustersString{k}) = reshape(KMatrixKmeans.(string(SimTypeStr(i))).(clustersString{k}),[],temp_size(:,2));
%    end
% end
%clear temp_size

%% Plot the Kmeans of Score & number of activities

for i = 1:size(SimTypeStr)
    t = tiledlayout(2,1);
    nexttile
    gscatter(KmeansScoAct.(string(SimTypeStr(i)))(:,2), KmeansScoAct.(string(SimTypeStr(i)))(:,3),KmeansScoAct.(string(SimTypeStr(i)))(:,1))
    title('K-means Clustering');
    xlabel('Normalized Score');
    ylabel('Normalized number of activities');

%% Plot the Kmeans of Score & number of activities but with VOT instead of activities
    nexttile
    gscatter(KmeansScoAct.(string(SimTypeStr(i)))(:,2), KmeansScoAct.(string(SimTypeStr(i)))(:,3),KmeansScoAct.(string(SimTypeStr(i)))(:,5))
    title(sprintf('VOT Clustering %s ',char(SimTypeStrPlot(i))));
    xlabel('Normalized Score');
    ylabel('Normalized number of activities');
    hold off
    filename = sprintf('K-means Clustering score_act%i.png',i);
    saveas(gca,filename);
    close;
end

%% K-means clustering of Score & Costs

for i = 1:length(SimTypeStr)-2
    load(sprintf('Revenue_%i.mat',i+1),'revenueList');
    cost.(string(SimTypeStr(i))) = revenueList;
    cost.(string(SimTypeStr(i))) = sortrows(cost.(string(SimTypeStr(i))),1);
    score_temp.(string(SimTypeStr(i))) = sortrows(score.(string(SimTypeStr(i))),1);
    totScore.(string(SimTypeStr(i))) = sum(cell2mat(score_temp.(string(SimTypeStr(i)))(:,3)));
    totCost.(string(SimTypeStr(i))) = sum(cost.(string(SimTypeStr(i))));
    temp_cost = cost.(string(SimTypeStr(i)))./totCost.(string(SimTypeStr(i)));
    KmatrixScoCost.(string(SimTypeStr(i))) = [cell2mat(score_temp.(string(SimTypeStr(i)))(:,3))/totScore.(string(SimTypeStr(i))) temp_cost(:,3) cell2mat(score_temp.(string(SimTypeStr(i)))(:,1:2))];
    clear revenueList
    clear temp_cost
end

for j = 1:length(clusters)
    for i = 1:length(SimTypeStr)-2
        KmeansScoCost.(SimTypeStr{i}) = kmeans(KmatrixScoCost.(string(SimTypeStr(i)))(:,1:2),length(clusters),'Distance','sqeuclidean','Replicates',10);
        KmeansScoCost.(SimTypeStr{i}) = [KmeansScoCost.(SimTypeStr{i}) KmatrixScoCost.(string(SimTypeStr(i)))];
    end
end

%% Plot the Kmeans of Score & Cost

for i = 1:length(SimTypeStr)-2
    t = tiledlayout(2,1);
    nexttile
    gscatter(KmeansScoCost.(string(SimTypeStr(i)))(:,2), KmeansScoCost.(string(SimTypeStr(i)))(:,3),KmeansScoCost.(string(SimTypeStr(i)))(:,1))
    title('K-means Clustering');
    xlabel('Normalized Score');
    ylabel('Normalized Cost');

%% Plot the Kmeans of Score & Cost but with VOT instead of activities
    nexttile
    gscatter(KmeansScoCost.(string(SimTypeStr(i)))(:,2), KmeansScoCost.(string(SimTypeStr(i)))(:,3),KmeansScoCost.(string(SimTypeStr(i)))(:,5))
    title(sprintf('VOT Clustering %s ',char(SimTypeStrPlot(i))));
    xlabel('Normalized Score');
    ylabel('Normalized Cost');
    hold off
    filename = sprintf('K-means Clustering score_cost%i.png',i);
    saveas(gca,filename);
    close;
end

%% K-means clustering of Score & number of modes
KMatrixKmeans = [];

for i = 1:size(SimTypeStr)
    totScore.(string(SimTypeStr(i))) = sum(cell2mat(score.(string(SimTypeStr(i)))(:,3)));
    totModes.(string(SimTypeStr(i))) = sum(cell2mat(modeXAgent.(string(SimTypeStr(i)))(:,2)));
    KMatrixScoMod.(string(SimTypeStr(i))) = [cell2mat(score.(string(SimTypeStr(i)))(:,3))/totScore.(string(SimTypeStr(i))) cell2mat(modeXAgent.(string(SimTypeStr(i)))(:,2))/totModes.(string(SimTypeStr(i))) cell2mat(score.(string(SimTypeStr(i)))(:,1:2))];
end



for j = 1:length(clusters)
    for i = 1:size(SimTypeStr)
        KmeansScoMod.(SimTypeStr{i}) = kmeans(KMatrixScoMod.(string(SimTypeStr(i)))(:,1:2),length(clusters),'Distance','sqeuclidean','Replicates',10);
        KmeansScoMod.(SimTypeStr{i}) = [KmeansScoMod.(SimTypeStr{i}) KMatrixScoMod.(string(SimTypeStr(i)))];
    end
end

%% Plot the Kmeans of Score & number of modes

for i = 1:size(SimTypeStr)
    t = tiledlayout(2,1);
    nexttile
    gscatter(KmeansScoMod.(string(SimTypeStr(i)))(:,2), KmeansScoMod.(string(SimTypeStr(i)))(:,3),KmeansScoMod.(string(SimTypeStr(i)))(:,1))
    title('K-means Clustering');
    xlabel('Normalized Score');
    ylabel('Normalized number of modes');

%% Plot the Kmeans of Score & number of activities but with VOT instead of activities
    nexttile
    gscatter(KmeansScoMod.(string(SimTypeStr(i)))(:,2), KmeansScoMod.(string(SimTypeStr(i)))(:,3),KmeansScoMod.(string(SimTypeStr(i)))(:,5))
    title(sprintf('VOT Clustering %s ',char(SimTypeStrPlot(i))));
    xlabel('Normalized Score');
    ylabel('Normalized number of  modes');
    hold off
    filename = sprintf('K-means Clustering score_mode%i.png',i);
    saveas(gca,filename);
    close;
end

%% K-means clustering of number of act & number of modes
KMatrixKmeans = [];

for i = 1:size(SimTypeStr)
    totActivities.(string(SimTypeStr(i))) = sum(cell2mat(activityXAgent.(string(SimTypeStr(i)))(:,2)));
    totModes.(string(SimTypeStr(i))) = sum(cell2mat(modeXAgent.(string(SimTypeStr(i)))(:,2)));
    KMatrixActMod.(string(SimTypeStr(i))) = [cell2mat(activityXAgent.(string(SimTypeStr(i)))(:,2))/totActivities.(string(SimTypeStr(i))) cell2mat(modeXAgent.(string(SimTypeStr(i)))(:,2))/totModes.(string(SimTypeStr(i))) cell2mat(score.(string(SimTypeStr(i)))(:,1:2))];
end



for j = 1:length(clusters)
    for i = 1:size(SimTypeStr)
        KmeansActMod.(SimTypeStr{i}) = kmeans(KMatrixActMod.(string(SimTypeStr(i)))(:,1:2),length(clusters),'Distance','sqeuclidean','Replicates',10);
        KmeansActMod.(SimTypeStr{i}) = [KMatrixActMod.(SimTypeStr{i}) KMatrixActMod.(string(SimTypeStr(i)))];
    end
end

%% Plot the Kmeans of number of act & number of modes

for i = 1:size(SimTypeStr)
    t = tiledlayout(2,1);
    nexttile
    gscatter(KmeansActMod.(string(SimTypeStr(i)))(:,2), KmeansActMod.(string(SimTypeStr(i)))(:,3),KmeansActMod.(string(SimTypeStr(i)))(:,1))
    title('K-means Clustering');
    xlabel('Normalized number of activities');
    ylabel('Normalized number of modes');

%% Plot the Kmeans of Score & number of activities but with VOT instead of activities
    nexttile
    gscatter(KmeansActMod.(string(SimTypeStr(i)))(:,2), KmeansActMod.(string(SimTypeStr(i)))(:,3),KmeansActMod.(string(SimTypeStr(i)))(:,5))
    title(sprintf('VOT Clustering %s ',char(SimTypeStrPlot(i))));
    xlabel('Normalized number of activities');
    ylabel('Normalized number of  modes');
    hold off
    filename = sprintf('K-means Clustering activity_mode%i.png',i);
    saveas(gca,filename);
    close;
end















