% �bungen zur Numerischen Mathematik, WS 2014/15
% Blatt 03, Aufgabe 10 (ii)
%   [L,R,p]=lrpivot(A)
% Berechnung der LR-Zerlegung von A mit Pivotisierung,
% wobei hierbei p ein Permutationsvektor sein soll.
% Autoren:
%   Janina Geiser, Mat Nr. 6420269
%   Michael Hufschmidt, Mat.Nr. 6436122
%   Farina Ohm, Mat Nr. 6314051
%   Annika Seidel, Mat Nr. 6420536
% �bungsleiter:
%   Thomas Berger <thomas.berger@uni-hamburg.de>

function[L,R,p] = lrpivot(A)
    w = size(A);
    n=w(1);
    p = 1:n; 
    p=p';%Permutationsvektor als Spaltenvektor
    if( n ~= w(2))
        fprintf('Die Matrix ist nicht nxn, statdessen : %d, %d\n', w(1),w(2))
    end
    for k = 1:n-1
        r = getmax(A,k,n);
        if A(r,k) == 0
            fprintf('Matrix nicht in Gl\n');
        end
        if k ~= r
            for i=1:n
                temp = A(r,i);
                A(r,i) = A(k,i);
                A(k,i) = temp;
            end
            temp = p(r);
            p(r) = p(k);
            p(k) = temp;
        end
        for i=k+1:n
            A(i,k) = A(i,k)./A(k,k);
            for j=k+1:n
                A(i,j) = A(i,j)-A(i,k).*A(k,j);
            end
        end
    end
    if A(n,n) == 0
        fprintf('Matrix nicht in Gl\n');
    end
%Berechnung von L und R
    L = eye(n);
    R = zeros(n);
    for i=1:n
        for j= 1:n
            if(i>j)
                L(i,j)= A(i,j);
            else
                R(i,j) =A(i,j);
            end
        end
    end
    %folgende Zeilen einkommentieren wenn der Permutationsvektor als
    %Permutationsmatrix ausgegeben werden soll
    %C=eye(n);
    %p=C(p,:);
    %disp(p);
end
%bestimmen des betragsm��ig gr��ten Elements in einer Spalte k der Matrix A
function[r] = getmax(A,k,n)
    a = A(k,k);
    r = k;
    for i=k:n
        if abs(a) < abs(A(i,k))
            a = A(i,k);
            r=i;
        end
    end
end