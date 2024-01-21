test = [1 8 16 100];
moj = [1 8 16 110];

odstupanje = 10;
broj = 12;

postoji = any(ismember(broj-odstupanje : broj + odstupanje, test));

index = find(abs(test - broj) <= odstupanje);
index = index(abs(test(index) - broj) == min(abs(test(index) - broj)));
index = index(1);
