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
userChoice = input("Wybierz sposób kodowania danych\n [1] Kod potrojeniowy\n Twój wybór: ");

if userChoice == 1 
    coding = codes.TripleCode;
    codedVectors = logical(binaryToTriple(initialVectors));
else
    return
end


%Przesyłanie przez kanał transmisyjny (binarny kanał symetryczny [BSC])
sentData = bsc(codedVectors, 0.01);
[errorNumber, errorPercentage] = biterr(codedVectors, sentData);


%Dekodowanie
if coding == codes.TripleCode
    decodedVectors = logical(tripleToBinary(sentData))
end

ber = biterr(initialVectors, decodedVectors);

%wyświetlenie zdekodowanej wiadomości i parametrów przesyłu wiadomości
