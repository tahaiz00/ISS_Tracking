% ˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜
function [f, g] = f_and_g(x, t, ro, a)
% ˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜
%
% Bu fonksiyon Lagrange f ve g katsayýlarýný hesaplar.
%
% Mu - yerçekimi parametresi (km3 / s2)
% A - yarý büyük eksenli karþýlýk (1 / km)
% Ro - t zamanýndaki radyal konum (km)
% T - t (s) tarihinden bu yana geçen süre
% X - t zamandan sonraki evrensel anomali (km0.5)
% F - Lagrange f katsayýsý (boyutsuz)
% G - Lagrange g katsayýsý (lar)
%
% Kullanýcý M-fonksiyonlarý gerekli: stumpC, stumpS
% ------------------------------------------------- -----------
global mu
z = a*x^2;

f = 1 - x^2/ro*stumpC(z);

g = t - 1/sqrt(mu)*x^3*stumpS(z);
% ˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜