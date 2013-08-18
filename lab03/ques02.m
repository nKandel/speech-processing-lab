figure(1)
%input for the voiced speech extracted from praat
[y,Fs,bits] = wavread('hello_narayan_voiced.wav'); 
max_value = max(abs(y));
y = y/max_value;
t = 1/Fs:1/Fs:(length(y)/Fs);
subplot(3,1,1);
plot(t,y);
title('Voiced Speech: /hello narayan/');
xlabel('time in seconds');
 
window_type = 'rectwin';
dfty = stft_winType(y, Fs, window_type);
t = linspace(1/Fs,Fs/2000,length(dfty));  
subplot(3,1,2);
plot(t,dfty);
title('Log magnitude spectrum of voiced speech using Rectangular window');
 
window_type = 'hamming';
dfty = stft_winType(y, Fs, window_type);
t = linspace(1/Fs,Fs/2000,length(dfty));  
subplot(3,1,3);
plot(t,dfty);
title('Log magnitude spectrum of voiced speech using Hamming window');
 
figure(2)
%input for the unvoiced speech extracted from praat
[y,Fs,bits]=wavread('hello_narayan_unvoiced.wav');
max_value = max(abs(y));
y = y/max_value;
t = 1/Fs:1/Fs:(length(y)/Fs);
subplot(3,1,1);
plot(t,y);
title('Unvoiced Speech: /hello narayan/');
xlabel('time in seconds');
 
window_type = 'rectwin';
dfty = stft_winType(y, Fs, window_type);
t = linspace(1/Fs,Fs/2000,length(dfty));  
subplot(3,1,2);
plot(t,dfty);
title('Log magnitude spectrum of unvoiced speech using Rectangular window');
 
window_type = 'hamming';
dfty = stft_winType(y, Fs, window_type);
t = linspace(1/Fs,Fs/2000,length(dfty));  
subplot(3,1,3);
plot(t,dfty);
title('Log magnitude spectrum of unvoiced speech using Hamming window');


