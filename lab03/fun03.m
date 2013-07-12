function [c] = fun03(Speech_signal, Fs, Frame_size, Frame_shift, window_type)
y=Speech_signal;
Frame_size=Frame_size/1000;    
Frame_shift=Frame_shift/1000;  
max_value=max(abs(y));
y=y/max_value;
t=1/Fs:1/Fs:(length(y)/Fs);
subplot(2,1,1);
plot(t,y);
%xtitle('Speech signal waveform','time in seconds');
Frame_length = Frame_size*Fs
sample_shift = Frame_shift*Fs
sum1=0;
energy=0;
autocorrelation=0;
%w=window(window_type,Frame_length);
w=window(@hamming,Frame_length);
jj=1;
for i=1:(floor((length(y))/sample_shift)-ceil(Frame_length/sample_shift))
  k=1;yy=0;
  for j=(((i-1)*sample_shift)+1):(((i-1)*sample_shift)+Frame_length)
    yy(k)=y(j)*w(jj);
    jj=jj+1;k=k+1;
  end
  jj=1;
  dfty=abs(fft(yy));
  dfty3d(:,i)=dfty(1:(length(dfty)/2));  
end
c=dfty3d;
%return(c);
end