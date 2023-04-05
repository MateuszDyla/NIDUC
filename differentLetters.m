function differentLetters = Letters(decodedVectors,initialVectors)
i = 1;
size = length(decodedVectors);
counter =0;
while i <= size
if initialVectors(i,:)==decodedVectors(i,:)
    counter=counter+1;
end
i=i+1;
end

differentLetters=size-counter;
end

