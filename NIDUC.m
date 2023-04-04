clear;

%import stałych identyfikatorów kodów
codes = Code;


%początek programu, zapytanie o sposób wczytania pliku, wczytanie pliku i
%konwersja każdego znaku tekstu na blok binarny
userChoice = input("W jaki sposób chcesz wczytać dane do transmisji?\n [1] Z konsoli\n [2] Z pliku\nTwój wybór: ");

if userChoice == 1
    data = input("Podaj tekst do transmisji: \n", "s");
elseif userChoice == 2
    file = uigetfile("*.txt", "Wybierz plik");
    data = fileread(file);
else
    disp("\nZły wybór, możliwe opcje to [1], [2]")
end

initialVectors = textToBinary(data);


%Wybór kodowania, kodowanie
tic %start pomiaru czasu

userChoice = input("Wybierz sposób kodowania danych\n [1] Kod potrojeniowy\n [2] Kod Hamminga\n Twój wybór: ");
if userChoice == 1 
    coding = codes.TripleCode;
    codedVectors = logical(binaryToTriple(initialVectors));
elseif userChoice == 2
    coding = codes.Hamming74;
    userChoiceH = input("Wybierz kod Hamminga\n [1] Hamming(7,4)\n [2] Hamming(15,11)\n [3] Hamming(31,26)\n [4] Hamming(63,57)\n [5] Hamming(127,120)\n [6] Hamming(255,247)\n [7] Hamming(511,502)\nTwój wybór: ");
    if userChoiceH == 1
    n=7;
    k=4;
    elseif userChoiceH == 2
    n=15;
    k=11;
    elseif userChoiceH == 3
    n=31;
    k=26;
    elseif userChoiceH == 4
    n=63;
    k=57;
    elseif userChoiceH == 5
    n=127;
    k=120;
    elseif userChoiceH == 6
    n=255;
    k=247;
    elseif userChoiceH == 7
    n=511;
    k=502;
    end
        codedVectors = logical(binaryToHamming(initialVectors,n,k));
    
else
    return
end


%Przesyłanie przez kanał transmisyjny (binarny kanał symetryczny [BSC])
disp("Przesyłanie")
sentData = bsc(codedVectors, 0.05);
[transmErrors, transmErrorsRatio] = biterr(codedVectors, sentData);


%Dekodowanie
disp("Dekodowanie")
if coding == codes.TripleCode
    decodedVectors = logical(tripleToBinary(sentData));
elseif coding == codes.Hamming74
    decodedVectors = logical(hammingToBinary(sentData,n,k));
end

[ber, berPercent] = biterr(initialVectors, decodedVectors);
tStop = toc;

%wyświetlenie zdekodowanej wiadomości i parametrów przesyłu wiadomości

disp("Wyświetlanie wiadomosci:");
decodedText = binaryToString(decodedVectors);
disp(decodedText);

disp("Statystyki:");
disp("BER: " + ber)
disp("Procentowo: " + berPercent*100 + "%");
disp("Czas transmisji: " + tStop + "[s]");
