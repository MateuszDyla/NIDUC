function codeVectors = binaryToHamming(binaryVectors,n,k)

message=binaryVectors';
message=reshape(message,1,[]);
codeVectors = encode(message,n,k,'hamming/binary');
end