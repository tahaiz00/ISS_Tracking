% ˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜
function c = stumpC(z)
% ~~~~~~~~~~~~~~~~~~~~
%
% Bu fonksiyon, Stumpff fonksiyonunu C (z)
% Den Eþitlik 3.50'e.
%
% Z - giriþ argümaný
% C - C (z) deðeri
%
% Kullanýcý M-fonksiyonlarý gereklidir: yok
% ------------------------------------------------- -----------
if z > 0
c = (1 - cos(sqrt(z)))/z;
elseif z < 0
c = (cosh(sqrt(-z)) - 1)/(-z);
else
c = 1/2;
end
% ˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜