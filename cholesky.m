% Übungen zur Numerischen Mathematik, WS 2014/15
% Blatt 03, Aufgabe 10 (iii)
%  L=cholesky(A),
% Berechnung der Cholesky-Zerlegung von A.
% Autoren:
%   Janina Geiser, Mat Nr. 6420269
%   Michael Hufschmidt, Mat.Nr. 6436122
%   Farina Ohm, Mat Nr. 6314051
%   Annika Seidel, Mat Nr. 6420536
% Übungsleiter:
%   Thomas Berger <thomas.berger@uni-hamburg.de>
function [x] = cholesky(A)
w = size(A);
n = w(1);
if( n ~= w(2))
    fprintf('Die Matrix ist nicht nxn, statdessen : %d, %d', w(1),w(2))
end
L = zeros(n);
for k=1:n
    L(k,k) = sqrt(A(k,k) - sum((L(k,1:k-1)).^2));
    for i=k+1:n
        L(i,k) = 1/L(k,k).*(A(i,k));
        for j= 1:k-1
            L(i,k)=L(i,k)-L(i,j).*L(k,j)';
        end
    end
end
disp(L)