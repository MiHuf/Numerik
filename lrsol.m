% Übungen zur Numerischen Mathematik, WS 2014/15
% Blatt 03, Aufgabe 10 (v)
%   x=lrsol(L,R,p,b)
% gegeben L untere Dreiecksmatrix mit Einsen auf der Hauptdiagonalen,
% R obere Dreiecksmatrix, p Permutationsvektor, b .
% Berechnung der Lösung von L R x = P b
% mittels Vorwärts- und Rückwärts-einsetzen.
% Autoren:
%   Janina Geiser, Mat Nr. 6420269
%   Michael Hufschmidt, Mat.Nr. 6436122
%   Farina Ohm, Mat Nr. 6314051
%   Annika Seidel, Mat Nr. 6420536
% Übungsleiter:
%   Thomas Berger <thomas.berger@uni-hamburg.de

function [x] = lrsol(L, R, p, b)

% Vorbereitung
w = size(L) ;
n=w(1) ;
x = zeros(n,1) ; % Spaltenvektor
y = zeros(n,1) ; % Spaltenvektor

% Bestimme y mit L * y = P * b durch Vorwärts-Einsetzen mit Skalarprodukt
for i = 1 : n
    % wegen L(i,i) = 1 entfällt (...) / L(i,i)
    y(i) = ( b(p(i)) - L(i, 1 : i-1) * y(1 : i-1) )  ;
end
% Zum Testen die nächsten 2 Zeilen einkomentieren
% disp('y = ')
% disp (y)

% Bestimme x mit R x = y durch Rückwärts-Einsetzen mit Skalarprodukt
for i = n : -1 : 1
    x(i) = ( y(i) - R(i, i+1 : n) * y(i+1 : n) ) ./ R(i,i) ;
end

end