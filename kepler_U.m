% ������������������������������������������������������������
function x = kepler_U(dt, ro, vro, a)
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%
% Bu i�lev, evrensel ��zmek i�in Newton y�ntemini kullan�r
%Evrensel anomali i�in% Kepler denklemi.
%
% ? - yer�ekimi parametresi (km3 / s2)
% X - evrensel anomali (km0.5)
% Dt - x = 0'dan bu yana ge�en s�re
% Ro - radyal konum (km) x = 0 oldu�unda
% Vro - radyal h�z (km / s) x = 0 oldu�unda
% A - yar� b�y�k eksenli kar��l�k (1 / km)
% Z - yard�mc� de�i�ken (z = a * x2)
% C - Stumpff fonksiyonunun de�eri C (z)
% S - Stumpff fonksiyonunun de�eri S (z)
% N - yak�nsama i�in yineleme say�s�
% NMax - izin verilen maksimum yineleme say�s�
%
% Kullan�c� M-fonksiyonlar� gerekli: stumpC, stumpS
% ------------------------------------------------- -----------
global mu
% ... Hata tolerans�n� ve say� say�s�n� s�n�rlamay� ayarlay�n.
%Yinelemeler y�zdesi:
error = 1.e-8;
nMax = 1000;
% ... x i�in ba�lang�� de�eri:
x = sqrt(mu)*abs(a)*dt;

n =0;
ratio = 1;
while abs(ratio) > error & n <= nMax
n = n + 1;
C = stumpC(a*x^2);
S = stumpS(a*x^2);
F = ro*vro/sqrt(mu)*x^2*C + (1 - a*ro)*x^3*S + ro*x-...
sqrt(mu)*dt;
dFdx = ro*vro/sqrt(mu)*x*(1 - a*x^2*S)+...
(1 - a*ro)*x^2*C+ro;
ratio = F/dFdx;
x = x - ratio;
end
% ... x i�in bir de�er sunun, ancak nMax'e ula��ld���n� bildirin:
if n > nMax
fprintf('\n **No. iterations of Kepler''s equation')
fprintf(' = %g', n)
fprintf('\n F/dFdx = %g\n', F/dFdx)
end
% ������������������������������������������������������������