% ˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜
function F = kepler_H(e, M)
% ~~~~~~~~~~~~~~~~~~~~~~~~~
%
% Bu iþlev, Kepler'in çözümünde Newton'un yöntemini kullanýr
%Hiperbola ait denklem e * sinh (F) - F = M için
%Hiperbolik eksantrik anomali, ekzantriklik ve
% Hiperbolik ortalama anomali.
%
% F - hiperbolik eksantrik anomali (radyan)
% E - dýþmerkezlik, çaðrý programýndan geçti.
% M - hiperbolik ortalama anomali (radyan),
%Arama programý%
%
% Kullanýcý M-fonksiyonlarý gereklidir: yok
% ------------------------------------------------- -----------
% ... Hata toleransýný ayarlayýn:

error = 1.e-8;
% ... F için baþlangýç deðeri:
F = M;

% ... hata toleransý:
ratio = 1;
while abs(ratio) > error
ratio = (e*sinh(F) - F - M)/(e*cosh(F) - 1);
F = F - ratio;
end
% ˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜