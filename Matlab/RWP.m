% Uebungen zur Numerischen Mathematik, WS 2014/15
% Zusatz-Blatt, Aufgabe Z2
%
% Autoren:
%   Janina Geiser, Mat Nr. 6420269
%   Michael Hufschmidt, Mat.Nr. 6436122
%   Farina Ohm, Mat Nr. 6314051
%   Annika Seidel, Mat Nr. 6420536
% Uebungsleiter:
%   Thomas Berger <thomas.berger@uni-hamburg.de>


% Matrix und Inhomogenität für diskrete Poisson-Gleichung
function [A,b] = RWP(n)
    h = 1/n;
    % Laut Aufgabenblatt:
    % f = @(x,y) cos(2*pi*y) * ((4*pi^2 + 1) * x^2 * (1-x^2) - (2-12*x+12*x^2));
    % Korrigiert:
    f = @(x,y) cos(2*pi*y) * ((4*pi^2 + 1) * x^2 * (1-x)^2 - (2-12*x+12*x^2));
    
    A = DiscreteLaplacian(n, h);
    b = DiscreteInhomogenity(f, n, h);
end

% Berechnet den diskretisierten negativen Laplace-Operator
function L = DiscreteLaplacian(n, h)
    D = diag(4 * ones(1,n)) - diag(ones(1,n-1),1) - diag(ones(1,n-1),-1);
    D(1,n) = -1;
    D(n,1) = -1;
    A = diag(ones(1,n-1),1) + diag(ones(1,n-1),-1);
    A(1,n) = 1;
    A(n,1) = 1;
    L = (kron(eye(n),D) - kron(A,eye(n))) / h^2 + eye(n*n);
end

% Füllt den Vektor b mit den Funktionswerten der Inhomogenität
% f an den Stützstellen (i*h, j*h) für i,j = 1,...,n
function b = DiscreteInhomogenity(f, n, h)
    b = zeros(n*n, 1);
    k = 1;
    for i = 1:n;
        for j = 1:n;
            b(k) = f((i-1)*h, (j-1)*h);
            k = k + 1;
        end
    end
end
