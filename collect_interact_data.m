%@a Meiling Thompson
%Stanford Institute of Medical Research (SIMR) Summer 2017
%Tharin Lab
%Description: 
%FINALIZED as of 06.30.2017

size_rows = 1; %starts at row 1 of the excel sheet for responses
[num,txt,raw] = xlsread("NEWcircInteractomeData.xlsx","miRNAList","A:A"); %reads in windows miRNA list 
miRNA_list_1 = txt; %store miRNA list in the correct variable
for i = 1:size(miRNA_list_1, 1) %go through windows miRNA list
    %display message to user to show progress
    message = strcat('[WINDOWS] Inititiating:','  ', num2str(i), ' of: ', num2str(size(miRNA_list_1,1)))
    sheet_name = miRNA_list_1{i,1}; %retrieve name of sheet
    interact_count_w %execute program to extract circRNA-miRNA interactions
end

[num,txt,raw] = xlsread("MACcircInteractomeData.xlsx","miRNAList","A:A"); %read in mac miRNA list
miRNA_list_2 = txt; %store miRNA list in the correct variable
for i = 1:size(miRNA_list_2,1) %go through mac miRNA list
    %display message to user to show progress
    message = strcat('[MAC] Inititiating:','  ', num2str(i), ' of: ', num2str(size(miRNA_list_1,1)))
    sheet_name = miRNA_list_2{i,1}; %retrieve name of sheet
    interact_count_m %execute program to extract circRNA-miRNA interactions
end
