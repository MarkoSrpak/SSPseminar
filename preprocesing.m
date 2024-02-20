materijali = {'wood', 'steel', 'ceramic', 'plastic', 'pluto'};
N = 3;
th = 0.2;
nPeaks = 20;
[x_silence, fs] = read_sound("sounds/silence.wav");
Sxx_silence = pspectrum(x_silence, fs, "power");
Sxx_silence = Sxx_silence ./ max(Sxx_silence);

for i = 1:length(materijali)
    materijal = materijali{i};
    for j = 1 : N
        % sound reading
        ime_datoteke{j} = ['sounds/' materijal num2str(j, '%d') '.wav'];
        [x, fs] = read_sound(ime_datoteke{j});
        % calculate spectrum and remove silence
        Sxx = pspectrum(x, fs, "power");
        Sxx = Sxx .* (1-Sxx_silence);
        Sxx = Sxx ./ max(Sxx);
        % find peaks
        [test_peaks, test_locs] = findpeaks(Sxx, 'MinPeakHeight', th, 'SortStr','descend', 'NPeaks', nPeaks);
        % save peaks for future use
        save(['peaks/' materijal num2str(j, '%d') '.mat'], 'test_peaks', 'test_locs');
        % graph peaks
        if i == 5 && (j == 1 || j == 2)
            %figure()
            %subplot(2, 1, j);
            %t = linspace(0, fs/2, length(Sxx));
            %plot(t, Sxx);
            %plot(Sxx);
            %title("Spektar snage s istaknutim ekstremima");
            %xlabel("\omega");
            %ylabel("Sxx(\omega)");
            %hold on;
            %stem(test_locs * fs/2 / length(Sxx), test_peaks);
            %stem(test_locs, test_peaks);
            %hold off;
        end
    end
end




