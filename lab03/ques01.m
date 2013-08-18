[y,Fs,bits]=wavread('hello_narayan.wav');
Frame_size = 20;      %Input: Frame size in millisecond
Frame_shift = 10;    %Input: Frame shift in millisecond
window_type = 'hamming';    
dfty3d = stft(y, Fs, Frame_size, Frame_shift, window_type);
 
[rows,cols] = size(dfty3d);
tt = 1/Fs:1/Fs:(length(y)/Fs);
kk = linspace(1/Fs,Fs/2000,rows);
kkk = 1/Fs:(Frame_shift/1000):(cols*(Frame_shift/1000));
subplot(2,1,2);
surf(kkk,kk,dfty3d);
title('3D plot of Magnitude of STFT');
xlabel('Time in seconds');
ylabel('Frequency in KHz');
 
 
