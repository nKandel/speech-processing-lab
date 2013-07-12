[speechSignal,Fs] = wavread('hello_narayan.wav'); 
  
winLen = 301; 
winOverlap = 300; 
wHamm = hamming(winLen); 
  
%Average Magnitude calculation 
[sigFramed, lastFrame] = buffer(speechSignal, winLen, winOverlap,'nodelay'); 
sigAbsWindowed = diag(sparse(wHamm)) * abs(sigFramed); 
magnitudeAv = sum(sigAbsWindowed, 1); 
  
%Short time energy calculation 
sigWindowed = diag(sparse(wHamm)) * sigFramed;  
energyST = sum(sigWindowed.^2,1);  
  
t = [0:length(speechSignal)-1]/Fs; 
plot(t, speechSignal/max(abs(speechSignal))); 
title('speech: /hello narayan/'); hold on; 
  
delay = (winLen - 1)/2; plot(t(delay+1:end-delay), magnitudeAv/max(magnitudeAv), 'r'); 
plot(t(delay+1:end - delay), energyST/max(abs(energyST)), 'k');  
legend('Speech','Average Magnitude','STE'); 
xlabel('Time (sec)');  
