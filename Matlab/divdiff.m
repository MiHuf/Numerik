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
function [D] = divdiff(Dalt, xalt, x, f)

if length(x) ~= length(f)
    error('Anzahl der Stützwerte müssen der Anzahl der Stützstellen entsprechen.')
end

%Erzeuge Matrix entsprechend dem Schema zur Berechnung der dividierten
%Differenzen.
if isempty(Dalt) && isempty(xalt)
    D(1:length(f),1) = f;
    
    %Berechne die Dividierten Differenzen.
    for i=1:length(f)-1
        for j=1:length(f)-i
            D(j+i,i+1) = (D(j+i,i)-D(j+i-1,i)) / (x(j+i)-x(j));
        end
    end
else
    D=zeros(length(xalt)+length(x), length(xalt)+length(x));
    D(1:length(xalt),1:length(xalt))=Dalt;
    D(length(xalt)+1:length(xalt)+length(x),1) = f;
    xneu=(length(xalt)+length(x));
    xneu(1:length(xalt))=xalt;
    xneu(length(xalt)+1:length(xalt)+length(x)) = x;

    %Berechne die neuen Dividierten Differenzen.
    for i=1:length(xneu)-1
        for j=length(xalt)+1:(length(xneu))
            D(j,i+1) = (D(j,i)-D(j-1,i)) / (xneu(j)-xneu(j-i));
        end
    end
end     