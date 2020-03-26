%STATION EQUILIBRIUM

delimiterIn = ",";
RentedCars = readtable(inputequil,'Delimiter',',');
StationCode = readtable('CSStations.txt','Delimiter',',');
RentedCars = table2array (RentedCars);
StationCode.X = [];
StationCode.Y = [];
StationCode = table2array(inputTable);

for i=1:numel(StationCode(:,1))
    for j=1:numel(RentedCars(:,1))
        if RentedCars(j,2) == StationCode(i,1)
            RentedCars(j,3) = StationCode(i,2);
        end
    end
end

RentedCars = sortrows(RentedCars,3);

for k=1:numel(RentedCars(:,1))
    if RentedCars(k,3) == 2
%             if numel(RentedCarsEva(1,:)) == 4 && y>1
%                 RentedCarsEva(:,4) = [];
%             end
        RentedCarsEva(k,:) = RentedCars(k,:);
    end
end
Temp = RentedCarsEva;
RentedCarsEvaTemp = nonzeros(RentedCarsEva);
RentedCarsEva = reshape(RentedCarsEvaTemp,[],3);

Steps = [];
for l=1:numel(RentedCarsEva(:,1))
    Steps(l,1) = l;
end

RentedCarsEva(:,4) = Steps;

%-------------------------------------------------------------------------
%Ariane
%-------------------------------------------------------------------------

A=unique(RentedCarsEva(:,2));
B=zeros(size(RentedCarsEva,1)+1,size(A,1));

i=1;
ii=1;

for ii=1:size(RentedCarsEva,1)
    for i=1:size(A,1)
        if RentedCarsEva(ii,2)==A(i)
            B(ii+1,i)=B(ii,i)+1;
        else
            B(ii+1,i)=B(ii,i);
        end

    end
    i=1;
end

RentedCarsEva = [];


A = num2str(A);
StationID = "StationID";
A = StationID + A;
figure
plot(B)
filename1 = sprintf("Car Rent Distribution%i",y);
title(filename1);
hold on
xlabel('Time Step');
ylabel('Vehicles Cumulative');
legend(A,'Location','northwest');
filename = sprintf('Car Rent Distribution%i.png',y);
saveas(gca,filename);
hold off
