% ������������������������������������������������������������
function j0 = J0(year, month, day)
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~
%
% Bu i�lev, herhangi biri i�in 0 UT'de Julian g�n say�s�n� hesaplar
%Denklem 5.48 ile 1900 ve 2100 aras�ndaki% y�l.
%
% J0 - 0 saat UT'de (Universal Time) Julian g�n�
%Y�l aral���: 1901 - 2099
% Ay aral���: 1 - 12
% G�n aral���: 1 - 31
%
% Kullan�c� M-fonksiyonlar� gereklidir: yok
% ------------------------------------------------- -----------
j0 = 367*year - fix(7*(year + fix((month + 9)/12))/4) ...
+ fix(275*month/9) + day + 1721013.5;
% ������������������������������������������������������������