%//function to compute short term fourier transform
[y,Fs,bits]=wavread('hello_narayan.wav');%//input: Speech signal
Frame_size=20;      %//Input: Frame size in millisecond
Frame_shift=10;    %//Input: Frame shift in millisecond
window_type = 'hn';    %//Input: window type-> 'hm' for hamming window, 'hn' for hanning window and 're' for rectangular window
dfty3d=fun03(y, Fs, Frame_size, Frame_shift, window_type);
[rows,cols]=size(dfty3d);
tt=1/Fs:1/Fs:(length(y)/Fs);
kk=linspace(1/Fs,Fs/2000,rows);
kkk=1/Fs:(Frame_shift/1000):(cols*(Frame_shift/1000));
subplot(2,1,2);
surf(kkk,kk,dfty3d);
%xtitle('3D Representation of Short Term Linear Magnitude Spectrum ','Frequency in KHz','time-shift in seconds');