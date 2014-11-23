% Uebungen zur Numerischen Mathematik, WS 2014/15
% Blatt 04, Aufgabe 14
%   x = gv(A, b, eps)
% Gegeben A in Gl_n(K), b in K^n, Abbruchparameter eps > 0.
% Bestimme Loesung von A x = b mittels Gesamt-
% und Einzelschrittverfahren.
%
% Autoren:
%   Janina Geiser, Mat Nr. 6420269
%   Michael Hufschmidt, Mat.Nr. 6436122
%   Farina Ohm, Mat Nr. 6314051
%   Annika Seidel, Mat Nr. 6420536
% Uebungsleiter:
%   Thomas Berger <thomas.berger@uni-hamburg.de>
%

function[x] = ev(A, b, eps)
% Loest A x = b mittels Gesamtschrittverfahren
max_steps = 10000 ;
n = length(b) ;
x_alt = zeros(n,1) ; % Spaltenvektor
x_neu = zeros(n,1) ; % Spaltenvektor
steps = 0;
r = 100.0;  % Residuum
while (r > eps) && (steps < max_steps)
    steps = steps + 1;
    for i = 1 : n
        x_neu(i) = (b(i) - A(i, 1:i-1) * x_neu(1:i-1) - A(i, i+1:n) * x_alt(i+1:n))/ A(i,i) ;
    end
    r = norm(x_alt - x_neu) ;
    x_alt = x_neu ;
end
x = x_neu;
end