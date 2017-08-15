% ������������������������������������������������������������
function [f, g] = f_and_g(x, t, ro, a)
% ��������������������������������������
%
% Bu fonksiyon Lagrange f ve g katsay�lar�n� hesaplar.
%
% Mu - yer�ekimi parametresi (km3 / s2)
% A - yar� b�y�k eksenli kar��l�k (1 / km)
% Ro - t zaman�ndaki radyal konum (km)
% T - t (s) tarihinden bu yana ge�en s�re
% X - t zamandan sonraki evrensel anomali (km0.5)
% F - Lagrange f katsay�s� (boyutsuz)
% G - Lagrange g katsay�s� (lar)
%
% Kullan�c� M-fonksiyonlar� gerekli: stumpC, stumpS
% ------------------------------------------------- -----------
global mu
z = a*x^2;

f = 1 - x^2/ro*stumpC(z);

g = t - 1/sqrt(mu)*x^3*stumpS(z);
% ������������������������������������������������������������