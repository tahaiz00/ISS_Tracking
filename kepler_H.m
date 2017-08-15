% ������������������������������������������������������������
function F = kepler_H(e, M)
% ~~~~~~~~~~~~~~~~~~~~~~~~~
%
% Bu i�lev, Kepler'in ��z�m�nde Newton'un y�ntemini kullan�r
%Hiperbola ait denklem e * sinh (F) - F = M i�in
%Hiperbolik eksantrik anomali, ekzantriklik ve
% Hiperbolik ortalama anomali.
%
% F - hiperbolik eksantrik anomali (radyan)
% E - d��merkezlik, �a�r� program�ndan ge�ti.
% M - hiperbolik ortalama anomali (radyan),
%Arama program�%
%
% Kullan�c� M-fonksiyonlar� gereklidir: yok
% ------------------------------------------------- -----------
% ... Hata tolerans�n� ayarlay�n:

error = 1.e-8;
% ... F i�in ba�lang�� de�eri:
F = M;

% ... hata tolerans�:
ratio = 1;
while abs(ratio) > error
ratio = (e*sinh(F) - F - M)/(e*cosh(F) - 1);
F = F - ratio;
end
% ������������������������������������������������������������