% ˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜
function [V2, ierr] = gibbs(R1, R2, R3)
% ˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜
%
% Bu fonksiyon, Gibbs yörünge belirleme yöntemini kullanýr
%Saniyenin karþýlýk gelen hýzýný hesaplamak için%
% Üç saðlanan pozisyon vektörleri.
%
% ? - yerçekimi parametresi (km3 / s2)
% R1, R2, R3 - üç eþ düzlemsel yer merkezli konum vektörleri
% (Km)
% R1, r2, r3 - R1, R2 ve R3ün büyüklükleri (km)
% C12, c23, c31 - aralarýnda üç baðýmsýz çarpraz ürünler
% R1, R2 ve R3
% N, D, S - vektörler sýrasýnda R1, R2 ve R3'den oluþmaktadýr.
% Gibbs prosedürü
% Tol - R1, R2 ve R3 olup olmadýðýný belirlemek için tolerans
% Ayný düzlemdedir
% Ierr - = R1, R2, R3'ün eþ düzlemli olduðu tespit edilirse 0
% = 1 aksi takdirde
% V2 - R2'ye karþýlýk gelen hýz (km / s)
%
% Kullanýcý M-fonksiyonlarý gereklidir: yok
% ------------------------------------------------- ----------
global mu
tol = 1e-4;
ierr = 0;
% ... R1, R2 ve R3ün büyüklükleri:
r1 = norm(R1);
r2 = norm(R2);
r3 = norm(R3);
% ... R1, R2 ve R3 arasýnda çapraz ürünler:
c12 = cross(R1,R2);
c23 = cross(R2,R3);
c31 = cross(R3,R1);
% ... R1, R2 ve R3'ün ayný düzlemde olup olmadýðýný kontrol edin; Eðer ayarlanmazsa hata bayraðý:
if abs(dot(R1,c23)/r1/norm(c23)) > tol
ierr = 1;
end

N = r1*c23 + r2*c31 + r3*c12;

D = c12 + c23 + c31;

S = R1*(r2 - r3) + R2*(r3 - r1) + R3*(r1 - r2);
% ... Eþitlik 5.22: V2 = sqrt (mu / norm (N) / norm (D)) * (çapraz (D, R2) / r2 + S);
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ~~~~~~~~~