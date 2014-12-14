% Uebungen zur Numerischen Mathematik, WS 2014/15
% Blatt 08, Aufgabe 28
%
% Autoren:
%   Janina Geiser, Mat Nr. 6420269
%   Michael Hufschmidt, Mat.Nr. 6436122
%   Farina Ohm, Mat Nr. 6314051
%   Annika Seidel, Mat Nr. 6420536
% Uebungsleiter:
%   Thomas Berger <thomas.berger@uni-hamburg.de>
%
function [y] = intpolval(x,D,xst)

%[xa ya]=size(D)
if length(xst) ~= size(D)
    error('Matrixdimension muss der Dimension von xst entsprechen.')
end

%Berechne das Polynom p an Stelle x.
for i=1:length(xst)-1
    p(1) = D(1,1);
    r(1) = x-xst(1);
    r(i+1) = r(i)*(x-xst(i+1));
    p(i+1) = p(i) + D(i+1,i+1)*r(i);
end   

%Weise y das n-te Polynom an Stelle x zu.
y= p(length(xst));

