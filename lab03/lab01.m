[y,Fs,bits]=wavread('hello_narayan.wav');
max_value=max(abs(y));
y=y/max_value;
t=1/Fs:1/Fs:(length(y)/Fs);
subplot(3,1,1);plot(t,y);
%xtitle('Speech signal waveform','time in seconds');
dfty=abs(fft(y));
leny=length(y)
len=length(dfty)
tt=linspace(1/Fs,Fs,length(dfty));
subplot(3,1,2);plot(tt,dfty);
%xtitle('Linear Magnitude Spectrum','frequency in Hz');
dftylog=10*log10(dfty);
subplot(3,1,3);plot(tt,dftylog);
%xtitle('Log Magnitude Spectrum','frequency in Hz');