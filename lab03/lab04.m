clear;clc;clf;
Fs=4000; %//sampling frequency
f=200;  %//frequency of the sine wave
zero=zeros(1,1000);
t=1/Fs:1/Fs:.03;
y1=sin(2*3.1416*f*t);
subplot(3,2,1);
t=t*1000;
plot(t,y1);
%xtitle('200 Hz Synthetic sine wave of 30 ms duration','time in ms');
y1 = [zero y1 zero];
dfty=abs(fft(y1));
dfty=dfty(1:(length(dfty)/2));
dftylog=10*log(dfty);
ff=linspace(1/Fs,Fs/2000,length(dfty));  
subplot(3,2,3);
plot(ff,dfty);
%xtitle('Linear Magnitude Spectrum','frequency in KHz');
subplot(3,2,5);
plot(ff,dftylog);
%xtitle('Log Magnitude Spectrum','frequency in KHz');

t=1/Fs:1/Fs:.25;
y2=sin(2*3.1416*f*t);
t=t*1000;
subplot(3,2,2);
plot(t,y2);
%xtitle('200 Hz Synthetic sine wave of 250 ms duration','time in ms');
dfty=abs(fft(y2));
dfty=dfty(1:(length(dfty)/2));
dftylog=10*log(dfty);
ff=linspace(1/Fs,Fs/2000,length(dfty));  
subplot(3,2,4);
plot(ff,dfty);
%xtitle('Linear Magnitude Spectrum','frequency in KHz');
subplot(3,2,6);
plot(ff,dftylog);
%xtitle('Log Magnitude Spectrum','frequency in KHz');