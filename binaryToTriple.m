function codedVectors = binaryToTriple(binaryVectors)
%BINARYTOTRIPLE Summary of this function goes here
%   Detailed explanation goes here

codedVectors = []
for vector = binaryVectors
    codedVector = repmat(vector, 1, 3);
    codedVectors = [codedVectors, codedVector]
end

