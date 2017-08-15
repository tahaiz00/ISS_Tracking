% ˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜
function [fdot, gdot] = fDot_and_gDot(x, r, ro, a)
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ~
%
% Bu fonksiyon, zaman türevlerini hesaplar.
%Lagrange f ve g katsayýlarý.
%
% Mu - yerçekimi parametresi (km3 / s2)
% A - yarý büyük eksenli karþýlýk (1 / km)
% Ro - t zamanýndaki radyal konum (km)
% T - baþlangýç durum vektöründen bu yana geçen süre
% R - t zamanýndan sonraki radyal konum t (km)
% X - t zamandan sonraki evrensel anomali (km0.5)
% FDagrange f katsayýsýnýn zaman-türevi (1 / s)
%Lagrange g katsayýsýnýn gecikme zamaný tayini
% (boyutsuz)
%
% Kullanýcý M-fonksiyonlarý gerekli: stumpC, stumpS
% ------------------------------------------------- -----------
global mu
z = a*x^2;

fdot = sqrt(mu)/r/ro*(z*stumpS(z) - 1)*x;

gdot = 1 - x^2/r*stumpC(z);
% ˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜