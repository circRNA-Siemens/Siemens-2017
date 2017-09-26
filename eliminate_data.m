%@a Meiling Thompson
%Stanford Institute of Medical Research (SIMR) Summer 2017
%Tharin Lab
%Description: 
%FINALIZED as of 06.30.2017

cd .. %move out of matlab folder
cd Spreadsheets %move into spreadsheets folder
[num,txt,everything] = xlsread("V2_Blank.xlsx"); %read in interaction data
new_data = cell(1000,21); %create new cell array to store data
for i = 1:size(new_data,1) %cycle through new array
    for a = 2:21 %cycle through cells 2 to 21 of each row
        new_data{i,a} = 0; %assign all values in the array to 0
    end
end
events = cell(10000,3); %new three column cell array
current_index = 1; %set current_index to 1
cutoff = input('Enter cutoff: '); %prompt user for cutoff
events_index = 1; %set events_index to 1
for a = 2:(size(everything,1)) %cycle through all data except first row (headers)
    for b = 2:(size(everything,2)) %cycle through all columns except first columns (headers)
        if isnan(everything{a,b}) == 0 && everything{a,b} > cutoff %if the cell isn't empty and is more than the cutoff
            %assign each attribute to the appropriate column, 1:miRNA
            %2:circRNA, 3:number of interactions
            new_data{current_index,1} = everything{a,1}; %assign row header
            for c = 2:21 %cycle through all other interactions
                %if there is a number in the cell and it is higher than the
                %cutoff
                if isnan(everything{a,c}) == 0 && everything{a,c} > cutoff
                    new_data{current_index,c} = everything{a,c}; %assign it to the appropriate cell
                    events{events_index,1} = everything{1,c}; %assign miRNA name 
                    events{events_index,2} = everything{a,1}; %assign circRNA name
                    events{events_index,3} = everything{a,c}; %assign number of interactions
                    events_index = events_index + 1; %add one to events_index
                end
            end
            current_index = current_index + 1; %next row of data
            break
        end
    end
end

xlswrite("V3_New.xlsx",new_data, strcat('Cutoff - ', num2str(cutoff))); %store in regular format
xlswrite("V3_3Cols_New.xlsx",events, strcat('Cutoff - ', num2str(cutoff))); %store in 3 column format

cd .. %move out of folder
cd Matlab %move into matlab folder