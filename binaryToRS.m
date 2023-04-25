function codedVectors = binaryToRS(binaryVectors,n,m) % n- dlugosc slowa kodowego, m - stopien rozszerzenia ciala Galois
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


k=8; % dlugosc wiadomosci

codedVectors = [];  % inicjujemy macierz wynikową
for i = 1:size(binaryVectors,1)             % iterujemy po wierszach macierzy binaryVectors
   msg= gf(binaryVectors(i,:),m);
   encoded =  rsenc(msg,n,k);
   codedVectors(i,:) =encoded.x;
end

end