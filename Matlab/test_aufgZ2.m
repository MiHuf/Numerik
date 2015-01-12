% Uebungen zur Numerischen Mathematik, WS 2014/15
% Blatt 06, Aufgabe Z2
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

n =  20 ;      % Anzahl Grid-Punkte, somit n-1 Intervalle
eps = 1.0e-8 ; % Fehler beim Einzelschritt-Verfahren
h = 1/n ;      % Intervall-Länge

[A b] = RWP(n) ;
U_Vector = ev(A, b, eps) ;   % Lösung mit Einzelschritt-Verfahren
U_Matrix = transpose(reshape(U_Vector, n, n)) ;
U_Exact = zeros(n,n) ;
% Mit x(i) = (i-1)*h; y(i) = (j-1)*h wird
% (i,j) = (1,1) ... (n+1, n+1), also eine (n+1)x(n+1) Matrix
% (x,y) = (0,0) ... (1,1)
for i=1:n
    x = (i-1) * h ;
    for j=1:n
        y = (j-1) * h ;
        U_Exact (i,j) = cos(2*pi*y)*x^2*(1-x)^2 ;
    end
end
Diff = U_Matrix - U_Exact ;

% U_Matrix
subplot(3, 1, 1)

surf(U_Matrix)
xlabel('x', 'FontSize', 12); ylabel('y', 'FontSize', 12) ; zlabel('u', 'FontSize', 12) ;
title('u(x,y) - Numerisch') ;
hold on
% U_Exact 
subplot(3, 1, 2)
surf(U_Exact)
xlabel('x', 'FontSize', 12); ylabel('y', 'FontSize', 12) ; zlabel('u', 'FontSize', 12) ;
title('u(x,y) - Exakt') ;
% U_Differenz
subplot(3, 1, 3)
surf(Diff)
xlabel('x', 'FontSize', 12); ylabel('y', 'FontSize', 12) ; zlabel('d u', 'FontSize', 12) ;
title('Fehler') ;

D = norm(Diff, 2) ;
fprintf('Fehler (Spektralnorm der Differenz-Matrix) = %e\n',D) ;
