%StationsBookingPlot

if T == 2
    %%2-3
    load StationsBookingCounts2.mat
    StationsBookingCountsPlot2 = bar(StationsBookingCounts(1,1),StationsBookingCounts(1,2),'FaceColor','m');
    hold on
    StationsBookingCountsPlot2 = bar(StationsBookingCounts(2:9,1),StationsBookingCounts(2:9,2),'FaceColor','y');
    StationsBookingCountsPlot2 = bar(StationsBookingCounts(10:17,1),StationsBookingCounts(10:17,2),'FaceColor','c');
    xlabel('Station ID');
    ylabel('# Bookings');
    title('Number of Bookings per Station - FP');
    ylim([0 7]);
    xlim([0 inf]);
    set(gca,'XTickLabel',num2str(StationsIDentifier(:,1))),set(gca,'XTick',1:numel(StationsIDentifier(:,1)))
    filename = sprintf('StationsBookingCountsPlot2.png');
    saveas(gca,filename);
    hold off

    StationsBookingCounts2 =  [1,sum(StationsBookingCounts(:,2))];

    load StationsBookingCounts3.mat
    StationsBookingCountsPlot3 = bar(StationsBookingCounts(1,1),StationsBookingCounts(1,2),'FaceColor','m');
    hold on
    StationsBookingCountsPlot3 = bar(StationsBookingCounts(2:9,1),StationsBookingCounts(2:9,2),'FaceColor','y');
    StationsBookingCountsPlot3 = bar(StationsBookingCounts(10:17,1),StationsBookingCounts(10:17,2),'FaceColor','c');
    xlabel('Station ID');
    ylabel('# Bookings');
    title('Number of Bookings per Station - ABDP');
    ylim([0 7]);
    xlim([0 inf]);
    set(gca,'XTickLabel',num2str(StationsIDentifier(:,1))),set(gca,'XTick',1:numel(StationsIDentifier(:,1)))
    filename = sprintf('StationsBookingCountsPlot3.png');
    saveas(gca,filename);
    hold off

    StationsBookingCounts3 =  [1,sum(StationsBookingCounts(:,2))];

    %TotalBooking
    totalBooking = bar(1,sum(StationsBookingCounts2(:,2)),'FaceColor','r');
    hold on
    totalBooking = bar(2,sum(StationsBookingCounts3(:,2)),'FaceColor','b');
    xticks([1 2]);
    xticklabels({'Fixed Pricing','Availability Based Dynamic Pricing'});
    ylabel('# Bookings');
    title('Number of Bookings');
    filename = sprintf('BookingCounts2-3.png');
    saveas(gca,filename);
    hold off

    %% 2-4
    % if y==4

    load StationsBookingCounts4.mat
    StationsBookingCountsPlot4 = bar(StationsBookingCounts(1,1),StationsBookingCounts(1,2),'FaceColor','m');
    hold on
    StationsBookingCountsPlot4 = bar(StationsBookingCounts(2:9,1),StationsBookingCounts(2:9,2),'FaceColor','y');
    StationsBookingCountsPlot4 = bar(StationsBookingCounts(10:17,1),StationsBookingCounts(10:17,2),'FaceColor','c');
    xlabel('Station ID');
    ylabel('# Bookings');
    title('Number of Bookings per Station - TBDP');
    ylim([0 7]);
    xlim([0 inf]);
    set(gca,'XTickLabel',num2str(StationsIDentifier(:,1))),set(gca,'XTick',1:numel(StationsIDentifier(:,1)))
    filename = sprintf('StationsBookingCountsPlot4.png');
    saveas(gca,filename);
    hold off

    StationsBookingCounts4 =  [1,sum(StationsBookingCounts(:,2))];

    %TotalBooking
    totalBooking = bar(1,sum(StationsBookingCounts2(:,2)),'FaceColor','r');
    hold on
    totalBooking = bar(2,sum(StationsBookingCounts4(:,2)),'FaceColor','m');
    xticks([1 2]);
    xticklabels({'Fixed Pricing','Time Based Dynamic Pricing'});
    ylabel('# Bookings');
    title('Number of Bookings');
    filename = sprintf('BookingCounts2-4.png');
    saveas(gca,filename);
    hold off
    % end
end

if T == 3
    %% 2-3
    % if y==3
        load StationsBookingCounts2.mat
        StationsBookingCountsPlot2 = bar(StationsBookingCounts(1,1),StationsBookingCounts(1,2),'FaceColor','y');
        hold on
        StationsBookingCountsPlot2 = bar(StationsBookingCounts(2:5,1),StationsBookingCounts(2:5,2),'FaceColor','c');
        StationsBookingCountsPlot2 = bar(StationsBookingCounts(6:9,1),StationsBookingCounts(6:9,2),'FaceColor','b');
        StationsBookingCountsPlot2 = bar(StationsBookingCounts(10:13,1),StationsBookingCounts(10:13,2),'FaceColor','g');
        StationsBookingCountsPlot2 = bar(StationsBookingCounts(14:17,1),StationsBookingCounts(14:17,2),'FaceColor','m');
        xlabel('Station ID');
        ylabel('# Bookings');
        title('Number of Bookings per Station - FP');
        ylim([0 inf]);
        xlim([0 inf]);
        set(gca,'XTickLabel',num2str(StationsIDentifier(:,1))),set(gca,'XTick',1:numel(StationsIDentifier(:,1)))
        filename = sprintf('StationsBookingCountsPlot2.png');
        saveas(gca,filename);
        hold off

        StationsBookingCounts2 =  [1,sum(StationsBookingCounts(:,2))];

        load StationsBookingCounts3.mat
        StationsBookingCountsPlot3 = bar(StationsBookingCounts(1,1),StationsBookingCounts(1,2),'FaceColor','y');
        hold on
        StationsBookingCountsPlot3 = bar(StationsBookingCounts(2:5,1),StationsBookingCounts(2:5,2),'FaceColor','c');
        StationsBookingCountsPlot3 = bar(StationsBookingCounts(6:9,1),StationsBookingCounts(6:9,2),'FaceColor','b');
        StationsBookingCountsPlot3 = bar(StationsBookingCounts(10:13,1),StationsBookingCounts(10:13,2),'FaceColor','g');
        StationsBookingCountsPlot3 = bar(StationsBookingCounts(14:17,1),StationsBookingCounts(14:17,2),'FaceColor','m');
        xlabel('Station ID');
        ylabel('# Bookings');
        title('Number of Bookings per Station - ABDP');
        ylim([0 inf]);
        xlim([0 inf]);
        set(gca,'XTickLabel',num2str(StationsIDentifier(:,1))),set(gca,'XTick',1:numel(StationsIDentifier(:,1)))
        filename = sprintf('StationsBookingCountsPlot3.png');
        saveas(gca,filename);
        hold off

        StationsBookingCounts3 =  [1,sum(StationsBookingCounts(:,2))];

        %TotalBooking
        totalBooking = bar(1,sum(StationsBookingCounts2(:,2)),'FaceColor','r');
        hold on
        totalBooking = bar(2,sum(StationsBookingCounts3(:,2)),'FaceColor','b');
        xticks([1 2]);
        xticklabels({'Fixed Pricing','Availability Based Dynamic Pricing'});
        ylabel('# Bookings');
        title('Number of Bookings');
        filename = sprintf('BookingCounts2-3.png');
        saveas(gca,filename);
        hold off
    % end

    %% 2-4
    load StationsBookingCounts4.mat
    StationsBookingCountsPlot4 = bar(StationsBookingCounts(1,1),StationsBookingCounts(1,2),'FaceColor','y');
    hold on
    StationsBookingCountsPlot4 = bar(StationsBookingCounts(2:5,1),StationsBookingCounts(2:5,2),'FaceColor','c');
    StationsBookingCountsPlot4 = bar(StationsBookingCounts(6:9,1),StationsBookingCounts(6:9,2),'FaceColor','b');
    StationsBookingCountsPlot4 = bar(StationsBookingCounts(10:13,1),StationsBookingCounts(10:13,2),'FaceColor','g');
    StationsBookingCountsPlot4 = bar(StationsBookingCounts(14:17,1),StationsBookingCounts(14:17,2),'FaceColor','m');
    xlabel('Station ID');
    ylabel('# Bookings');
    title('Number of Bookings per Station - TBDP');
    ylim([0 inf]);
    xlim([0 inf]);
    set(gca,'XTickLabel',num2str(StationsIDentifier(:,1))),set(gca,'XTick',1:numel(StationsIDentifier(:,1)))
    filename = sprintf('StationsBookingCountsPlot4.png');
    saveas(gca,filename);
    hold off

    StationsBookingCounts4 =  [1,sum(StationsBookingCounts(:,2))];

    %TotalBooking
    totalBooking = bar(1,sum(StationsBookingCounts2(:,2)),'FaceColor','r');
    hold on
    totalBooking = bar(2,sum(StationsBookingCounts4(:,2)),'FaceColor','m');
    xticks([1 2]);
    xticklabels({'Fixed Pricing','Time Based Dynamic Pricing'});
    ylabel('# Bookings');
    title('Number of Bookings');
    filename = sprintf('BookingCounts2-4.png');
    saveas(gca,filename);
    hold off
end
