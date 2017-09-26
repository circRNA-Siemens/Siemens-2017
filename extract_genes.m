%@a Meiling Thompson
%Stanford Institute of Medical Research (SIMR) Summer 2017
%Tharin Lab
%Description: Extracts genes from the data exported from Diana MicroT-CDs
%Formatting requirements: 19 worksheets in the workbook labeled 01 to 19,
%formatted in the same style that Diana MicroT-CDs exports it in 
%FINALIZED as of 06.30.2017

cd 'C:\Users\thepe\Documents\SIMR\Spreadsheets' %move into spreadsheets folder
for i = 1:19 %for all 19 miRNA
    prev = 2; %set var 'prev' to 2 because first row is headers
    count = 0; %stores number of genes, starts at 0
    mIndex = 2; %index of array that stores genes
    if i < 10 %if sheet number is single digit
        sheet_name = strcat('0',num2str(i)); %make i double digit w a leading 0
    else
        sheet_name = num2str(i); %keep it double digit
    end
    [num1,txt1,everything1] = xlsread("miRNATargetSearch.xlsx", sheet_name, "G2:G3"); %read in miRNA names
    index = 1; %initial index starts at 1
    for a = 1:size(txt1,1) %go through all miRNA (there will be 1 or 2)
        list = cell(2000,1); %make empty cell array to store genes
        index = 1; %initial index starts at 1
        cd 'C:\Users\thepe\Documents\SIMR\Spreadsheets\Diana' %move into folder with Diana
        [num2,txt2,everything2] = xlsread(strcat(everything1{a,1},'.xlsx'));
        for b = 1:size(txt2,1) %go through all rows of data
            if strcmp(txt2{b,3},everything1{a,1}) %miRNA name is in the second column
                count = count + 1; %add one to the count
                current = txt2{b,2}; %set current to current text
                index1 = find( char(current) == '(' ); %find location of '('
                index2 = find( char(current) == ')' ); %find location of ')'
                %set current list position to the gene within the '(' and ')'
                list{index,1} = current(index1+1:index2-1); %store gene name in list
                index = index + 1; %add one to the list index
            end
        end
        cd 'C:\Users\thepe\Documents\SIMR\Spreadsheets' %move into spreadsheets folder
    	list{index,1} = everything1{a,1}; 
        %write gene list to excel spreadsheet
        xlswrite('miRNATargetSearch.xlsx',list,sheet_name, strcat('C',num2str(prev),':C',num2str(prev+count)));
        prev = prev + count + 1; %new index of genes
        count = 0; %set new count to 0
    end
end

cd 'C:\Users\thepe\Documents\SIMR\Matlab' %return back to Matlab folder