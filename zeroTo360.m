% ������������������������������������������������������������
function y = zeroTo360(x)
% ~~~~~~~~~~~~~~~~~~~~~~~
%
% Bu alt fonksiyon, bir a��y� aral��a indirir
% 0 - 360 derece.
%
% X - Azalt�lacak a�� (derece)
% Y - Azalan de�er
%
% ------------------------------------------------- -----------
if (x >= 360)
x = x - fix(x/360)*360;
elseif (x < 0)
x = x - (fix(x/360) - 1)*360;
end
y = x;
return
