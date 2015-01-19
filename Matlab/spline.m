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
function [M] = spline(xs, fs)
n = length(xs)  ;               % Anzahl n von Stützstellen
if n < 3
    error('3 Stützstellen sollten es schon sein!')
end
if length(fs) ~= n
    error('Anzahl der Stützstellen ungleich Anzahl der Stützwerte!')
end
h = zeros (n-1,1) ;             % n-1 Intervalle von h(1) bis h(n-1)
for j = 1:n-1
    h(j) = xs(j+1) - xs(j) ;
    if h(j) == 0
        error('Stützstellen müssen disjunkt sein!')
    end
end
A = zeros(n-1, n-1) ;           % Matrix für das LGS der Momente
k = zeros (n-1,1) ;             % Vektor für Hauptdiagonal-Elemente
k(1) = h(1) ;
for j = 1 : n-1                 % Zeilenweise
    if j > 1
        k(j) = h(j-1) + h(j) ;  % Hauptdiagonal-Elemente
    end
    A(j,j) = 2 * k(j) ;         % Hauptdiagonale
    if (j < n-1)
        A(j,j+1) = h(j) ;       % obere  Nebendiagonale
        A(j+1,j) = h(j) ;       % untere Nebendiagonale
    end
end
% Hier geht's mit den Indizes etwas durcheinander!
c = zeros (n-1,1) ;
c(1) = 6*(fs(2)-fs(1))/h(2) ;   % ??? 
for j = 2 : n-1                 % rechte Seite des LGS
    c(j) = 6*(fs(j+1)-fs(j))/h(j) - 6*(fs(j)-fs(j-1))/h(j-1) ;
end
% c(n-1) = 6*(fs(n)-fs(n-1))/h(n-1); % geht nicht!
m = A\c ;                       % Lösung des LGS: Momente m(1) ... m(n-1)
m = [0;m;0] ;                   % Natürliche Randbed: Momente m(1) = m(n+2) = 0
% Neu-Indizierung der Momente: statt j=1:n-1 jetzt j=1:n+1
M = zeros(4, n-1) ;             % Ergebnis-Matrix für n-1 Intervalle
for j = 1 : n-1
    M(1,j) = fs(j) ;            % alpha
    M(2,j) = (fs(j+1)-fs(j))/h(j) - h(j)*(2*m(j+1) + m(j+2))/6 ; % beta
    M(3,j) = m(j+1) / 2 ;         % gamma
    M(4,j) = (m(j+2) - m(j+1))/(6*h(j)) ; % delta
end
% Zum  Testen, dann muss spline.m in spline1.m unbenannt werden
% und der Aufruf in splineval entsprechend modifiziert werden.
% pp = spline(xs,fs) ;          % built-in function
% M = transpose(pp.coefs) ;     % Achtung: Umgekehrte Spalten-Reihenfolge
end
