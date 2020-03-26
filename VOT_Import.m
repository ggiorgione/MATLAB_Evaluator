%Import all the Person IDs from the Berlin Population

VOT=[];                                                  %creates an empty matrix
fid = fopen('/Users/giulio.giorgione/Documents/MATLAB/TRB2020/plans.txt');    
tline = fgetl(fid);                                      %Read line from file specified in "fid", removing newline characters
while ischar(tline)                                      %while the line is a character do...
    if (startsWith(tline,'<person age='))                 %take every line starting with '...' 
        splittedLine=strsplit(tline,'"');                %split line with that character
        VOT=[VOT; splittedLine(16)];                     %which cell of the splittedLine to take
    end
    tline = fgetl(fid);
end
fclose(fid);

PersonID=[];                                             %creates an empty matrix
fid = fopen('/Users/giulio.giorgione/Documents/MATLAB/TRB2020/plans.txt');    
tline = fgets(fid);                                      %Read line from file specified in "fid", removing newline characters
while ischar(tline)                                      %while the line is a character do...
    if (startsWith(tline,'<person age='))                 %take every line starting with '...' 
        splittedLine=strsplit(tline,'"');                %split line with that character
        PersonID=[PersonID; splittedLine(8)];            %which cell of the splittedLine to take
    end
    tline = fgets(fid);
end
fclose(fid);

VOT_ID=[];
VOT_ID = [PersonID VOT];