clear; clc; clf;

Fs=8000;
window_type=@rectwin;i=1;
dfty=dft_window(window_type, i);

window_type=@hamming;i=2;
dfty=dft_window(window_type, i);

window_type=@hann;i=3;
dfty=dft_window(window_type, i);