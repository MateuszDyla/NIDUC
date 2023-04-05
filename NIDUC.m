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
    coding = codes.Hamming;
    n = input("Hamming(n,k)\n Podaj n: ");      %(7,4), (15,11), (31,26), (63,57), (127,120), (255,247), (511,502)
    k = input("Podaj k: ");
    codedVectors = logical(binaryToHamming(initialVectors,n,k));
else
    return
end


%Przesyłanie przez kanał transmisyjny (binarny kanał symetryczny [BSC])
disp("Przesyłanie")
sentData = bsc(codedVectors, 0.001);
[transmErrors, transmErrorsRatio] = biterr(codedVectors, sentData);


%Dekodowanie
disp("Dekodowanie")
if coding == codes.TripleCode
    decodedVectors = logical(tripleToBinary(sentData));
elseif coding == codes.Hamming
    decodedVectors = logical(hammingToBinary(sentData,n,k));
    decodedVectors = decodedVectors(1:length(initialVectors),:);
end

[ber, berPercent] = biterr(initialVectors, decodedVectors);
tStop = toc;
incorrectLetters=differentLetters(decodedVectors,initialVectors);
percentIncorrectLetters = incorrectLetters/length(initialVectors);
%wyświetlenie zdekodowanej wiadomości i parametrów przesyłu wiadomości

disp("Wyświetlanie wiadomosci:");
decodedText = binaryToString(decodedVectors);
disp(decodedText);
length(initialVectors);
disp("Statystyki:");
disp("BER: " + ber)
disp("Procentowo: " + berPercent*100 + "%");
disp("Błędne litery: " +incorrectLetters);
disp("Procentowo: " + percentIncorrectLetters*100 + "%");
disp("Czas transmisji: " + tStop + "[s]");
