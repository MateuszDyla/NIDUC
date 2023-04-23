function  Test= tests()
Test = zeros([8000 8]);

%Data iniciation
data = fileread("RomeoiJulia.txt");
initialVectors = textToBinary(data);
%
err=0.5;
i=1;
disp('TRIPLE ')
while i<100
 disp(i)

%Triple code
j=1;
err=err-0.005;
while j<=10

codedVectors = logical(binaryToTriple(initialVectors));
sentData = bsc(codedVectors, err);
decodedVectors = logical(tripleToBinary(sentData));
[ber, berPercent] = biterr(initialVectors, decodedVectors);
incorrectLetters=differentLetters(decodedVectors,initialVectors);
percentIncorrectLetters = 100*incorrectLetters/length(initialVectors);
redundancy = 100*(height(codedVectors)*width(codedVectors))/(height(decodedVectors)*width(decodedVectors));
%
Test(j+10*(i-1),1:8) = [1,1,err,ber,berPercent,incorrectLetters,percentIncorrectLetters,redundancy];
j=j+1;
end
i=i+1;
end
%/////////////////////////////////////////////////////////////////////////////////////////////
err=0.5;
i=1;
disp('7 4 ')
while i<100
%Triple code
disp(i)
j=1;
err=err-0.005;
while j<=10

codedVectors = logical(binaryToHamming(initialVectors,7,4));
sentData = bsc(codedVectors, err);
decodedVectors = logical(hammingToBinary(sentData,7,4));
decodedVectors = decodedVectors(1:length(initialVectors),:);
[ber, berPercent] = biterr(initialVectors, decodedVectors);
incorrectLetters=differentLetters(decodedVectors,initialVectors);
percentIncorrectLetters = 100*incorrectLetters/length(initialVectors);
redundancy = 100*(height(codedVectors)*width(codedVectors))/(height(decodedVectors)*width(decodedVectors));
%
Test(1000+j+10*(i-1),1:8) = [2,1,err,ber,berPercent,incorrectLetters,percentIncorrectLetters,redundancy];
j=j+1;
end
i=i+1;
end
%/////////////////////////////////////////////////////////////////////////////////////////////
%/////////////////////////////////////////////////////////////////////////////////////////////
err=0.5;
i=1;
disp('15 11')
while i<100
%Triple code
disp(i)
j=1;
err=err-0.005;
while j<=10

codedVectors = logical(binaryToHamming(initialVectors,15,11));
sentData = bsc(codedVectors, err);
decodedVectors = logical(hammingToBinary(sentData,15,11));
decodedVectors = decodedVectors(1:length(initialVectors),:);
[ber, berPercent] = biterr(initialVectors, decodedVectors);
incorrectLetters=differentLetters(decodedVectors,initialVectors);
percentIncorrectLetters = 100*incorrectLetters/length(initialVectors);
redundancy = 100*(height(codedVectors)*width(codedVectors))/(height(decodedVectors)*width(decodedVectors));
%
Test(2000+j+10*(i-1),1:8) = [3,1,err,ber,berPercent,incorrectLetters,percentIncorrectLetters,redundancy];
j=j+1;
end
i=i+1;
end
%/////////////////////////////////////////////////////////////////////////////////////////////
err=0.5;
i=1;
disp('31 26')
while i<100
%Triple code
disp(i)
j=1;
err=err-0.005;
while j<=10

codedVectors = logical(binaryToHamming(initialVectors,31,26));
sentData = bsc(codedVectors, err);
decodedVectors = logical(hammingToBinary(sentData,31,26));
decodedVectors = decodedVectors(1:length(initialVectors),:);
[ber, berPercent] = biterr(initialVectors, decodedVectors);
incorrectLetters=differentLetters(decodedVectors,initialVectors);
percentIncorrectLetters = 100*incorrectLetters/length(initialVectors);
redundancy = 100*(height(codedVectors)*width(codedVectors))/(height(decodedVectors)*width(decodedVectors));
%
Test(3000+j+10*(i-1),1:8) = [4,1,err,ber,berPercent,incorrectLetters,percentIncorrectLetters,redundancy];
j=j+1;
end
i=i+1;
end
%/////////////////////////////////////////////////////////////////////////////////////////////
%/////////////////////////////////////////////////////////////////////////////////////////////
err=0.5;
i=1;
disp('63 57')
while i<100
%Triple code
disp( i)
j=1;
err=err-0.005;
while j<=10

codedVectors = logical(binaryToHamming(initialVectors,63,57));
sentData = bsc(codedVectors, err);
decodedVectors = logical(hammingToBinary(sentData,63,57));
decodedVectors = decodedVectors(1:length(initialVectors),:);
[ber, berPercent] = biterr(initialVectors, decodedVectors);
incorrectLetters=differentLetters(decodedVectors,initialVectors);
percentIncorrectLetters = 100*incorrectLetters/length(initialVectors);
redundancy = 100*(height(codedVectors)*width(codedVectors))/(height(decodedVectors)*width(decodedVectors));
%
Test(4000+j+10*(i-1),1:8) = [5,1,err,ber,berPercent,incorrectLetters,percentIncorrectLetters,redundancy];
j=j+1;
end
i=i+1;
end
%/////////////////////////////////////////////////////////////////////////////////////////////
%/////////////////////////////////////////////////////////////////////////////////////////////
err=0.5;
i=1;
disp('127 120')
while i<100
%Triple code
disp( i)
j=1;
err=err-0.005;
while j<=10

codedVectors = logical(binaryToHamming(initialVectors,127,120));
sentData = bsc(codedVectors, err);
decodedVectors = logical(hammingToBinary(sentData,127,120));
decodedVectors = decodedVectors(1:length(initialVectors),:);
[ber, berPercent] = biterr(initialVectors, decodedVectors);
incorrectLetters=differentLetters(decodedVectors,initialVectors);
percentIncorrectLetters = 100*incorrectLetters/length(initialVectors);
redundancy = 100*(height(codedVectors)*width(codedVectors))/(height(decodedVectors)*width(decodedVectors));
%
Test(5000+j+10*(i-1),1:8) = [6,1,err,ber,berPercent,incorrectLetters,percentIncorrectLetters,redundancy];
j=j+1;
end
i=i+1;
end
%/////////////////////////////////////////////////////////////////////////////////////////////
%/////////////////////////////////////////////////////////////////////////////////////////////
err=0.5;
i=1;
disp('255 247')
while i<100
%Triple code
disp(i)
j=1;
err=err-0.005;
while j<=10

codedVectors = logical(binaryToHamming(initialVectors,255,247));
sentData = bsc(codedVectors, err);
decodedVectors = logical(hammingToBinary(sentData,255,247));
decodedVectors = decodedVectors(1:length(initialVectors),:);
[ber, berPercent] = biterr(initialVectors, decodedVectors);
incorrectLetters=differentLetters(decodedVectors,initialVectors);
percentIncorrectLetters = 100*incorrectLetters/length(initialVectors);
redundancy = 100*(height(codedVectors)*width(codedVectors))/(height(decodedVectors)*width(decodedVectors));
%
Test(6000+j+10*(i-1),1:8) = [7,1,err,ber,berPercent,incorrectLetters,percentIncorrectLetters,redundancy];
j=j+1;
end
i=i+1;
end
%/////////////////////////////////////////////////////////////////////////////////////////////
%/////////////////////////////////////////////////////////////////////////////////////////////
err=0.5;
i=1;
disp('511 502')
while i<100
%Triple code
disp( i)
j=1;
err=err-0.005;
while j<=10

codedVectors = logical(binaryToHamming(initialVectors,511,502));
sentData = bsc(codedVectors, err);
decodedVectors = logical(hammingToBinary(sentData,511,502));
decodedVectors = decodedVectors(1:length(initialVectors),:);
[ber, berPercent] = biterr(initialVectors, decodedVectors);
incorrectLetters=differentLetters(decodedVectors,initialVectors);
percentIncorrectLetters = 100*incorrectLetters/length(initialVectors);
redundancy = 100*(height(codedVectors)*width(codedVectors))/(height(decodedVectors)*width(decodedVectors));
%
Test(7000+j+10*(i-1),1:8) = [8,1,err,ber,berPercent,incorrectLetters,percentIncorrectLetters,redundancy];
j=j+1;
end
i=i+1;
end
%/////////////////////////////////////////////////////////////////////////////////////////////

end
