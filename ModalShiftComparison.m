%Modal Shift from carsharing through the different pricing simulations 2-3
%and 3-4
C = (2:1:4);    %Pricing Strategy Type. 2=FP, 3=ABDP,4=TBDP.
PD = (3:4);

for i = C
    CS_address = sprintf('/Users/giulio.giorgione/Documents/Python/src/ParseAndPrintIDsActivitiesModes/BasicPlan4CS_%i.txt',i);
    delimiterIn = ",";
    inputTableCS = readtable(CS_address,'Delimiter','\t');
    filename = sprintf('inputTableCS_%i.mat',i);
    save(filename,'inputTableCS');
end

for j = PD-1
    PlanDifferences_address = sprintf('/Users/giulio.giorgione/Documents/Python/src/ParseAndPrintIDsActivitiesModes/PlanDifferences_%i-%i.txt',j,j+1);
    delimiterIn = ",";
    inputTablePD = readtable(PlanDifferences_address,'Delimiter','\t');
    filename = sprintf('inputTablePD_%i.mat',i);
    save(filename,'inputTablePD');
end

