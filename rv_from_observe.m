% ������������������������������������������������������������
function [r,v] = rv_from_observe(rho, rhodot, A, Adot, a,...
adot, theta, phi, H)
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ~~~~~~~~~~~
%
% Bu fonksiyon, ekoseliyal konumunu hesaplar
%Bir nesnenin radar g�zlemlerinden% ve h�z vekt�rleri
% Aral���, azimut, y�kseltme a��s� ve oranlar�.
%
%Derece ve radyan aras�ndaki d�n���m degeri y�zdesi
%Pi% 3.1415926 ...
%
% Yery�z�n�n yeniden ekvatoral yar��ap� (km)
% F - d�nyan�n d�zle�me fakt�r�
% WE - d�nyan�n a��sal h�z� (rad / s)
% Omega - yerk�s�ndaki a��sal h�z vekt�r� (rad / s)
%Ekoseliyal �er�eve% yer merkezli
%
% Theta - izleme sitesinin yerel sedereal zaman� (derece)
%Sahan�n% phi - jeodezik enlem (derece)
% H - y�kseklik (km)
% R - yer merkezli ekvatoral konum vekt�r� (km)
%Izlenen site y�zdesi
% Rdot - Sahan�n atalet h�z� (km / s)
% Rho - nesnenin e�ik menzili (km)
%Rhodot aral��� oran� (km / s)
% A - Nesnenin g�zlem ile ilgili azimutu (derece)
%Site y�zdesi
%Azimutun Adot - Time De�i�im Oran� (derece / sn)
% A - nesnenin nesneye g�re y�kseklik a��s� (derece)
%G�zlem sahas� y�zdesi
% Adot - y�kselme a��s�n�n de�i�im oran� (derece / sn)
% Dec - nesnenin eko merkezli eksiltme e�ilimi (rad)
%Decdot - d���� h�z� (rad / s)
% H - saat nesnenin a��s� (rad)
% RA - nesnenin topografik ekvatoral sa� y�kseli�i
% (Rad)
% RAdot - sa� y�kselme oran� (rad / s)
%
%Rho - siteden nesneye birim vekt�r
%Rhodot - Rho de�i�im zaman� oran� (1 / s)
% R - cismin ekolojik konum vekt�r� (km)
% V - cisimlerin jeocentrik ekvatoral h�z vekt�r� (km)
%
% Kullan�c� M-fonksiyonlar� gereklidir: yok
% ------------------------------------------------- -----------
global f Re wE
deg = pi/180;
omega = [0 0 wE];
% ... A��sal miktarlar� derece olarak radyana �evirin:

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
% ������������������������������������������������������������