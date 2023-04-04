function  decodedVectors= hammingToBinary(sentVectors,n,k)
decoded = decode(sentVectors,n,k,'hamming/binary');
decodedVectors=zeros(floor(length(decoded)/8),8);
i=1;
j=1;
while j<=floor(length(decoded)/8)
    decodedVectors(j,:)=decoded(i:i+7);
    i=i+8;
    j=j+1;
end
end