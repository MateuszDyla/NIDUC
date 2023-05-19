clear;

transmiter = FECTransmitter();
code_param1=0;
code_param2=0;
channel_param1=0;
channel_param2=0;
channel_param3=0;
channel_param4=0;

userChoice = input("W jaki sposób chcesz wczytać dane do transmisji?\n [1] Z konsoli\n [2] Z pliku\nTwój wybór: ");
if userChoice == 1
    data = input("Podaj tekst do transmisji: \n", "s");
elseif userChoice == 2
    file = uigetfile("*.txt", "Wybierz plik");
    data = fileread(file);
else
    disp("\nZły wybór, możliwe opcje to [1], [2]")
end

userChoice = input("Wybierz sposób kodowania danych\n [1] Kod potrojeniowy\n [2] Kod Hamminga\n [3] Kod Reeda-Solomona\n [4] Brak \n Twój wybór: ");
if userChoice == 1 
    coding = transmiter.TripleCode;
elseif userChoice == 2
    coding = transmiter.Hamming
    code_param1 = input("Hamming(n,k) (7,4), (15,11), (31,26), (63,57), (127,120), (255,247), (511,502)\n Podaj n: ");
    code_param2 = input("Podaj k: ");
elseif userChoice == 3
    coding = transmiter.RS;
    code_param1 = input("RS\n Podaj n: ");     
    code_param2 = input("Podaj m: ");
elseif userChoice == 4;
    coding = transmiter.noCode;
else
    return
end


disp("Przesyłanie")
userChoice = input("Wybierz sposób przesyłu danych\n [1] Kanał BSC\n [2] Kanał Gilbera-Elliotta\n Twój wybór: ");

if(userChoice == 1)
    channel_param1 = input("Podaj prawdopodobienstwo przeklamania danych: ");
    channel = transmiter.BSCChannel;
elseif(userChoice == 2)
    channel = transmiter.GilbertElliott;
    channel_param1 = input("Podaj prawdopodobienstwo przeklamania w stanie dobrym: ");
    channel_param2 = input("Podaj prawdopodobienstwo przeklamania w stanie złym: ");
    channel_param3 = input("Podaj prawdopodobienstwo przejscia ze stanu dobrego do zlego: ");
    channel_param4 = input("Podaj prawdopodobienstwo przejscia ze stanu zlego do dobrego: ");
end



transmiter.sendData(data, channel, [channel_param1, channel_param2, channel_param3, channel_param4], coding, [code_param1, code_param2]);
transmiter.displayData();
%transmiter.savedata(plik) - dobre do testowania
