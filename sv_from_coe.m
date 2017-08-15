% ˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜
function [r, v] = sv_from_coe(coe)
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Bu fonksiyon, durum vektörünü (r, v) hesaplar.
%Klasik yörünge elemanlarý (katsayý).
%
% ? - yerçekimi parametresi (km3; s2)
% Katsayý orbita elemanlarý [e RA incl w TA]
% nerede
% H = açýsal momentum (km2 / s)
% E = dýþmerkezlik
% RA = Yükselen düðümün sað yükseliþi (rad)
%Incl = yörünge eðimi (rad)
% W = perigee'nin argümaný (rad)
% TA = gerçek anomali (rad)
% R3_w - Z ekseni etrafýnda w açýsý boyunca dönme matrisi
% R1_i - Açý i boyunca x ekseni etrafýnda dönme matrisi
% R3_W - RA açýsý boyunca z ekseni etrafýnda dönme matrisi
% Q_pX - Perifocal dönüþümün matrisi
%Ekoseliyal çerçeve% yer merkezli
% Rp - periferik çerçevedeki konum vektörü (km)
% Vp - periferik çerçevedeki hýz vektörü (km / s)
% R - yer merkezli ekvatoral çerçevedeki konum vektörü
% (Km)
% V - Yersel ekvatoral çerçevedeki hýz vektörü
% (Km / s)
%
% Kullanýcý M-fonksiyonlarý gereklidir: yok
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
%(R ve v sütun vektörleridir):
r = Q_pX*rp;
v = Q_pX*vp;
% ... r ve v'yi satýr vektörlerine dönüþtürün:
r = r';
v = v';
% ˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜