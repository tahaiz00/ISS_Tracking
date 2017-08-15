% ������������������������������������������������������������
function [R,V] = rv_from_r0v0(R0, V0, t)
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Bu fonksiyon, durum vekt�r�n� (R, V) hesaplar.
% Ba�lang�� durum vekt�r� (R0, V0) ve ge�en s�re.
%
% ? - yer�ekimi parametresi (km3 / s2)
% R0 - ba�lang�� pozisyon vekt�r� (km)
% V0 - ba�lang�� h�z vekt�r� (km / s)
% T - ge�en s�re (ler)
% R - son konum vekt�r� (km)
% V - son h�z vekt�r� (km / s)
%
% Kullan�c� M-fonksiyonlar� gerekli: kepler_U, f_and_g, fDot_and_gDot
% ------------------------------------------------- -----------

global mu
% ... R0 ve V0'un b�y�kl�kleri:
r0 = norm(R0);
v0 = norm(V0);
% ... �lk radyal h�z:
vr0 = dot(R0, V0)/r0;
% ... Yar� ana eksenin kar��l�kl� (enerji denkleminden):
alpha = 2/r0 - v0^2/mu;
% ... Evrensel anomaliyi hesapla:
x = kepler_U(t, r0, vr0, alpha);
% ... f ve g fonksiyonlar�n� hesapla:
[f, g] = f_and_g(x, t, r0, alpha);
% ... Son konum vekt�r�n� hesapla:
R = f*R0 + g*V0;
% ... R'nin b�y�kl���n� hesapla:
r = norm(R);
% ... f ve g t�revlerini hesapla:
[fdot, gdot] = fDot_and_gDot(x, r, r0, alpha);
% ... Son h�z� hesapla:
V = fdot*R0 + gdot*V0;
% ������������������������������������������������������������