% ������������������������������������������������������������
% Example_5_01
% ������������
%
<<<<<<< HEAD
% This program uses Algorithm 4.2 to obtain the state vector
% from the orbital elements provided in Example 4.5.
%
% pi - 3.1415926...
% deg - factor for converting between degrees and radians
% mu - gravitational parameter (km�3/s�2)
% coe - orbital elements [h e RA incl w TA a]
% where h = angular momentum (km�2/s)
% e = eccentricity
% RA = right ascension of the ascending node
% (rad)
=======
% This program uses Algorithm 5.1 (Gibbs� method) and
% Algorithm 4.1 to obtain the orbital elements from the data
% provided in Example 5.1.
%
% deg - factor for converting between degrees and
% radians
% pi - 3.1415926...
% mu - gravitational parameter (km�3/s�2)
% r1, r2, r3 - three coplanar geocentric position vectors (km)
% ierr - 0 if r1, r2, r3 are found to be coplanar
% 1 otherwise
% v2 - the velocity corresponding to r2 (km/s)
% coe - orbital elements [h e RA incl w TA a]
% where h = angular momentum (km�2/s)
% e = eccentricity
% RA = right ascension of the ascending
% node (rad)
>>>>>>> gibbs-kod
% incl = orbit inclination (rad)
% w = argument of perigee (rad)
% TA = true anomaly (rad)
% a = semimajor axis (km)
<<<<<<< HEAD
% r - position vector (km) in geocentric equatorial frame
% v - velocity vector (km) in geocentric equatorial frame
%
% User M-functions required: sv_from_coe
% ------------------------------------------------------------
clear all
clc
global mu
deg = pi/180;
mu = 398600;
%...Input data (angles in degrees):
h = 80000;
e = 1.4;
RA = 40;
incl = 30;
w = 60;
TA = 30;
%...
coe = [h, e, RA*deg, incl*deg, w*deg, TA*deg];
%...Algorithm 4.2 (requires angular elements be in radians):
[r, v] = sv_from_coe(coe);
%...Echo the input data and output the results to the command window:
fprintf('---------------------------------------------------')
fprintf('\n Example 4.5\n')
fprintf('\n Gravitational parameter (km�3/s�2) = %g\n', mu)
fprintf('\n Angular momentum (km�2/s) = %g', h)
fprintf('\n Eccentricity = %g', e)
fprintf('\n Right ascension (deg) = %g', RA)
fprintf('\n Argument of perigee (deg) = %g', w)
fprintf('\n True anomaly (deg) = %g', TA)
fprintf('\n\n State vector:')
fprintf('\n r (km) = [%g %g %g]', r(1), r(2), r(3))
fprintf('\n v (km/s) = [%g %g %g]', v(1), v(2), v(3))
=======
% T - period of elliptic orbit (s)
%
% User M-functions required: gibbs, coe_from_sv
% ------------------------------------------------------------
<<<<<<< HEAD
clear all
clc
deg = pi/180;
global mu
%...Input data for Example 5.1:
mu = 398600;
r1 = [-294.32 4265.1 5986.7];
r2 = [-1365.4 3637.6 6346.8];
r3 = [-2940.3 2473.7 6555.8];
=======
clear
%...Input data for Example 3.5:
e = 2.94;
M = 44.69;
>>>>>>> Kepler_H-yeni_deger_testi
%...
%...Echo the input data to the command window:
fprintf('---------------------------------------------------')
fprintf('\n Example 5.1: Gibbs Method\n')
fprintf('\n\n Input data:\n')
fprintf('\n Gravitational parameter (km�3/s�2) = %g\n', mu)
fprintf('\n r1 (km) = [%g %g %g]', r1(1), r1(2), r1(3))
fprintf('\n r2 (km) = [%g %g %g]', r2(1), r2(2), r2(3))
fprintf('\n r3 (km) = [%g %g %g]', r3(1), r3(2), r3(3))
fprintf('\n\n');
%...Algorithm 5.1:
[v2, ierr] = gibbs(r1, r2, r3);
%...If the vectors r1, r2, r3, are not coplanar, abort:
if ierr == 1
fprintf('\n These vectors are not coplanar.\n\n')
return
end
%...Algorithm 4.1
coe = coe_from_sv(r2,v2);
h = coe(1);
e = coe(2);
RA = coe(3);
incl = coe(4);
w = coe(5);
TA = coe(6);
a = coe(7);
%...Output the results to the command window:
fprintf(' Solution:')
fprintf('\n');
fprintf('\n v2 (km/s) = [%g %g %g]', v2(1), v2(2), v2(3))
fprintf('\n\n Orbital elements:');
fprintf('\n Angular momentum (km�2/s) = %g', h)
fprintf('\n Eccentricity = %g', e)
fprintf('\n Inclination (deg) = %g', incl/deg)
fprintf('\n RA of ascending node (deg) = %g', RA/deg)
fprintf('\n Argument of perigee (deg) = %g', w/deg)
fprintf('\n True anomaly (deg) = %g', TA/deg)
fprintf('\n Semimajor axis (km) = %g', a)
%...If the orbit is an ellipse, output the period:
if e < 1
T = 2*pi/sqrt(mu)*coe(7)^1.5;
fprintf('\n Period (s) = %g', T)
end
>>>>>>> gibbs-kod
fprintf('\n-----------------------------------------------\n')
% ������������������������������������������������������������