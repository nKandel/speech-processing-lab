[speechSignal,Fs,nbits] = wavread('hello_narayan.wav');
% Three speech segments, of different length.
ss1 = speechSignal(11000:11500); 
ss2 = speechSignal(11000:11600); 
ss3 = speechSignal(11000:11700); 
% Calculation of the short time autocorrelation 
[ac1, lags1] = xcorr(ss1);
[ac2, lags2] = xcorr(ss2); 
[ac3, lags3] = xcorr(ss3);
subplot(3,1,1);
plot(lags1, ac1);
legend('Window Length: 501 Samples')
title('Short-Time Autocorrelation Function')
grid on;
subplot(3,1,2);
plot(lags2, ac2);
xlim([lags1(1) lags1(end)]);
legend('Window Length: 601 Samples')
grid on;
subplot(3,1,3);
plot(lags3, ac3);
xlim([lags1(1) lags1(end)]);
legend('Window Length: 701 Samples')
xlabel('Lag in samples')
grid on;