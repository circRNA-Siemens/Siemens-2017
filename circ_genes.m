cd ..
cd Spreadsheets
[num1,txt1,everything1]= xlsread("circRNA database list.xlsx");
[num2,txt2,everything2] = xlsread("miR-203_CircGenes_Edges.xlsx");
gene_list = cell( size(txt2,1) , 1 );
index = 2;
for a=1:65535
    if index > size(txt2,1)
        break
    end
    if strcmp(txt1{a,1},txt2{index,1})
        gene_list{index,1} = txt1{a,10};
        disp(txt1(a,10));
        index = index + 1;
    end
end


cd ..
cd Matlab