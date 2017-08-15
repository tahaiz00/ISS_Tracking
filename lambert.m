% ˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜
function [V1, V2] = lambert(R1, R2, t, string)
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ~~~~~~~~~~~
%
%Bu fonksiyon Lambert'ýn problemini çözer.
%
% ? - yerçekimi parametresi (km3 / s2)
% R1, R2 - baþlangýç ??ve son konum vektörleri (km)
% R1, r2 - R1 ve R2 büyüklükleri
% T - R1'den R2'ye uçuþ süresi
% (Sabit) (ler)
% V1, V2 - baþlangýç ??ve son hýz vektörleri (km / s)
% C12 - R1'in R2'ye çarpýmý
%R1 ve R2 arasýndaki teta açýsý
% String - 'pro' yörüngede ilerleme varsa
%Yörünge retrograd ise% 'retro'
% A - Denk. 5.35 ile verilen sabit
% Z - alpha * x2, burada alfa, karþýlýk gelen
% Semimajor ekseni ve x evrensel anomalidir
% Y (z) - Denklem 5.38 ile verilen z fonksiyonu
% F (z, t) - deðiþken z ve sabit t'nin bir fonksiyonu,
%Denk. 5.40 ile verilen%
% DFdz (z) - F (z, t) türevi, tarafýndan verilir
%Denklem 5.43
%Oran - F / dFdz
% Tol - yakýnsama hassaslýðý toleransý
% Nmax - Newton'un maksimum yineleme sayýsý
%Prosedür%
% F, g - Lagrange katsayýlarý
% Gdot - g'nin zaman türevi
% C (z), S (z) - Stumpff fonksiyonlarý
% Dum - kukla deðiþken
%
% Kullanýcý M-fonksiyonlarý gerekli: stumpC ve stumpS
% ------------------------------------------------- ----------
global mu
global r1 r2 A
% ... R1 ve R2'nin büyüklükleri:
r1 = norm(R1);
r2 = norm(R2);
c12 = cross(R1, R2);
theta = acos(dot(R1,R2)/r1/r2);
% ... Yörüngesinin ilerleme mi yoksa retrograd olup olmadýðýný belirleyin:
if strcmp(string, 'pro')
if c12(3) <= 0
theta = 2*pi - theta;
end
elseif strcmp(string,'retro')
if c12(3) >= 0
theta = 2*pi - theta;
end
else
    string =  'pro';
 
fprintf('\n ** Prograde trajectory assumed.\n')
end

A = sin(theta)*sqrt(r1*r2/(1 - cos(theta)));
% ... Yaklaþýk olarak F (z, t) iþaretini deðiþtirir 

z = -100;
while F(z,t) < 0
z = z + 0.1;
end
% ... Hata toleransýný ve yineleme sayýsýndaki bir sýnýrý ayarlayýn:
tol = 1.e-8;
nmax = 5000;

ratio = 1;
n =0;
while (abs(ratio) > tol) && (n <= nmax)
n = n + 1;
ratio = F(z,t)/dFdz(z);
z = z - ratio;
end
% ... Maksimum yineleme sayýsýnýn aþýldýðýný bildirin:
if n >= nmax
fprintf('\n\n **Number of iterations exceeds')
fprintf(' %g \n\n ', nmax)
end

f = 1 - y(z)/r1;

g = A*sqrt(y(z)/mu);

gdot = 1 - y(z)/r2;

V1 = 1/g*(R2 - f*R1);

V2 = 1/g*(gdot*R2 - R1);
return

function dum = y(z)
global r1 r2 A
dum = r1 + r2 + A*(z*S(z) - 1)/sqrt(C(z));
return

function dum = F(z,t)
global mu A
dum = (y(z)/C(z))^1.5*S(z) + A*sqrt(y(z)) - sqrt(mu)*t;
return

function dum = dFdz(z)
global A
if z == 0
dum = sqrt(2)/40*y(0)^1.5 + A/8*(sqrt(y(0)) + A*sqrt(1/2/y(0)));
else
dum = (y(z)/C(z))^1.5*(1/2/z*(C(z) - 3*S(z)/2/C(z)) + 3*S(z)^2/4/C(z)) + A/8*(3*S(z)/C(z)*sqrt(y(z)) + A*sqrt(C(z)/y(z)));
end
return

function dum = C(z)
dum = stumpC(z);
return
function dum = S(z)
dum = stumpS(z);
return
% ˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜