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
function [y] = splineval(x, xs, fs)
n = length(xs)  ;               % Anzahl n von Stuetzstellen
M = spline(xs, fs) ;
if (x < xs(1)) || (x > xs(n))
     error('x muss im Bereich der Stützstellen liegen')
end
i = 1;
while x > xs(i+1)
    i = i +1 ;
end
% Jetzt liegt x im Intervall xs(i) ... xs(i+1)
dx = x - xs(i) ;
% Berechne den i-ten Spline an der Stelle x
%      delta          gamma          beta           alpha
y = (((M(4,i) * dx) + M(3,i)) * dx + M(2,i)) * dx + M(1,i) ;
% Fuer die spline-Funktion aus Matlab:
% y = (((M(1,i) * dx) + M(2,i)) * dx + M(3,i)) * dx + M(4,i) ;

end