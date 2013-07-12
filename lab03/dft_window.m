function [c] = dft_window(window_type, i)
Fs=8000;j=i+3;k=i+6;ii=i;
y=window(window_type, 240);
zero=zeros(1,1000);
y1=[y zero];
dfty=abs(fft(y1));
dfty=dfty(1:(length(dfty)/2));
for i=1:length(dfty)
  if(dfty(i) == 0)
    dfty(i)=0.001;
  end
end
dftylog=10*log(dfty);
c=dftylog;
t=((1/(1000*Fs):1/Fs:(length(y)/Fs)))*1000;
subplot(3,3,ii);plot(t,y);
xtitle(window_type);
f=linspace(1/Fs,Fs/2000,length(dfty));  
subplot(3,3,j);plot(f,dfty);
xtitle('Linear magnitude spectrum');
subplot(3,3,k);plot(f,dftylog);
xtitle('Log magnitude spectrum');
end