% Uebungen zur Numerischen Mathematik, WS 2014/15
% Blatt 06, Aufgabe 21b
%
% Autoren:
%   Janina Geiser, Mat Nr. 6420269
%   Michael Hufschmidt, Mat.Nr. 6436122
%   Farina Ohm, Mat Nr. 6314051
%   Annika Seidel, Mat Nr. 6420536
% Uebungsleiter:
%   Thomas Berger <thomas.berger@uni-hamburg.de>
%

function[y] = F(x)
% Berechnet die Funktion F an der Stelle x gemaess Uebungsblatt
n = size(x) ;
n = 2 ;
y = zeros(n,1) ;
y(1) = x(1)^2 - 5 ;
y(2) = x(2)^3 - x(1) ;
return
end