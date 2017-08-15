% ˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜
function coe = coe_from_sv(R,V)
% ~~~~~~~~~~~~~~~~~~~~~~~~~
%
% Bu fonksiyon, klasik yörünge elemanlarýný (katsayý)
Algoritma 4.1 kullanýlarak durum vektöründen (R, V)%.
%
% ? - yerçekimi parametresi (km3 / s2)
% R - yer merkezli ekvatoral çerçevedeki konum vektörü
% (Km)
% V - Yersel ekvatoral çerçevedeki hýz vektörü
% (Km)
% R, v - R ve V deðerlerinin büyüklükleri
% Vr - radyal hýz komponenti (km / s)
% H - açýsal momentum vektörü (km2 / s)
% H - H büyüklüðü (km2 / s)
% Incl - yörünge eðimi (rad)
% N - düðüm çizgisi vektörü (km2 / s)
% N - N'nin büyüklüðü
% Cp - N ve R'nin çarpým çarpýmý
% RA - yükselen düðümün sað yükseliþi (rad)
% E - eksantrisite vektörü
% E - eksantrisite (E büyüklüðü)
% Eps - bu deðerin altýnda bir dýþmerkezlik olduðu küçük bir sayý
% Sýfýr olarak kabul edildi
% W - son nokta argümaný (rad)
% TA - gerçek anomali (rad)
% A - yarý büyük eksen (km)
%pi 3.1415926 ...
  %Yörünge elemanlarýnýn katsayý - vektörü [h e RA incl w TA a]
%
% Kullanýcý M-fonksiyonlarý gerekli: Yok
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
