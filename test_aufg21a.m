% Uebungen zur Numerischen Mathematik, WS 2014/15
% Blatt 06, Aufgabe 21a
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

n =  5 ;
eps = [1.0e-1 1.0e-2 1.0e-4 1.0e-6] ;
[A b] = RWP(n) ;

for e = 1:4
    eps(e)
    yev = ev(A, b, eps(4));
    xev = reshape (yev, n, n) ;
    xev
    ygv = ev(A, b, eps(4));
    xgv = reshape (ygv, n, n) ;
    xgv
end

