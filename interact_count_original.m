%@a Meiling Thompson
%Stanford Institute of Medical Research (SIMR) Summer 2017
%Tharin Lab
%Description: 
%FINALIZED as of 06.30.2017
%[WINDOWS FORMATTED DATA ONLY PLEASE]

%Read user input for worksheet name
ind = input('Enter index as two digits: ', 's'); % read index 
miRNA_name = input('Enter miRNA Name: ', 's'); 

%Read worksheet into matlab
[num,txt,everything] = xlsread("NEWCircInteractomeData.xlsm",strcat(ind,'.',miRNA_name),"A:A");
size_txt = size(txt); %finds size of text
circ_list = cell( ceil((size_txt(1)-1)/3), 1); %finds number of circRNA by (numRows-1)/3 and creates cell array
index = 1; %initializes index of circ_list to 1
for i=1:size(txt) %cycles through all elements of txt
    if mod(i,3) == 2 %if the current index 
        circ_list{index,1} = txt{i,1}; %
        index = index + 1;
    end
end

record = zeros(65535,1);
for i = 1:65535 
    record(i,1) = -1;
end
max = 0;
count = 0;
prev = "";
max_count = 0;
count_record = zeros(1000,1);
for i=1:size(circ_list)
    x = circ_list(i,1);
    curr = x{1,1};
    if( strcmp(curr, prev) == 1 )
        count = count + 1;
        if count > max_count
            max_count = count;
        end
    else
        record(num2str(num),1) = count;
        if count > 0 
            count_record(count,1) = count_record(count,1) + 1;
        end
        num = base2dec(curr(10:16),10);
        if num > 65535 
            break
        elseif num > max
            max = num;
        end
        count = 1;
        prev = curr;
    end
end

[num,txt,current_data] = xlsread("InteractData.xlsx");
size_rows = size(current_data, 2);
size_rows = size_rows + 1;
column_char = char(size_rows+'A'-1);
xlswrite("InteractData.xlsx", strcat(cellstr(ind),'.',cellstr(miRNA_name)), strcat(column_char,'1:',column_char,'1') );
xlswrite("InteractData.xlsx", record, strcat(column_char,'2:',column_char,'65536'));
