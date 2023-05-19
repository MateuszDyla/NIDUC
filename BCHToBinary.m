function decodedVectors = BCHToBinary(sentVectors,n,k) % n- dlugosc slowa kodowego, m - stopien rozszerzenia ciala Galois
r=k-8;
bchDecoder = comm.BCHDecoder(n, k);
newvectors=sentVectors';
[y,x]=size(newvectors);
for i=1:x
    newmatrix2(:,i)=bchDecoder(newvectors(:,i));
end
    decoded=newmatrix2';
    decodedVectors=decoded(:,1:end-r);

end
