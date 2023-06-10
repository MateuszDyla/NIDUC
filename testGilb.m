function  Test= tests()
err = 0.00005;
Pg=0.00001;
Pb=0.45;
GB=0.0001;

BG=0.49;
Test = zeros([1000 9]);
filename = 'dane4.txt';
fid = fopen(filename,'a');
pool = parpool();
%Data iniciation
data = fileread("RomeoiJulia.txt");
initialVectors = textToBinary(data);
%


disp('TRIPLE ')
parfor i=1:20
codedVectors = logical(binaryToTriple(initialVectors));
fid = fopen(filename,'a');
sentData = gilbert(codedVectors, Pg,Pb,GB,BG);
decodedVectors = logical(tripleToBinary(sentData));
redundancy1 = 100*(height(codedVectors)*width(codedVectors))/(height(decodedVectors)*width(decodedVectors));
[ber, berPercent] = biterr(initialVectors, decodedVectors);
incorrectLetters=differentLetters(decodedVectors,initialVectors);
percentIncorrectLetters = 100*incorrectLetters/length(initialVectors);
redundancy = 100*(height(codedVectors)*width(codedVectors))/(height(decodedVectors)*width(decodedVectors));
data = [1,1,err,ber,berPercent,incorrectLetters,percentIncorrectLetters,redundancy1,redundancy];  
fprintf(fid,'%d;%d;%d;%d;%d;%d;%d;%d;%d\n',data);
end

disp('7 4 ')
parfor i=1:20
    fid = fopen(filename,'a');
codedVectors = logical(binaryToHamming(initialVectors,7,4));
sentData = gilbert(codedVectors, Pg,Pb,GB,BG);
decodedVectors = logical(hammingToBinary(sentData,7,4));
redundancy1 = 100*(height(codedVectors)*width(codedVectors))/(height(decodedVectors)*width(decodedVectors));
decodedVectors = decodedVectors(1:length(initialVectors),:);
[ber, berPercent] = biterr(initialVectors, decodedVectors);
incorrectLetters=differentLetters(decodedVectors,initialVectors);
percentIncorrectLetters = 100*incorrectLetters/length(initialVectors);
redundancy = 100*(height(codedVectors)*width(codedVectors))/(height(decodedVectors)*width(decodedVectors));
data = [2,1,err,ber,berPercent,incorrectLetters,percentIncorrectLetters,redundancy1,redundancy];  
fprintf(fid,'%d;%d;%d;%d;%d;%d;%d;%d;%d\n',data);
end


disp('15 11 ')
parfor i=1:20
    fid = fopen(filename,'a');
codedVectors = logical(binaryToHamming(initialVectors,15,11));
sentData = gilbert(codedVectors, Pg,Pb,GB,BG);
decodedVectors = logical(hammingToBinary(sentData,15,11));
redundancy1 = 100*(height(codedVectors)*width(codedVectors))/(height(decodedVectors)*width(decodedVectors));
decodedVectors = decodedVectors(1:length(initialVectors),:);
[ber, berPercent] = biterr(initialVectors, decodedVectors);
incorrectLetters=differentLetters(decodedVectors,initialVectors);
percentIncorrectLetters = 100*incorrectLetters/length(initialVectors);
redundancy = 100*(height(codedVectors)*width(codedVectors))/(height(decodedVectors)*width(decodedVectors));
data = [3,1,err,ber,berPercent,incorrectLetters,percentIncorrectLetters,redundancy1,redundancy];  
fprintf(fid,'%d;%d;%d;%d;%d;%d;%d;%d;%d\n',data);
end



disp('31 26 ')
parfor i=1:20
    fid = fopen(filename,'a');
codedVectors = logical(binaryToHamming(initialVectors,31,26));
sentData = gilbert(codedVectors, Pg,Pb,GB,BG);
decodedVectors = logical(hammingToBinary(sentData,31,26));
redundancy1 = 100*(height(codedVectors)*width(codedVectors))/(height(decodedVectors)*width(decodedVectors));
decodedVectors = decodedVectors(1:length(initialVectors),:);
[ber, berPercent] = biterr(initialVectors, decodedVectors);
incorrectLetters=differentLetters(decodedVectors,initialVectors);
percentIncorrectLetters = 100*incorrectLetters/length(initialVectors);
redundancy = 100*(height(codedVectors)*width(codedVectors))/(height(decodedVectors)*width(decodedVectors));
data = [4,1,err,ber,berPercent,incorrectLetters,percentIncorrectLetters,redundancy1,redundancy];  
fprintf(fid,'%d;%d;%d;%d;%d;%d;%d;%d;%d\n',data);
end


disp('63 57 ')
parfor i=1:20
    fid = fopen(filename,'a');
codedVectors = logical(binaryToHamming(initialVectors,63,57));
sentData = gilbert(codedVectors, Pg,Pb,GB,BG);
decodedVectors = logical(hammingToBinary(sentData,63,57));
redundancy1 = 100*(height(codedVectors)*width(codedVectors))/(height(decodedVectors)*width(decodedVectors));
decodedVectors = decodedVectors(1:length(initialVectors),:);
[ber, berPercent] = biterr(initialVectors, decodedVectors);
incorrectLetters=differentLetters(decodedVectors,initialVectors);
percentIncorrectLetters = 100*incorrectLetters/length(initialVectors);
redundancy = 100*(height(codedVectors)*width(codedVectors))/(height(decodedVectors)*width(decodedVectors));
data = [5,1,err,ber,berPercent,incorrectLetters,percentIncorrectLetters,redundancy1,redundancy];  
fprintf(fid,'%d;%d;%d;%d;%d;%d;%d;%d;%d\n',data);
end


disp('127 120 ')
parfor i=1:20
    fid = fopen(filename,'a');
codedVectors = logical(binaryToHamming(initialVectors,127,120));
sentData = gilbert(codedVectors, Pg,Pb,GB,BG);
decodedVectors = logical(hammingToBinary(sentData,127,120));
redundancy1 = 100*(height(codedVectors)*width(codedVectors))/(height(decodedVectors)*width(decodedVectors));
decodedVectors = decodedVectors(1:length(initialVectors),:);
[ber, berPercent] = biterr(initialVectors, decodedVectors);
incorrectLetters=differentLetters(decodedVectors,initialVectors);
percentIncorrectLetters = 100*incorrectLetters/length(initialVectors);
redundancy = 100*(height(codedVectors)*width(codedVectors))/(height(decodedVectors)*width(decodedVectors));
data = [6,1,err,ber,berPercent,incorrectLetters,percentIncorrectLetters,redundancy1,redundancy];  
fprintf(fid,'%d;%d;%d;%d;%d;%d;%d;%d;%d\n',data);
end


disp('255 247 ')
parfor i=1:20
    fid = fopen(filename,'a');
codedVectors = logical(binaryToHamming(initialVectors,255,247));
sentData = gilbert(codedVectors, Pg,Pb,GB,BG);
decodedVectors = logical(hammingToBinary(sentData,255,247));
redundancy1 = 100*(height(codedVectors)*width(codedVectors))/(height(decodedVectors)*width(decodedVectors));
decodedVectors = decodedVectors(1:length(initialVectors),:);
[ber, berPercent] = biterr(initialVectors, decodedVectors);
incorrectLetters=differentLetters(decodedVectors,initialVectors);
percentIncorrectLetters = 100*incorrectLetters/length(initialVectors);
redundancy = 100*(height(codedVectors)*width(codedVectors))/(height(decodedVectors)*width(decodedVectors));
data = [7,1,err,ber,berPercent,incorrectLetters,percentIncorrectLetters,redundancy1,redundancy];  
fprintf(fid,'%d;%d;%d;%d;%d;%d;%d;%d;%d\n',data);
end


disp('511 502 ')
parfor i=1:20
    fid = fopen(filename,'a');
codedVectors = logical(binaryToHamming(initialVectors,511,502));
sentData = gilbert(codedVectors, Pg,Pb,GB,BG);
decodedVectors = logical(hammingToBinary(sentData,511,502));
redundancy1 = 100*(height(codedVectors)*width(codedVectors))/(height(decodedVectors)*width(decodedVectors));
decodedVectors = decodedVectors(1:length(initialVectors),:);
[ber, berPercent] = biterr(initialVectors, decodedVectors);
incorrectLetters=differentLetters(decodedVectors,initialVectors);
percentIncorrectLetters = 100*incorrectLetters/length(initialVectors);
redundancy = 100*(height(codedVectors)*width(codedVectors))/(height(decodedVectors)*width(decodedVectors));
data = [8,1,err,ber,berPercent,incorrectLetters,percentIncorrectLetters,redundancy1,redundancy];  
fprintf(fid,'%d;%d;%d;%d;%d;%d;%d;%d;%d\n',data);
end


delete (pool);

