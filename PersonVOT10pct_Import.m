%Import all the Person IDs from the Berlin Population

lineIDs10pctVOT=[];                                       %creates an empty matrix
fid = fopen('/Users/giulio.giorgione/Documents/MATLAB/TRB2020/plans.txt');    
tline = fgetl(fid);                                      %Read line from file specified in "fid", removing newline characters
while ischar(tline)                                      %while the line is a character do...
    if (startsWith(tline,'<person age='))                  %take every line starting with '...' 
        splittedLine=strsplit(tline,'"');                %split line with that character
        lineIDs10pctVOT=[lineIDs10pctVOT; splittedLine(16)]; %which cell of the splittedLine to take
    end
    tline = fgetl(fid);
end
fclose(fid);

%lineIDs10pctVOT = unique(lineIDs10pctVOT,'stable');