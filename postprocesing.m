materijali = {'wood', 'steel', 'ceramic', 'plastic', 'pluto'};
N = 3;
odstupanje = 10;

% resulting matrix
confusion_matrix = zeros(length(materijali)*N, length(materijali)*N);

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
        th = 0.1;
        nPeaks = 20;
        [peaks, locs] = findpeaks(Sxx, 'MinPeakHeight', th, 'SortStr','descend', 'NPeaks', nPeaks);
        
        % test for likelines against every other measurement
        for test_i = 1:length(materijali)
            test_materijal = materijali{test_i};
            for test_j = 1 : N
                load(['peaks/' test_materijal num2str(test_j, '%d') '.mat']);
                % imamo peaks na mjestima locs
                % uspoređujemo s test_peaks na mjestima test_locs
                estimate = 0;
                similarity = 0;
                for l = 1 : length(locs)
                    postoji = any(ismember(locs(l)-odstupanje : locs(l) + odstupanje, test_locs));
                    if postoji
                        index = find(abs(test_locs - locs(l)) <= odstupanje);
                        index = index(abs(test_locs(index) - locs(l)) == min(abs(test_locs(index) - locs(l))));
                        index = index(1);
                        similarity = test_peaks(index) / peaks(l);
                        if similarity > 1
                            similarity = 1 / similarity;
                        end
                        estimate = estimate + (1/length(locs)) * similarity;
                    else
                        estimate = estimate;
                    end
                end
                confusion_matrix((i-1)*N+j, (test_i-1)*N+test_j) = estimate;
            end
        end
    end
end
imagesc(confusion_matrix);
