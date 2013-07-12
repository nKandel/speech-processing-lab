[speechSignal,fs,nbits]=wavread('hello_narayan.wav');
% Voiced speech segment.
ss1 = speechSignal(10500:11500);
% An unvoiced speech segment.
ss2 = speechSignal(16500:18500); 
% Calculation of the short time autocorrelation
[ac1, lags1] = xcorr(ss1); 
[ac2, lags2] = xcorr(ss2); 
subplot(2,2,1); 
plot(ss1); 
legend('Voiced Speech') 
subplot(2,2,2); 
plot(lags1, ac1); 
xlim([lags1(1) lags1(end)]); 
legend('Autocorrelation of Voiced Speech') 
grid on; 
subplot(2,2,3); 
plot(ss2); 
legend('Unvoiced Speech') 
subplot(2,2,4); 
plot(lags2, ac2); 
xlim([lags1(1) lags1(end)]); 
legend('Autocorrelation of Unvoiced Speech') 
grid on;