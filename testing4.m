[x, fs] = read_sound("sounds/steel2.wav");
[x_silence, fs] = read_sound("sounds/silence.wav");
%soundsc(rec, fs);

Sxx = pspectrum(x, fs, "power");
Sxx_silence = pspectrum(x_silence, fs, "power");


Sxx_silence = Sxx_silence ./ max(Sxx_silence);
Sxx = Sxx .* (1-Sxx_silence);
Sxx = Sxx ./ max(Sxx);
th = 0.1;
nPeaks = 20;
%[peaks, locs] = findpeaks(Sxx, 'NPeaks', nPeaks, 'SortStr','descend');
[peaks, locs] = findpeaks(Sxx, 'MinPeakHeight', th, 'SortStr','descend', 'NPeaks', nPeaks);


figure();
subplot(2, 1, 1);
plot(abs(Sxx));
hold on;
stem(locs, peaks);
subplot(2, 1, 2);