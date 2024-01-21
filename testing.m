[x, fs] = read_sound("sounds/steel1.wav");
%soundsc(rec, fs);


X = fft(x);

Rxx = akf(x);
Sxx = sgs(Rxx);

Sxx = Sxx ./ max(Sxx);

figure();
subplot(2, 2, 1);
plot(x);
subplot(2, 2, 2);
plot(abs(X));
subplot(2, 2, 3);
plot(Rxx);
subplot(2, 2, 4);
plot(Sxx);