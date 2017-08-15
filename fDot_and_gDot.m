% ������������������������������������������������������������
function [fdot, gdot] = fDot_and_gDot(x, r, ro, a)
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ~
%
% Bu fonksiyon, zaman t�revlerini hesaplar.
%Lagrange f ve g katsay�lar�.
%
% Mu - yer�ekimi parametresi (km3 / s2)
% A - yar� b�y�k eksenli kar��l�k (1 / km)
% Ro - t zaman�ndaki radyal konum (km)
% T - ba�lang�� durum vekt�r�nden bu yana ge�en s�re
% R - t zaman�ndan sonraki radyal konum t (km)
% X - t zamandan sonraki evrensel anomali (km0.5)
% FDagrange f katsay�s�n�n zaman-t�revi (1 / s)
%Lagrange g katsay�s�n�n gecikme zaman� tayini
% (boyutsuz)
%
% Kullan�c� M-fonksiyonlar� gerekli: stumpC, stumpS
% ------------------------------------------------- -----------
global mu
z = a*x^2;

fdot = sqrt(mu)/r/ro*(z*stumpS(z) - 1)*x;

gdot = 1 - x^2/r*stumpC(z);
% ������������������������������������������������������������