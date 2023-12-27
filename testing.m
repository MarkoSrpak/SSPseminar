[x, fs] = read_sound("recordings/fabric.wav");
%soundsc(rec, fs);

Rxx = akf(x);
Sxx = sgs(Rxx);

figure(1);
subplot(2, 1, 1);
plot(Rxx);
subplot(2, 1, 2);
plot(Sxx);