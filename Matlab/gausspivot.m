% �bungen zur Numerischen Mathematik, WS 2014/15
% Blatt 03, Aufgabe 10 (i)
%   x=gausspivot(A,b)
% Berechnung von x durch Gauss-Algorithmus mit Pivotisierung
% Autoren:
%   Janina Geiser, Mat Nr. 6420269
%   Michael Hufschmidt, Mat.Nr. 6436122
%   Farina Ohm, Mat Nr. 6314051
%   Annika Seidel, Mat Nr. 6420536
% �bungsleiter:
%   Thomas Berger <thomas.berger@uni-hamburg.de>

function [x] = gausspivot(A, b)
n = length(b) ;
w = size(A) ;
if (n ~= w(1)) || (n ~= w(2))
    fprintf('%d x %d Matrix A passt nicht zum Vektor b mit der L�nge %d\n', w(1), w(2), n)
end
Ab = [A(:,:) b] ;
% disp('Erweiterte Koeffizientenmatrix:')
% disp(Ab)

for k = 1 : n
    % Suche Pivot-Spalte rk und Pivot-Element ark
    rk = k ;
    ark = Ab(k,k) ;
    for r = k+1 : n
        if abs(ark) < abs(Ab(r,k))
            rk = r ;
            ark = Ab(r,k) ;
        end
    end
    
    if (rk ~= k)
        %Tausche Zeilen rk und k
        % fprintf('k = %d, rk = %d, ark = %f  Ab vorher:\n', k, rk, ark)
        % disp(Ab)
        zeile = Ab(k,:) ;
        Ab(k,:) = Ab(rk,:) ;
        Ab(rk,:) = zeile ;
        % fprintf('k = %d, rk = %d, ark = %f  Ab nachher:\n', k, rk, ark)
        % disp(Ab)
    end
    if (abs(ark) < 1e-10)
        fprintf ('Matrix ist singul�r\n')
        return
    end
    
    % Mache obere Dreiecks-Matrix
    for i = k+1 : n
        for j = k+1 : n+1  % b(i) = Ab(i,n+1)
            Ab(i,j) = Ab(i,j) - Ab(i,k) * Ab(k,j) / Ab(k,k) ;
        end
        Ab(i,k) = 0 ;
    end
end

% Zum Testen die n�chsten 2 Zeilen auskommentieren
% disp ('Obere Dreiecks-Matrix:')
% disp(Ab)

x = zeros(n,1) ; % Spaltenvektor
% R�ckw�rts-Einsetzen mit Skalarprodukt
for i = n : -1 : 1
    x(i) = ( Ab(i,n+1) - Ab(i, i+1 : n) * x(i+1 : n) )  / Ab(i,i) ;
end

% disp('L�sung x = ')
% disp(x)
return
