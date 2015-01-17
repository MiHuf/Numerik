% Übungen zur Numerischen Mathematik, WS 2014/15
% Blatt 03, Aufgabe 10 (iv)
%   x=choleskysol(L,b),
% gegeben L untere Dreiecksmatrix, b;
% Berechnung der Lösung x von L L* x = b
% mittels Vorwärts- und Rückwärts-einsetzen.
% Autoren:
%   Janina Geiser, Mat Nr. 6420269
%   Michael Hufschmidt, Mat.Nr. 6436122
%   Farina Ohm, Mat Nr. 6314051
%   Annika Seidel, Mat Nr. 6420536
% Übungsleiter:
%   Thomas Berger <thomas.berger@uni-hamburg.de>

function[x]=choleskysol(L,b)
w=size(L);
n=w(1);
y=zeros(n,1);
x=zeros(n,1);
%Bestimmung von y für y=L'x mithilfe von b=Ly
for i=1:n
    s=b(i);
    for j=1:i-1
        s=s-L(i,j).*y(j);
    end
    y(i)=s./L(i,i);
end
%Bestimmung von x
for i=n:-1:1
    s=y(i);
    for k=i+1:n
        s=s-L(k,i).*x(k);
    end
    x(i)=s./L(i,i);
end