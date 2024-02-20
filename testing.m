[x, fs] = read_sound("sounds/steel1.wav");
%soundsc(rec, fs);


X = fft(x);

Rxx = akf(x);
Sxx = sgs(Rxx);

Sxx = Sxx ./ max(Sxx);

Sxx2 = pspectrum(x, fs, "power");

Sxx2 = Sxx2 ./ max(Sxx2);
%%
figure();
subplot(4, 1, 1);
t = linspace(0, 4, 176399);
plot(t, x);
xlabel("t[s]");
ylabel("x(t)");
title("Početni signal");
subplot(4, 1, 2);
t = linspace(0, pi, round(length(X)/2));
plot(t, abs(X(1:round(length(X)/2))));
xlabel("\Omega[0 - \pi]");
ylabel("A(X(\Omega))");
title("Diskretna Fourierova transformacija");
subplot(4, 1, 3);
t = linspace(0, fs/2, length(Sxx)/2 + 1);
plot(t, Sxx(length(Sxx)/2 : length(Sxx)));
xlabel("\omega");
ylabel("Sxx(\omega)");
title("Spektar snage (izračunat ručno)");
subplot(4, 1, 4);
t = linspace(0, fs/2, length(Sxx2));
plot(t, Sxx2);
xlabel("\omega");
ylabel("Sxx(\omega)");
title("Spektar snage (izračunat funkcijom spectrum())");