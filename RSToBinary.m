function decodedVectors = RSToBinary(sentVectors,n,m) % n- dlugosc slowa kodowego, m - stopien rozszerzenia ciala Galois
%RSTOBINARY Summary of this function goes here
%   Detailed explanation goes here

%dlugosc wiadomosci
k=8;

[ySize, xSize] = size(sentVectors);
 decodedVectors = zeros(ySize, k);

for i = 1:size(sentVectors,1) 
    noisycode =gf(sentVectors(i,:),m); %stworzenie ciala Galois z wiersza wartosci z bledami
    decoded  = rsdec(noisycode,n,k); %dekodowanie 
    decodedVectors(i,:) =decoded.x; %zapisanie wartosci jako macierz
end
end
