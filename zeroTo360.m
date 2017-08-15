% ˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜
function y = zeroTo360(x)
% ~~~~~~~~~~~~~~~~~~~~~~~
%
% Bu alt fonksiyon, bir açýyý aralýða indirir
% 0 - 360 derece.
%
% X - Azaltýlacak açý (derece)
% Y - Azalan deðer
%
% ------------------------------------------------- -----------
if (x >= 360)
x = x - fix(x/360)*360;
elseif (x < 0)
x = x - (fix(x/360) - 1)*360;
end
y = x;
return
