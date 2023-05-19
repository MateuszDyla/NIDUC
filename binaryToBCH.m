function codedVectors = binaryToBCH(binaryVectors,n,k) % n- dlugosc slowa kodowego, m - stopien rozszerzenia ciala Galois
%UNTITLED Summary of this function goes here
 % Detailed explanation goes here

r=k-8;
 %k dlugosc wiadomosci

[ySize, xSize] = size(binaryVectors);

zeroColumn = zeros(ySize, 1);
for i=1:r  
    binaryVectors=[binaryVectors,zeroColumn];
end
newmatrix=binaryVectors';
enc = comm.BCHEncoder(n,k);
msg=gf(newmatrix);

[y,x]=size(newmatrix);
for i=1:x
    newmatrix2(:,i)=enc(newmatrix(:,i));
end

codedVectors=newmatrix2';


end