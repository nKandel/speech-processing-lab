% Sampling frequency in Hz (for the data used in this exercise)
Fs = 16000; 
%Check the input audio file and properly choose sampling frequency. 
%[s,fs,nbits]=wavread('hello_narayan');
% Rectangular and Hamming window, chosen from the variety of windows
% offered in MATLAB.
wRect = rectwin(51); 
wHamm = hamming(51); 
% Calculate the magnitude of the Fast Fourier Transform of the windows
fftLength = 1024; 
magFWHamm = abs(fft(wHamm, fftLength)); 
magFWRect = abs(fft(wRect, fftLength)); 
subplot(2,1,1); 
plot(linspace(0,0.5,ceil(fftLength/2)), 20*log10(magFWRect(1:ceil(fftLength/2)))); 
ylabel('dB'); 
legend('Rectangular Window'); 
grid on;
subplot(2,1,2); 
plot(linspace(0,0.5,ceil(fftLength/2)), 20*log10(magFWHamm(1:ceil(fftLength/2)))); 
ylabel('dB'); 
xlabel('Normalized Frequency'); 
legend('Hamming Window');
grid on;