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

function [A, b] = RWP(n)
f = zeros(n,n) ;
h = 1 /(n + 1) ;
for i = 1:n
    x = (i) * h ;
    for j = 1:n
        y = (j) * h ;
        % f(i,j) = 10 * i + j  ;  % zum Testen
        f(i,j) = (pi^2 * (x^2 - x) - 2)* sin(pi * y) ;
    end
end
b = reshape (transpose(f), (n)^2, 1) ;
A = full(gallery('poisson', n)) ;
end


