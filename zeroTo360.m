% 
function y = zeroTo360(x)
% ~~~~~~~~~~~~~~~~~~~~~~~
%
% Bu alt fonksiyon, bir aηύyύ aralύπa indirir
% 0 - 360 derece.
%
% X - Azaltύlacak aηύ (derece)
% Y - Azalan deπer
%
% ------------------------------------------------- -----------
if (x >= 360)
x = x - fix(x/360)*360;
elseif (x < 0)
x = x - (fix(x/360) - 1)*360;
end
y = x;
return
