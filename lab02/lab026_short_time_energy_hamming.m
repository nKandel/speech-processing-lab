[speechSignal,Fs,nbits] = wavread('hello_narayan.wav');
% Energy is calculated every period samples. 
period = 50;
% 4 different window lengths
winLens = [161 321 401 901];
nWindows = length(winLens);
t = [0:length(speechSignal)-1]/Fs;
k = 0;
for iWinLen = winLens
	k = k+1;
	wHamm = hamming(iWinLen);
% Framing the signal without for loops
	[sigFramed, lastFrame] = buffer(speechSignal, iWinLen, iWinLen - period, 'nodelay');
	sigWindowed = diag(sparse(wHamm)) * sigFramed;
	ienergyST = sum(sigWindowed.^2,1);
% Display results
	subplot(nWindows, 1, k);
	delay = (iWinLen - 1)/2;
	plot(t(delay+1:period:end - delay), ienergyST);
	if (k==1)
		title('Short-Time Energy for various Hamming window lengths')
	end
	if (k==4)
		xlabel('Time (sec)')
	end
	legend(['Window length:',num2str(iWinLen),' Samples'])
end