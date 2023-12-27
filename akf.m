function Rxx = akf(x)
%AKF Calculates Rxx(tau) for given x(n). Vremenska autokorelacijska
%funkcija
%   Uses formula Rxx(tau) = 1/M * sum(x(n)*x(n+tau))
%   Ocekuje se da je x[n] kauzalna funkcija, pocinje s n=0, do n=stup-1
%   indeksi su u stvarnosti 1 do stup
%   Indeksi izlaza su u stvarnosti od 1 do stup

[red, stup] = size(x);
assert (red == 1, 'Matrica mora biti niz (1D)');

R = zeros(1, stup);

for i=1:stup
    for j=1:stup
        if(j-i+1 > 0)
            R(i) =  R(i) + x(j).*x(j-i+1);
        end
    end
end
Rxx = R/stup;
end

