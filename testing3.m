[x, fs] = read_sound("sounds/steel1.wav");
[x_silence, fs] = read_sound("sounds/silence.wav");
%soundsc(rec, fs);

Sxx = pspectrum(x, fs, "power");
Sxx_silence = pspectrum(x_silence, fs, "power");

Sxx_silence = Sxx_silence ./ max(Sxx_silence);

figure();
subplot(4, 1, 1);
t = linspace(0, 4, 176399);
plot(t, x_silence);
xlabel("t[s]");
ylabel("x(t)");
title("Signal tihe snimke");
subplot(4, 1, 2);
t = linspace(0, fs/2, length(Sxx_silence));
plot(t, abs(Sxx_silence));
xlabel("\omega");
ylabel("Sxx_s_i_l_e_n_c_e(\omega)");
title("Spektar snage tihe snimke");
subplot(4, 1, 3);
t = linspace(0, fs/2, length(Sxx));
plot(t, Sxx);
xlabel("\omega");
ylabel("Sxx(\omega)");
title("Spektar snage signala");
subplot(4, 1, 4);
Sxx = Sxx .* (1-Sxx_silence);
Sxx = Sxx ./ max(Sxx);
t = linspace(0, fs/2, length(Sxx));
plot(t, Sxx);
xlabel("\omega");
ylabel("Sxx(\omega)");
title("Spektar snage signala s uklonjenom tišinom");
