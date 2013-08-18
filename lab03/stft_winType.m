function [c] = stft_winType(Speech_signal, Fs, window_type)
    y = Speech_signal; 
    zero = zeros(1,10000);
    w = window(window_type,length(y));
    for i = 1:length(y)
        y(i) = y(i)*w(i);
    end
    %y2 = [zero y zero];
    dfty = abs(fft(y));
    dfty = dfty(1:(length(dfty)/2));
    dfty = 10*log(dfty);
    c = dfty;
end
