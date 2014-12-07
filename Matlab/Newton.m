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
function [x] = Newton(F_handle, DF_handle, x0, eps)
% Berechnet die Nullstelle von F, mit Jacomi Matrix DF und Anfangswert x0
max_steps = 100 ;
n = length(x0) ;
x = zeros(n,1) ;                              % Spaltenvektor
steps = 0;
r = 100.0;                                    % Residuum
while (r > eps) && (steps < max_steps)
    steps = steps + 1 ;
    x1 = x0 - inv(DF_handle(x0)) * F_handle(x0) ;
    r = norm(F_handle(x1)) ;                  % Residuum
    x0 = x1 ;
end
x = x1 ;
end