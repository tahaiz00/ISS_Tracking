% ˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜
function [R,V] = rv_from_r0v0(R0, V0, t)
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Bu fonksiyon, durum vektörünü (R, V) hesaplar.
% Baþlangýç durum vektörü (R0, V0) ve geçen süre.
%
% ? - yerçekimi parametresi (km3 / s2)
% R0 - baþlangýç pozisyon vektörü (km)
% V0 - baþlangýç hýz vektörü (km / s)
% T - geçen süre (ler)
% R - son konum vektörü (km)
% V - son hýz vektörü (km / s)
%
% Kullanýcý M-fonksiyonlarý gerekli: kepler_U, f_and_g, fDot_and_gDot
% ------------------------------------------------- -----------

global mu
% ... R0 ve V0'un büyüklükleri:
r0 = norm(R0);
v0 = norm(V0);
% ... Ýlk radyal hýz:
vr0 = dot(R0, V0)/r0;
% ... Yarý ana eksenin karþýlýklý (enerji denkleminden):
alpha = 2/r0 - v0^2/mu;
% ... Evrensel anomaliyi hesapla:
x = kepler_U(t, r0, vr0, alpha);
% ... f ve g fonksiyonlarýný hesapla:
[f, g] = f_and_g(x, t, r0, alpha);
% ... Son konum vektörünü hesapla:
R = f*R0 + g*V0;
% ... R'nin büyüklüðünü hesapla:
r = norm(R);
% ... f ve g türevlerini hesapla:
[fdot, gdot] = fDot_and_gDot(x, r, r0, alpha);
% ... Son hýzý hesapla:
V = fdot*R0 + gdot*V0;
% ˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜