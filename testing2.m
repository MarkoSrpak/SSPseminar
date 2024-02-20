[x, fs] = read_sound("sounds/steel1.wav");
%soundsc(rec, fs);

X = fft(x);
Sxx = pspectrum(x, fs, "power");

Sxx = Sxx ./ max(Sxx);

figure();
subplot(2, 1, 1);
plot(abs(X));
subplot(2, 1, 2);
plot(Sxx);