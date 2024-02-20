load("peaks\similarity_matrix.mat", 'similarity_matrix');

% 1. redak je 1. uzorak testiran na sve ostale uzorke
figure(1);
image(similarity_matrix, "CDataMapping","scaled");
colorbar;

% predviđanje 3 najveca broja u svakom retku
similarity_matrix_predict = zeros(size(similarity_matrix));

for i = 1:size(similarity_matrix, 1)
    najveci_brojevi = maxk(similarity_matrix(i, :), 2);
    % Postavljanje tri najveća broja na 1 u rezultatnoj matrici
    
    similarity_matrix_predict(i, :) = ismember(similarity_matrix(i, :), najveci_brojevi);

end
for i = 1:15
    similarity_matrix_predict(i, i) = 0.1;
    for l = 1:15
        if mod(i,3) == 1
            for j = 0 : 2
                for k = 0:2
                    if similarity_matrix_predict(i+j, i+k) == 0
                        similarity_matrix_predict(i+j, i+k) = 0.1;
                    end
                end
            end
        end
    end
end

figure(2);
imagesc(similarity_matrix_predict);
colorbar;
