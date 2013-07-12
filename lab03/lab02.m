clear;clc;clf;
[y,Fs,bits]=wavread('hello_narayan');%//input: voiced speech segment
max_value=max(abs(y));
y=y/max_value;
y=y(1:(Fs*.035));
t=1/Fs:1/Fs:(length(y)/Fs);
subplot(3,3,1);
plot(t,y);
%xtitle('Voiced Speech waveform','time in seconds');

dfty=abs(fft(y));
dfty=dfty(1:(length(dfty)/2));
tt=linspace(1/Fs,Fs/2,length(dfty));
subplot(3,3,4);plot(tt,dfty);
%xtitle('Linear Magnitude Spectrum','frequency in Hz');

dftylog=10*log10(dfty);
subplot(3,3,7);plot(tt,dftylog);
%xtitle('Log Magnitude Spectrum','frequency in Hz');

[y,Fs,bits]=wavread('hello_narayan');%//input: unvoiced speech segment
max_value=max(abs(y));
y=y/max_value;
y=y(1:(Fs*.035));

t=1/Fs:1/Fs:(length(y)/Fs);
subplot(3,3,2);plot(t,y);
%xtitle('Unvoiced Speech waveform','time in seconds');

dfty=abs(fft(y));
dfty=dfty(1:(length(dfty)/2));
tt=linspace(1/Fs,Fs/2,length(dfty));
subplot(3,3,5);plot(tt,dfty);
%xtitle('Linear Magnitude Spectrum','frequency in Hz');
dftylog=10*log10(dfty);
subplot(3,3,8);plot(tt,dftylog);
%xtitle('Log Magnitude Spectrum','frequency in Hz');

[y,Fs,bits]=wavread('hello_narayan');%//input: silence segment
max_value=max(abs(y));
y=y/max_value;
y=y(1:(Fs*.035));

t=1/Fs:1/Fs:(length(y)/Fs);
subplot(3,3,3);plot(t,y);
%xtitle('Silence waveform','time in seconds');

dfty=abs(fft(y));
dfty=dfty(1:(length(dfty)/2));
tt=linspace(1/Fs,Fs/2,length(dfty));
subplot(3,3,6);plot(tt,dfty);
%xtitle('Linear Magnitude Spectrum','frequency in Hz');
dftylog=10*log10(dfty);
subplot(3,3,9);plot(tt,dftylog);
%xtitle('Log Magnitude Spectrum','frequency in Hz');