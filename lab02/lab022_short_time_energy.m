% A sentence stored in SPHERE format is read. The sentence is :
% 'He took me by surprise'. A function of voicebox is used.
%speechSignal = readsph(fullfile('E:\IOE\test\Speech processing\speech lab 2\','speechlab.wav')); %---------------------------
[speechSignal,fs,nbits]=wavread('hello_narayan.wav');
% A hamming window is chosen
winLen = 301; 
winOverlap = 300; 
wHamm = hamming(winLen); 
% Framing and windowing the signal without for loops.
sigFramed = buffer(speechSignal, winLen, winOverlap, 'nodelay'); 
sigWindowed = diag(sparse(wHamm)) * sigFramed; 
% Short-Time Energy calculation
energyST = sum(sigWindowed.^2,1); 
% Time in seconds, for the graphs
t = [0:length(speechSignal)-1]/fs; 
subplot(1,1,1); 
plot(t, speechSignal); 
title('speech: hello narayan'); 
xlims = get(gca,'Xlim');
hold on; 
% Short-Time energy is delayed due to lowpass filtering. This delay is
% compensated for the graph.
delay = (winLen - 1)/2; 
plot(t(delay+1:end - delay), energyST, 'r'); 
xlim(xlims); 
xlabel('Time (sec)'); 
legend({'Speech','Short-Time Energy'}); 
hold off; 