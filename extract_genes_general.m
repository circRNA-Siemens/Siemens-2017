miRNA_name = input('Enter miRNA Name: ','s');
file_name = input('Enter file name: ','s');

cd ..;

[num2,txt2,everything2] = xlsread(file_name);

count = 0;
index = 1;
list = cell(1000,1);

for b = 1:size(txt2,1) %go through all rows of data
    if strcmp(txt2{b,3},miRNA_name) %miRNA name is in the second column
        count = count + 1; %add one to the count
      	current = txt2{b,2}; %set current to current text
    	index1 = find( char(current) == '(' ); %find location of '('
        index2 = find( char(current) == ')' ); %find location of ')'
        %set current list position to the gene within the '(' and ')'
        list{index,1} = current(index1+1:index2-1); %store gene name in list
        index = index + 1; %add one to the list index
 	end
end