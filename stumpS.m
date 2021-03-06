% 
function s = stumpS(z)
% ~~~~~~~~~~~~~~~~~~~~
%
% Bu fonksiyon Stumpff fonksiyonunu S (z)
% Den Denk. 3.49'a.
%
% Z - giriώ argόmanύ
% S - S (z) deπeri
%
% Kullanύcύ M-fonksiyonlarύ gereklidir: yok
% ------------------------------------------------- -----------

if z > 0
s = (sqrt(z) - sin(sqrt(z)))/(sqrt(z))^3;
elseif z < 0
s = (sinh(sqrt(-z)) - sqrt(-z))/(sqrt(-z))^3;
else
s = 1/6;
end
% 