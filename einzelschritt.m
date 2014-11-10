% Übungen zur Numerischen Mathematik, WS 2014/15
% Blatt 04, Aufgabe 14 (ii)
%   x = ev(A, b, eps)
% Gegeben A in Gl_n(K), b in K^n, Abbruchparameter eps > 0.
% Bestimme Lösung von A x = b mittels Einzelschrittverfahren.
% Geben Sie auch in jedem Schritt den Fehler | x - x^k | aus.
%
% Autoren:
%   Janina Geiser, Mat Nr. 6420269
%   Michael Hufschmidt, Mat.Nr. 6436122
%   Farina Ohm, Mat Nr. 6314051
%   Annika Seidel, Mat Nr. 6420536
% Übungsleiter:
%   Thomas Berger <thomas.berger@uni-hamburg.de>

 n = 10 ;
 A = 2*diag(ones(1,n))-diag(ones(1,n-1),1)-diag(ones(1,n-1),-1) ;
 b = zeros(n,1) ;
 b(1) = 1 ;
 b(n) = 1 ;
