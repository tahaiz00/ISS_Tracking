function E = kepler_E(e, M)

% Bu i�lev, Kepler'in ��z�m�nde Newton'un y�ntemini kullan�r
%Denklem E - e * sin (E) = E eksantrik anomali i�in M,
%Sapma ve ortalama anomali g�z �n�ne al�nd���nda.
%
% E - eksantrik anomali (radyan)
% E - d��merkezlik, �a�r� program�ndan ge�ti.
% M - ortalama anomali (radyan), �a��ran programdan ge�ti
%Pi 3.1415926 ...
%
% Kullan�c� M-fonksiyonlar� gereklidir: yok
% ------------------------------------------------- -----------
% ... Hata tolerans�n� ayarlay�n:
error = 1.e-8;
% ... E i�in bir ba�lang�� de�eri se�in:
if M < pi
E = M + e/2;
else
E = M - e/2;
end

% ... hata tolerans�:
ratio = 1;
while abs(ratio) > error
ratio = (E - e*sin(E) - M)/(1 - e*cos(E));
E = E - ratio;
end
% ����������������������������������������������