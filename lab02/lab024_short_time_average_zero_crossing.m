[speechSignal,Fs] = wavread('hello_narayan.wav'); 
winLen = 301;
winOverlap = 300; 
wHamm = hamming(winLen); 
  
sigdif = sign(speechSignal(2:end))-sign(speechSignal(1:end-1)); 
% No change of sign at the beginning 
sigdif = [0; sigdif]; 
[sigdifFramed, lastFrame] = buffer(sigdif, winLen, winOverlap,'nodelay'); 
sigdifWindowed = diag(sparse(wHamm)) * abs(sigdifFramed); 
ZCR = sum(sigdifWindowed, 1) / (2*winLen); 
  
t = [0:length(speechSignal)-1]/Fs; 
subplot(1,1,1); 
plot(t, speechSignal/max(abs(speechSignal))); 
title('speech: /hello narayan/'); 
hold on; 
delay = (winLen - 1)/2; 
%-------------------
plot(t(delay+1:end-delay), ZCR/max(ZCR),'r'); 
xlabel('Time (sec)'); 
legend('Speech','Average Zero Crossing Rate'); 
