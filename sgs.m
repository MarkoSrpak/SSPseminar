function sxx = sgs(rxx)
% SGS - Spektralna gustoca snage slucajnog procesa
% SGS(Rxx) racuna spektralnu gustocu snage slucajnog procesa X iz
% njegove (vremenski usrednjene) autokorelacijske funkcije Rxx(tau).
% Rxx(tau) sadrzi uzorke autokorelacijske funkcije samo za
% nenegativne pomake i dobiva se pomocu funkcije AKF_SA.

%prvo prosiriti rxx simetricno
rxx_len = length(rxx);
rxx_sym = [rxx rxx(rxx_len:-1:2)]; % Napravi simetricni rxx

% Spektar snage se racuna kao dtft od rxx (simetricnog)
sxx = fft(rxx_sym);

MR = max(abs(real(sxx)));
MI = max(abs(imag(sxx)));
if MI*1000 > MR
    warning('Imaginarni dio spektralne gustoce snage je prevelik.');
end
sxx = abs(fftshift(sxx));

end