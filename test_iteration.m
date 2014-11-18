% Uebungen zur Numerischen Mathematik, WS 2014/15
% Blatt 04, Aufgabe 14 (i)
%   x = gv(A, b, eps)
%   x = ev(A, b, eps)
% Gegeben A in Gl_n(K), b in K^n, Abbruchparameter eps > 0.
% Bestimme Loesung von A x = b mittels Gesamt-
% und Einzelschrittverfahren.
% Geben Sie auch in jedem Schritt den Fehler | x - x^k | aus.
%
% Autoren:
%   Janina Geiser, Mat Nr. 6420269
%   Michael Hufschmidt, Mat.Nr. 6436122
%   Farina Ohm, Mat Nr. 6314051
%   Annika Seidel, Mat Nr. 6420536
% Uebungsleiter:
%   Thomas Berger <thomas.berger@uni-hamburg.de>
%
% clc
% clear all
function test_iteration

n = 10 ;
A = 2*diag(ones(1,n))-diag(ones(1,n-1),1)-diag(ones(1,n-1),-1) ;
b = zeros(n,1) ;
b(1) = 1 ;
b(n) = 1 ;
max_steps = 1000 ;
xx = A \ b ;  % die exakte Loesung
eps = 1e-7 ;


    function [r] = residuum(x1, x2)
        % Berechnet den Betrag von |x1 - x2| (in Euklidische Norm)
        r = norm(x2 - x1);
    end

    function[x_neu] = gv_step(A, b, x_alt)
        % Macht einen Einzel_Step im Gesamtschrittverfahren und berechnet x
        n = length(b);
        x_neu = zeros(n,1) ; % Spaltenvektor
        for i = 1 : n
            x_neu(i) = (b(i) - A(i, 1:i-1) * x_alt(1:i-1) - A(i, i+1:n) * x_alt(i+1:n))/ A(i,i) ;
        end
    end

    function[x] = gv(A, b, eps)
        % Loest A x = b mittels Gesamtschrittverfahren
        n = length(b);
        x_alt = zeros(n,1) ; % Spaltenvektor
        x_neu = zeros(n,1) ; % Spaltenvektor
        r = 1000 ;
        steps = 0;
        while (r > eps) && (steps < max_steps)
            steps = steps + 1;
            x_neu = gv_step(A, b, x_alt) ;
            r = residuum (x_neu, xx) ;
            x_alt = x_neu ;
        end
        fprintf('Gesamtschrittverfahren: Fehler nach %d Schritten = %e\n', steps, r)
        x = x_neu;
    end
xg = gv(A, b, eps)

    function[x_neu] = ev_step(A, b, x_alt)
        % Macht einen Einzel_Step im Einzelschrittverfahren und berechnet x
        n = length(b);
        x_neu = zeros(n,1) ; % Spaltenvektor
        for i = 1 : n
            x_neu(i) = (b(i) - A(i, 1:i-1) * x_neu(1:i-1) - A(i, i+1:n) * x_alt(i+1:n)) / A(i,i) ;
        end
    end

    function[x] = ev(A, b, eps)
        % Loest A x = b mittels Einzelschrittverfahren
        n = length(b);
        x_alt = zeros(n,1) ; % Spaltenvektor
        x_neu = zeros(n,1) ; % Spaltenvektor
        r = 1000 ;
        steps = 0;
        while (r > eps) && (steps < max_steps)
            steps = steps + 1;
            x_neu = ev_step(A, b, x_alt) ;
            r = residuum (x_neu, xx) ;
            x_alt = x_neu ;
        end
        fprintf('Einzelschrittverfahren: Fehler nach %d Schritten = %e\n', steps, r)
        x = x_neu;
    end
xe = ev(A, b, eps)

end