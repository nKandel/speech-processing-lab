[speechSignal,Fs,nbits] = wavread('hello_narayan.wav');
% ZCR is calculated every period samples. 
period = 50;
% 4 different window lengths
winLens = [161 321 401 901];
nWindows = length(winLens);
t = [0:length(speechSignal)-1]/Fs;
k = 0;
for iWinLen = winLens
k = k+1;
wHamm = hamming(iWinLen);
sigdif = sign(speechSignal(2:end))-sign(speechSignal(1:end-1));
% No change of sign at the beginning
sigdif = [0; sigdif];
[sigdifFramed, lastFrame] = buffer(sigdif, iWinLen, iWinLen - period,'nodelay');
sigdifWindowed = diag(sparse(wHamm)) * abs(sigdifFramed);
iZCR = sum(sigdifWindowed, 1) / (2*iWinLen);
% Display results
subplot(nWindows, 1, k);
delay = (iWinLen - 1)/2;
plot(t(delay+1:period:end - delay), iZCR);
if (k==1)
title('Average Zero-crossing Rate for various Hamming window lengths')
end
if (k==4)
xlabel('Time (sec)')
end
legend(['Window length:',num2str(iWinLen),' Samples'])
end