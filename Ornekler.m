<<<<<<< HEAD
% ˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜
% Example_3_06
% ˜˜˜˜˜˜˜˜˜˜˜˜
%
% This program uses Algorithm 3.3 and the data of Example 3.6
% to solve the universal Kepler’s equation.
%
% mu - gravitational parameter (kmˆ3/sˆ2)
% x - the universal anomaly (kmˆ0.5)
% dt - time since x = 0 (s)
% ro - radial position when x = 0 (km)
% vro - radial velocity when x = 0 (km/s)
% a - semimajor axis (km)
%
% User M-function required: kepler_U
=======
% ˜˜˜˜˜˜˜˜˜˜˜˜
%
% This program computes the state vector (R,V) from the
% initial state vector (R0,V0) and the elapsed time using the
% data in Example 3.7.
%
% mu - gravitational parameter (kmˆ3/sˆ2)
% R0 - the initial position vector (km)
% V0 - the initial velocity vector (km/s)
% R - the final position vector (km)
% V - the final velocity vector (km/s)
% t - elapsed time (s)
%
% User M-functions required: rv_from_r0v0
>>>>>>> master
% ------------------------------------------------------------
clear
global mu
mu = 398600;
<<<<<<< HEAD
%...Input data for Example 3.6:
ro = 10000;
vro = 3.0752;
dt = 3600;
a = -19655;
%...
%...Pass the input data to the function kepler_U, which returns x
%...(Universal Kepler’s requires the reciprocal of
% semimajor axis):
x = kepler_U(dt, ro, vro, 1/a);
%...Echo the input data and output the results to the command window:
fprintf('---------------------------------------------------')
fprintf('\n Example 3.6\n')
fprintf('\n Initial radial coordinate (km) = %g',ro)
fprintf('\n Initial radial velocity (km/s) = %g',vro)
fprintf('\n Elapsed time (seconds) = %g',dt)
fprintf('\n Semimajor axis (km) = %g\n',a)
fprintf('\n Universal anomaly (kmˆ0.5) = %g',x)
=======
%...Input data for Example 3,7:
R0 = [ 7000 -12124 0];
V0 = [2.6679 4.6210 0];
t = 3600;
%...
%...Algorithm 3.4:
[R, V] = rv_from_r0v0(R0, V0, t);
%...Echo the input data and output the results to the command window:
fprintf('---------------------------------------------------')
fprintf('\n Example 3.7\n')
fprintf('\n Initial position vector (km):')
fprintf('\n r0 = (%g, %g, %g)\n', R0(1), R0(2), R0(3))
fprintf('\n Initial velocity vector (km/s):')
fprintf('\n v0 = (%g, %g, %g)', V0(1), V0(2), V0(3))
fprintf('\n\n Elapsed time = %g s\n',t)
fprintf('\n Final position vector (km):')
fprintf('\n r = (%g, %g, %g)\n', R(1), R(2), R(3))
fprintf('\n Final velocity vector (km/s):')
fprintf('\n v = (%g, %g, %g)', V(1), V(2), V(3))
>>>>>>> master
fprintf('\n-----------------------------------------------\n')
% ˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜