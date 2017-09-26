cd C:\Users\thepe\Documents\SIMR\Spreadsheets %change directory into correct location

[num,list,everything] = xlsread("[FINAL] miRNATargetSearch.xlsx", "miRNA list"); %read in data

index = 1; %start at index 1
for i:size(list,1) %cycle through all rows of data
    [num,txt,everything] = xlsread("[FINAL] miRNATargetSearch.xlsx", list(i,1) ); %read in spreadsheets
end