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
 f = @(x) sin(pi * x / 180) ;  % Entweder so
%f = @(x) cos(pi * x / 180)      % oder so
xs = [0 30 60 65 70 75 90] ;    % 7 Stützstellen

fs = f(xs) ;                    % Stützwerte
n = length(xs) ;
x = linspace(xs(1), xs(n), 100) ; % zum Plotten
y_ex = zeros (100) ;
for i = 1:length(x)
    ys(i) = splineval(x(i), xs, fs) ; % Plot der Splines
end
y_ex = f(x) ;                   % Exakte Funktion
plot(xs, fs, '*b', x,ys,'-r', x,y_ex,'-g');
