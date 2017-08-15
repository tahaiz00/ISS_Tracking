% ������������������������������������������������������������
function [V2, ierr] = gibbs(R1, R2, R3)
% ���������������������������������������
%
% Bu fonksiyon, Gibbs y�r�nge belirleme y�ntemini kullan�r
%Saniyenin kar��l�k gelen h�z�n� hesaplamak i�in%
% �� sa�lanan pozisyon vekt�rleri.
%
% ? - yer�ekimi parametresi (km3 / s2)
% R1, R2, R3 - �� e� d�zlemsel yer merkezli konum vekt�rleri
% (Km)
% R1, r2, r3 - R1, R2 ve R3�n b�y�kl�kleri (km)
% C12, c23, c31 - aralar�nda �� ba��ms�z �arpraz �r�nler
% R1, R2 ve R3
% N, D, S - vekt�rler s�ras�nda R1, R2 ve R3'den olu�maktad�r.
% Gibbs prosed�r�
% Tol - R1, R2 ve R3 olup olmad���n� belirlemek i�in tolerans
% Ayn� d�zlemdedir
% Ierr - = R1, R2, R3'�n e� d�zlemli oldu�u tespit edilirse 0
% = 1 aksi takdirde
% V2 - R2'ye kar��l�k gelen h�z (km / s)
%
% Kullan�c� M-fonksiyonlar� gereklidir: yok
% ------------------------------------------------- ----------
global mu
tol = 1e-4;
ierr = 0;
% ... R1, R2 ve R3�n b�y�kl�kleri:
r1 = norm(R1);
r2 = norm(R2);
r3 = norm(R3);
% ... R1, R2 ve R3 aras�nda �apraz �r�nler:
c12 = cross(R1,R2);
c23 = cross(R2,R3);
c31 = cross(R3,R1);
% ... R1, R2 ve R3'�n ayn� d�zlemde olup olmad���n� kontrol edin; E�er ayarlanmazsa hata bayra��:
if abs(dot(R1,c23)/r1/norm(c23)) > tol
ierr = 1;
end

N = r1*c23 + r2*c31 + r3*c12;

D = c12 + c23 + c31;

S = R1*(r2 - r3) + R2*(r3 - r1) + R3*(r1 - r2);
% ... E�itlik 5.22: V2 = sqrt (mu / norm (N) / norm (D)) * (�apraz (D, R2) / r2 + S);
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ~~~~~~~~~