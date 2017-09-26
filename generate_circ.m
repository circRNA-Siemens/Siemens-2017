%@a Meiling Thompson
%Stanford Institute of Medical Research (SIMR) Summer 2017
%Tharin Lab
%Description: Generates the names of circRNAs - hsa_circ_#######
%FINALIZED as of 06.30.2017

circ_names = cell(65535,1); %there are 65535 circRNAs
for i = 1:65535 %cycle through all numbers from 1 to 65535
    num = num2str(i); %change i into a number
    for x=1:(7-size(num,2))
        num = strcat('0',num); %add leading 0s until it is 7 digits
    end 
    circ_names{i,1} = strcat('hsa_circ_', num); %construct and store circ name
end
xlswrite("InteractDataZERO.xlsx", circ_names,"A2:A65536" ); %write new circ names to excel sheet