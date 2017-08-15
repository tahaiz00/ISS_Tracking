% ˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜
function x = kepler_U(dt, ro, vro, a)
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%
% Bu iþlev, evrensel çözmek için Newton yöntemini kullanýr
%Evrensel anomali için% Kepler denklemi.
%
% ? - yerçekimi parametresi (km3 / s2)
% X - evrensel anomali (km0.5)
% Dt - x = 0'dan bu yana geçen süre
% Ro - radyal konum (km) x = 0 olduðunda
% Vro - radyal hýz (km / s) x = 0 olduðunda
% A - yarý büyük eksenli karþýlýk (1 / km)
% Z - yardýmcý deðiþken (z = a * x2)
% C - Stumpff fonksiyonunun deðeri C (z)
% S - Stumpff fonksiyonunun deðeri S (z)
% N - yakýnsama için yineleme sayýsý
% NMax - izin verilen maksimum yineleme sayýsý
%
% Kullanýcý M-fonksiyonlarý gerekli: stumpC, stumpS
% ------------------------------------------------- -----------
global mu
% ... Hata toleransýný ve sayý sayýsýný sýnýrlamayý ayarlayýn.
%Yinelemeler yüzdesi:
error = 1.e-8;
nMax = 1000;
% ... x için baþlangýç deðeri:
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
% ... x için bir deðer sunun, ancak nMax'e ulaþýldýðýný bildirin:
if n > nMax
fprintf('\n **No. iterations of Kepler''s equation')
fprintf(' = %g', n)
fprintf('\n F/dFdx = %g\n', F/dFdx)
end
% ˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜