% Uebungen zur Numerischen Mathematik, WS 2014/15
% Blatt 10, Aufgabe 36
%
% Autoren:
%   Janina Geiser, Mat Nr. 6420269
%   Michael Hufschmidt, Mat.Nr. 6436122
%   Farina Ohm, Mat Nr. 6314051
%   Annika Seidel, Mat Nr. 6420536
% Uebungsleiter:
%   Thomas Berger <thomas.berger@uni-hamburg.de>
%

% Testprogramm fuer spline.m und splineval.m
clc
clear all
% Hier kann man verschiedene Funtkionen ausprobieren!
f = @(x) sin(pi * x / 180)
xs = [0 10 30 40 70 90]     % Stützstellen

fs = f(xs);                 % Stützwerte
n = length(xs);
x = linspace(xs(1), xs(n), 100) ;
y = zeros (100);
for i = 1:length(x)
    y1(i) = splineval(x(i), xs, fs) ; % Splines
end
y2 = f(x) ;                 % Exakte Funktion
plot(xs, fs, '*');
hold on
plot(x,y1,'-r')
plot(x,y2,'-g')
