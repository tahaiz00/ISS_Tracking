% 
function [f, g] = f_and_g(x, t, ro, a)
% 
%
% Bu fonksiyon Lagrange f ve g katsayύlarύnύ hesaplar.
%
% Mu - yerηekimi parametresi (km3 / s2)
% A - yarύ bόyόk eksenli karώύlύk (1 / km)
% Ro - t zamanύndaki radyal konum (km)
% T - t (s) tarihinden bu yana geηen sόre
% X - t zamandan sonraki evrensel anomali (km0.5)
% F - Lagrange f katsayύsύ (boyutsuz)
% G - Lagrange g katsayύsύ (lar)
%
% Kullanύcύ M-fonksiyonlarύ gerekli: stumpC, stumpS
% ------------------------------------------------- -----------
global mu
z = a*x^2;

f = 1 - x^2/ro*stumpC(z);

g = t - 1/sqrt(mu)*x^3*stumpS(z);
% 