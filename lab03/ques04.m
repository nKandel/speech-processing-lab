[y, Fs] = wavread('hello_narayan.wav');
% Long window in time - Narrowband
 t_window_narrowband = .05;      % window - time
t_overlap_narrowband = .001;
window_narrowband = t_window_narrowband*Fs; % window samps
noverlap_narrowband = ceil(t_overlap_narrowband*Fs);
nfft_narrowband = 2248;
 
window = window_narrowband;
noverlap = noverlap_narrowband;
nfft = nfft_narrowband;
 subplot(2,1,1);
specgram(y,nfft,Fs,window,noverlap);
title('Narrowband Spectrogram');
 
% Spectrogram, Wideband, short window in time
t_window_wideband = .005;       % window - time
t_overlap_wideband = .001;
window_wideband = t_window_wideband*Fs; % window samps
noverlap_wideband = ceil(t_overlap_wideband*Fs);
nfft_wideband = 8192;
 
window = window_wideband;
noverlap = noverlap_wideband;
nfft = nfft_wideband;
subplot(2,1,2)
specgram(y,nfft,Fs,window,noverlap);
title('Wideband Spectrogram');
