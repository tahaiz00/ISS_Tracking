% ������������������������������������������������������������
function c = stumpC(z)
% ~~~~~~~~~~~~~~~~~~~~
%
% Bu fonksiyon, Stumpff fonksiyonunu C (z)
% Den E�itlik 3.50'e.
%
% Z - giri� arg�man�
% C - C (z) de�eri
%
% Kullan�c� M-fonksiyonlar� gereklidir: yok
% ------------------------------------------------- -----------
if z > 0
c = (1 - cos(sqrt(z)))/z;
elseif z < 0
c = (cosh(sqrt(-z)) - 1)/(-z);
else
c = 1/2;
end
% ������������������������������������������������������������