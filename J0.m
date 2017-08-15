% ˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜
function j0 = J0(year, month, day)
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~
%
% Bu iþlev, herhangi biri için 0 UT'de Julian gün sayýsýný hesaplar
%Denklem 5.48 ile 1900 ve 2100 arasýndaki% yýl.
%
% J0 - 0 saat UT'de (Universal Time) Julian günü
%Yýl aralýðý: 1901 - 2099
% Ay aralýðý: 1 - 12
% Gün aralýðý: 1 - 31
%
% Kullanýcý M-fonksiyonlarý gereklidir: yok
% ------------------------------------------------- -----------
j0 = 367*year - fix(7*(year + fix((month + 9)/12))/4) ...
+ fix(275*month/9) + day + 1721013.5;
% ˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜