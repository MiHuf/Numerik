% Übungen zur Numeriischen Mathematik, WS 2014/15
% Blatt 02, Aufgabe 4
% Autoren: 
% Janina Geiser, Mat Nr. 6420269
% Michael Hufschmidt, Mat.Nr. 6436122
% Farina Ohm, Mat Nr. 6314051
% Annika Seidel, Mat Nr. 6420536

clear all
clc

v = sqrt(2);
A = [1/v 1/v ; -1/v 1/v];

disp('Matrix A')
disp(A)
Ai = inv(A);
disp ('Inverse Ai von A:')
disp(Ai)

ATA = A' * A;
disp ('AT * A')
disp (ATA)
disp ('Eigenwerte von AT * A')
EATA = eig(ATA);
disp(EATA)

AiTAi = Ai' * Ai;
disp ('AiT * Ai')
disp (AiTAi)

EAiTAi = eig(AiTAi);
disp ('Eigenwerte von AiT * Ai')
disp(EAiTAi)

fprintf('Konditionen von A:\n Norm 1 = %f \n Norm 2 = %f \n Frobenius = %f\n Infinity  = %f\n\n\n', cond(A,1), cond(A,2), cond(A,'fro'), cond(A, inf))



B = [1 2 0 ; 0 1 0 ; 0 1 1];
disp('Matrix B')
disp(B)

Bi = inv(B);
disp ('Inverse Bi von B:')
disp(Bi)


BTB = B' * B;
disp ('BT * B')
disp(BTB)

EBTB = eig(BTB);
disp ('Eigenwerte von BT * B')
disp(EBTB)

BiTBi = Bi' * Bi;
disp ('BiT * Bi')
disp (BiTBi)

EBiTBi = eig(BiTBi);
disp ('Eigenwerte von BiT * Bi')
disp(EBiTBi)

fprintf('Konditionen von B:\n Norm 1 = %f \n Norm 2 = %f \n Frobenius = %f\n Infinity  = %f\n\n\n', cond(B,1), cond(B,2), cond(B,'fro'), cond(B, inf))
