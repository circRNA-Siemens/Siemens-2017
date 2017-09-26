%@a Meiling Thompson
%Stanford Institute of Medical Research (SIMR) Summer 2017
%Tharin Lab
%Description: 
%FINALIZED as of 06.30.2017

%Read user input for worksheet name - TESTING ONLY
%ind = input('Enter index as two digits: ', 's'); % read index 
%miRNA_name = input('Enter miRNA Name: ', 's'); 

%Read worksheet into matlab
[num,txt,everything] = xlsread("MACcircInteractomeData.xlsx",sheet_name,"A:A");
size_txt = size(txt); %finds size of text
circ_list = cell( ceil((size_txt(1)-1)/5), 1); %finds number of circRNA by (numRows-1)/3 and creates cell array
index = 1; %initializes index of circ_list to 1
for i=1:size(txt) %cycles through all elements of txt
    if mod(i,5) == 2 %if the current index 
        circ_list{index,1} = txt{i,1}; %
        index = index + 1;
    end
end

%initialize record to -1 (so find and preplace is easier later)
record = zeros(65535,1); %create array
for i = 1:65535 
    record(i,1) = -1;
end

for i=1:size(circ_list)
    curr = circ_list(i,1); %extracts circRNA name from circ_list
    curr = curr{1,1}; %extracts string from cell
    num = base2dec(curr(10:16),10);
    if num > 65535 %there are only 65,535 circRNA in the recorded NIH DB
        break
    end
    if record(num,1) == -1 %if nothing has been counted yet
        record(num,1) = 1; %initialize to 1
    else
        record(num,1) = record(num,1) + 1; %add one to current count
    end
end

column_char = char(size_rows+'A'-1); %finds column character
xlswrite("InteractData.xlsx", cellstr(sheet_name), strcat(column_char,'1:', column_char,'1') ); %header
xlswrite("InteractData.xlsx", record, strcat(column_char,'2:', column_char,'65536')); %data
size_rows = size_rows + 1;
