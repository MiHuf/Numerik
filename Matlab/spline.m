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
k = zeros (n-1,1) ;             % Hauptdiagonal-Elemente
k(1) = h(1) ;
for j = 1 : n-1
    if j > 1
        k(j) = h(j-1) + h(j) ;  % Hauptdiagonal-Elemente
    end
    A(j,j) = 2 * k(j) ;         % Hauptdiagonale
    if (j < n-1)
        A(j,j+1) = h(j) ;       % obere  Nebendiagonale
        A(j+1,j) = h(j) ;       % untere Nebendiagonale
    end
end
c = zeros (n-1,1) ;
c(1) = 0 ;                      % ???
for j = 2 : n-1                 % rechte Seite des LGS 
    c(j) = 6*((fs(j+1)-fs(j))/h(j) - (fs(j)-fs(j-1))/h(j-1)) ;
end
m = A\c ;                       % Lösung des LGS: Momente m_1 ... m_n-1  
m = [0;m;0] ;                   % Natürliche Randbed: Momente m_0 ... m_n 

M = zeros(n, 4) ;               % Ergebnis-Matrix
for j = 1 : n-1
    M(j,1) = fs(j) ;            % alpha
    M(j,2) = (fs(j+1)-fs(j))/h(j) - h(j)*(2*m(j) + m(j+1))/6 ; % beta
    M(j,3) = m(j) / 2 ;         % gamma
    M(j,4) = (m(j+1) - m(j))/(6*h(j)) ; % delta
end
end
