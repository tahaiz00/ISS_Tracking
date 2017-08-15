% ˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜
function [r,v] = rv_from_observe(rho, rhodot, A, Adot, a,...
adot, theta, phi, H)
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ~~~~~~~~~~~
%
% Bu fonksiyon, ekoseliyal konumunu hesaplar
%Bir nesnenin radar gözlemlerinden% ve hýz vektörleri
% Aralýðý, azimut, yükseltme açýsý ve oranlarý.
%
%Derece ve radyan arasýndaki dönüþüm degeri yüzdesi
%Pi% 3.1415926 ...
%
% Yeryüzünün yeniden ekvatoral yarýçapý (km)
% F - dünyanýn düzleþme faktörü
% WE - dünyanýn açýsal hýzý (rad / s)
% Omega - yerkýsýndaki açýsal hýz vektörü (rad / s)
%Ekoseliyal çerçeve% yer merkezli
%
% Theta - izleme sitesinin yerel sedereal zamaný (derece)
%Sahanýn% phi - jeodezik enlem (derece)
% H - yükseklik (km)
% R - yer merkezli ekvatoral konum vektörü (km)
%Izlenen site yüzdesi
% Rdot - Sahanýn atalet hýzý (km / s)
% Rho - nesnenin eðik menzili (km)
%Rhodot aralýðý oraný (km / s)
% A - Nesnenin gözlem ile ilgili azimutu (derece)
%Site yüzdesi
%Azimutun Adot - Time Deðiþim Oraný (derece / sn)
% A - nesnenin nesneye göre yükseklik açýsý (derece)
%Gözlem sahasý yüzdesi
% Adot - yükselme açýsýnýn deðiþim oraný (derece / sn)
% Dec - nesnenin eko merkezli eksiltme eðilimi (rad)
%Decdot - düþüþ hýzý (rad / s)
% H - saat nesnenin açýsý (rad)
% RA - nesnenin topografik ekvatoral sað yükseliþi
% (Rad)
% RAdot - sað yükselme oraný (rad / s)
%
%Rho - siteden nesneye birim vektör
%Rhodot - Rho deðiþim zamaný oraný (1 / s)
% R - cismin ekolojik konum vektörü (km)
% V - cisimlerin jeocentrik ekvatoral hýz vektörü (km)
%
% Kullanýcý M-fonksiyonlarý gereklidir: yok
% ------------------------------------------------- -----------
global f Re wE
deg = pi/180;
omega = [0 0 wE];
% ... Açýsal miktarlarý derece olarak radyana çevirin:

A = A *deg;
Adot = Adot *deg;
a = a *deg;
adot = adot *deg;
theta = theta*deg;
phi = phi *deg;

R = [(Re/sqrt(1-(2*f - f*f)*sin(phi)^2) + H) *cos(phi)*cos(theta), ...
(Re/sqrt(1-(2*f - f*f)*sin(phi)^2) + H) ...
*cos(phi)*sin(theta), ...
(Re*(1 - f)^2/sqrt(1-(2*f - f*f) *sin(phi)^2) + H)*sin(phi)];

Rdot = cross(omega, R);

dec = asin(cos(phi)*cos(A)*cos(a) + sin(phi)*sin(a));

h = acos((cos(phi)*sin(a) - sin(phi)*cos(A)*cos(a))/cos(dec));
if (A > 0) &&  (A < pi)
h = 2*pi - h;
end

RA = theta - h;

Rho = [cos(RA)*cos(dec) sin(RA)*cos(dec) sin(dec)];

r = R + rho*Rho;

decdot = (-Adot*cos(phi)*sin(A)*cos(a) ...
+ adot*(sin(phi)*cos(a) ...
- cos(phi)*cos(A)*sin(a)))/cos(dec);

RAdot = wE ...
+ (Adot*cos(A)*cos(a) - adot*sin(A)*sin(a) ...
+ decdot*sin(A)*cos(a)*tan(dec)) ...
/(cos(phi)*sin(a) - sin(phi)*cos(A)*cos(a));

Rhodot = [-RAdot*sin(RA)*cos(dec) - decdot*cos(RA)*sin(dec),...
RAdot*cos(RA)*cos(dec) - decdot*sin(RA)*sin(dec),...
decdot*cos(dec)];

v = Rdot + rhodot*Rho + rho*Rhodot;
% ˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜