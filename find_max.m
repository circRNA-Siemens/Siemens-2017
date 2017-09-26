%@a Meiling Thompson
%Stanford Institute of Medical Research (SIMR) Summer 2017
%Tharin Lab
%Description: 
%FINALIZED as of 06.30.2017

max_count = count_record(1,1); %assigns max value to the first value
for i=1:size(count_record,1) %goes through entire count_record array
    if count_record(i,1) > max_count %if it is the new max
        max_count = count_record(i,1); %assign the value to max_count variable
    end
end

disp(max_count) %displays maximum number