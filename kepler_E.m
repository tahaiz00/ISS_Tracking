function E = kepler_E(e, M)

% Bu iþlev, Kepler'in çözümünde Newton'un yöntemini kullanýr
%Denklem E - e * sin (E) = E eksantrik anomali için M,
%Sapma ve ortalama anomali göz önüne alýndýðýnda.
%
% E - eksantrik anomali (radyan)
% E - dýþmerkezlik, çaðrý programýndan geçti.
% M - ortalama anomali (radyan), çaðýran programdan geçti
%Pi 3.1415926 ...
%
% Kullanýcý M-fonksiyonlarý gereklidir: yok
% ------------------------------------------------- -----------
% ... Hata toleransýný ayarlayýn:
error = 1.e-8;
% ... E için bir baþlangýç deðeri seçin:
if M < pi
E = M + e/2;
else
E = M - e/2;
end

% ... hata toleransý:
ratio = 1;
while abs(ratio) > error
ratio = (E - e*sin(E) - M)/(1 - e*cos(E));
E = E - ratio;
end
% ˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜