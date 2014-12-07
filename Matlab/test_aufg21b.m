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
clc
clear all

x0 = [1 ; 1];                     % Anfangswert
eps = 1e-9 ;                      % Fehler
x = Newton (@F, @DF, x0, eps) ;
y = norm(F(x)) ;
disp('Ergebnis: Nullstelle bei x =');
disp(x) ;
disp('mit norm(F(x)) =') ;
disp(y) ;