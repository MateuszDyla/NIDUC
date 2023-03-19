function decodedVectors = tripleToBinary(sentVectors)
%TRIPLETOBINARY Summary of this function goes here
%   Detailed explanation goes here
    decodedVectors = [];
    for vector = sentVectors.'
        newVector = [];

        i = 1;
        while i <= length(vector)
            highBits = sum(vector(i:i+2));

            if(highBits) >=2
                bit = 1;
            else
                bit = 0;
            end
            newVector = [newVector, bit];
            i=i+3;
        end
        decodedVectors = [decodedVectors; newVector];
    end
    
end

