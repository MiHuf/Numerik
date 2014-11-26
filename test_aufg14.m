% Uebungen zur Numerischen Mathematik, WS 2014/15
% Blatt 04, Aufgabe 14
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
clc
clear all

n = 10 ;
A = 2*diag(ones(1,n))-diag(ones(1,n-1),1)-diag(ones(1,n-1),-1) ;
b = zeros(n,1) ;
b(1) = 1 ;
b(n) = 1 ;
eps = 1e-12 ;                     % Fehler
size = [2 inf] ;                  % Size der r_ev und r_gv Matrizen

disp('Gesamtschritt-Verfahren: x =')
xg = gv(A, b, eps) ;
disp(xg)
% Einlesen der Daten fuer den Plot
fi = fopen('gv.dat','r');
r_gv = fscanf(fi, '%d %e', size) ;
fclose(fi) ;
max_gv = max(r_gv(1,:)) ;

disp('Einzelschritt-Verfahren: x =')
xe = ev(A, b, eps) ;
disp(xe)
% Einlesen der Daten fuer den Plot
fi = fopen('ev.dat','r');
r_ev = fscanf(fi, '%d %e', size) ;
fclose(fi) ;
max_ev = max(r_ev(1,:)) ;

% Plotte die Ergebnisse
semilogy(r_gv(1,1:max_gv), r_gv(2,1:max_gv),  'r-', 'linewidth', 2) ;
xlabel('Anzahl Schritte', 'FontSize', 12) ;
ylabel('Residumm, logarithmisch',  'FontSize', 12) ;
grid on ;
hold on ;
semilogy(r_ev(1,1:max_ev), r_ev(2,1:max_ev),  'g-', 'linewidth', 2) ;
legend('Gesamtschritt-Verfahren', 'Einzelschritt-Verfahren') ;
title('Einzelschritt-Verfahren konvergiert doppelt so schnell !', 'FontSize', 12, 'FontWeight', 'bold') 
