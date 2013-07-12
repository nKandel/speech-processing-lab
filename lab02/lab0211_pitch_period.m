[speechSignal,fs] = wavread('hello_narayan.wav');
%For voiced speech
ss1 = speechSignal(10500:11500); 
[ac1, lags1] = xcorr(ss1,'coeff'); 
%search for the maximum in correlation coefficients
[Max_val,kp] = max(ac1(floor(length(ac1)/2):end));
T0 = kp/fs*1000;
fprintf('Estimated Pitch period over the voiced region: %f ms\n',T0);