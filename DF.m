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

function[J] = DF(x)
% Berechnet die Jacobi-Matrix von F an der Stelle x gemaess Uebungsblatt
n = size(x) ;
n = 2 ;
J = zeros(n,n) ;
J(1,1) = 2 * x(1) ;
J(1,2) = 0 ;
J(2,1) = -1 ;
J(2,2) = 3 * x(2)^2 ;
return
end