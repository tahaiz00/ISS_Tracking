% ������������������������������������������������������������
function coe = coe_from_sv(R,V)
% ~~~~~~~~~~~~~~~~~~~~~~~~~
%
% Bu fonksiyon, klasik y�r�nge elemanlar�n� (katsay�)
Algoritma 4.1 kullan�larak durum vekt�r�nden (R, V)%.
%
% ? - yer�ekimi parametresi (km3 / s2)
% R - yer merkezli ekvatoral �er�evedeki konum vekt�r�
% (Km)
% V - Yersel ekvatoral �er�evedeki h�z vekt�r�
% (Km)
% R, v - R ve V de�erlerinin b�y�kl�kleri
% Vr - radyal h�z komponenti (km / s)
% H - a��sal momentum vekt�r� (km2 / s)
% H - H b�y�kl��� (km2 / s)
% Incl - y�r�nge e�imi (rad)
% N - d���m �izgisi vekt�r� (km2 / s)
% N - N'nin b�y�kl���
% Cp - N ve R'nin �arp�m �arp�m�
% RA - y�kselen d���m�n sa� y�kseli�i (rad)
% E - eksantrisite vekt�r�
% E - eksantrisite (E b�y�kl���)
% Eps - bu de�erin alt�nda bir d��merkezlik oldu�u k���k bir say�
% S�f�r olarak kabul edildi
% W - son nokta arg�man� (rad)
% TA - ger�ek anomali (rad)
% A - yar� b�y�k eksen (km)
%pi 3.1415926 ...
  %Y�r�nge elemanlar�n�n katsay� - vekt�r� [h e RA incl w TA a]
%
% Kullan�c� M-fonksiyonlar� gerekli: Yok
% ------------------------------------------------- -----------
global mu;
eps = 1.e-10;
r = norm(R);
v = norm(V);
vr = dot(R,V)/r;
H = cross(R,V);
h = norm(H);

incl = acos(H(3)/h);

N = cross([0 0 1],H);
n = norm(N);

if n ~= 0
RA = acos(N(1)/n);
if N(2) < 0
RA = 2*pi - RA;
end
else
RA = 0;
end

E = 1/mu*((v^2 - mu/r)*R - r*vr*V);
e = norm(E);

if n ~= 0
if e > eps
w = acos(dot(N,E)/n/e);
if E(3) < 0
w = 2*pi - w;
end
else
w = 0;
end
else
w = 0;
end

if e > eps
TA = acos(dot(E,R)/e/r);
if vr < 0
TA = 2*pi - TA;
end
else
cp = cross(N,R);
if cp(3) >= 0
TA = acos(dot(N,R)/n/r);
else
TA = 2*pi - acos(dot(N,R)/n/r);
end
end

a = h^2/mu/(1 - e^2);
coe = [h e RA incl w TA a];
