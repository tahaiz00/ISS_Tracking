% ������������������������������������������������������������
function [r, v] = sv_from_coe(coe)
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Bu fonksiyon, durum vekt�r�n� (r, v) hesaplar.
%Klasik y�r�nge elemanlar� (katsay�).
%
% ? - yer�ekimi parametresi (km3; s2)
% Katsay� orbita elemanlar� [e RA incl w TA]
% nerede
% H = a��sal momentum (km2 / s)
% E = d��merkezlik
% RA = Y�kselen d���m�n sa� y�kseli�i (rad)
%Incl = y�r�nge e�imi (rad)
% W = perigee'nin arg�man� (rad)
% TA = ger�ek anomali (rad)
% R3_w - Z ekseni etraf�nda w a��s� boyunca d�nme matrisi
% R1_i - A�� i boyunca x ekseni etraf�nda d�nme matrisi
% R3_W - RA a��s� boyunca z ekseni etraf�nda d�nme matrisi
% Q_pX - Perifocal d�n���m�n matrisi
%Ekoseliyal �er�eve% yer merkezli
% Rp - periferik �er�evedeki konum vekt�r� (km)
% Vp - periferik �er�evedeki h�z vekt�r� (km / s)
% R - yer merkezli ekvatoral �er�evedeki konum vekt�r�
% (Km)
% V - Yersel ekvatoral �er�evedeki h�z vekt�r�
% (Km / s)
%
% Kullan�c� M-fonksiyonlar� gereklidir: yok
% ------------------------------------------------- -----------
global mu
h = coe(1);
e = coe(2);
RA = coe(3);
incl = coe(4);
w = coe(5);
TA = coe(6);

rp = (h^2/mu) * (1/(1 + e*cos(TA))) * (cos(TA)*[1;0;0]+ sin(TA)*[0;1;0]);
vp = (mu/h) * (-sin(TA)*[1;0;0] + (e + cos(TA))*[0;1;0]);

R3_W = [ cos(RA) sin(RA) 0-sin(RA) cos(RA) 0 0 0 1];

R1_i = [1 0 0 0 cos(incl) sin(incl) 0 -sin(incl) cos(incl)];

R3_w = [ cos(w) sin(w) 0-sin(w) cos(w) 0 0 0 1];

Q_pX = R3_W' * R1_i' * R3_w';
%(R ve v s�tun vekt�rleridir):
r = Q_pX*rp;
v = Q_pX*vp;
% ... r ve v'yi sat�r vekt�rlerine d�n��t�r�n:
r = r';
v = v';
% ������������������������������������������������������������