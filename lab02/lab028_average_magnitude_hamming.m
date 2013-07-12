[speechSignal,Fs,nbits] = wavread('hello_narayan.wav');
% Average magnitude is calculated every period samples. 
period = 50;
% 4 different window lengths
winLens = [161 321 401 901];
nWindows = length(winLens);
t = [0:length(speechSignal)-1]/Fs;
k = 0;
for iWinLen = winLens
k = k+1;
wHamm = hamming(iWinLen);
[sigFramed, lastFrame] = buffer(speechSignal, iWinLen, iWinLen - period,'nodelay');
sigAbsWindowed = diag(sparse(wHamm)) * abs(sigFramed);
iSTAmagnitude = sum(sigAbsWindowed, 1);
% Display results
subplot(nWindows, 1, k);
delay = (iWinLen - 1)/2;
plot(t(delay+1:period:end - delay), iSTAmagnitude);
if (k==1)
title('Short-Time Average Magnitude for various Hamming window lengths')
end
if (k==4)
xlabel('Time (sec)')
end 
legend(['Window length:',num2str(iWinLen),' Samples'])
end