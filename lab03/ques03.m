[yy,Fs,bits] = wavread('hello_narayan_voiced.wav');
max_value = max(abs(yy));
y1 = yy(1:ceil(.1*Fs)); 
y = y1/max_value;
t = ((1/(1000*Fs):1/Fs:(length(y)/Fs)))*1000;
subplot(3,2,1);
plot(t,y);
title('Voiced segment of speech 100ms duration');
 
window_type = 'hamming';
dfty = stft_winType(y, Fs, window_type);
f = linspace(1/Fs,Fs/2000,length(dfty));  
subplot(3,2,2);
plot(f,dfty);
title('Log magnitude spectrum');
 
y1 = yy(1:.2*Fs);
y = y1/max_value;
t = ((1/(1000*Fs):1/Fs:(length(y)/Fs)))*1000;
subplot(3,2,3);
plot(t,y);
title('Voiced segment of speech 200ms duration');
 
window_type = 'hamming';
dfty = stft_winType(y, Fs, window_type);
f = linspace(1/Fs,Fs/2000,length(dfty));  
subplot(3,2,4);
plot(f,dfty);
title('Log magnitude spectrum');
 
 
y1 = yy(1:.3*Fs);
no_zeros = length(y)-length(y1);
zero = zeros(1,no_zeros);
%y = [y1 zero];
y = y1/max_value;
t = ((1/(1000*Fs):1/Fs:(length(y)/Fs)))*1000;
subplot(3,2,5);
plot(t,y);
title('Voiced segment of speech 300ms duration');
 
window_type = 'hamming';
dfty = stft_winType(y, Fs, window_type);
f = linspace(1/Fs,Fs/2000,length(dfty));  
subplot(3,2,6);
plot(f,dfty);
title('Log magnitude spectrum');
