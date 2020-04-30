% Questao2.m
clear all; close all; clc;

s = tf('s'); % Símbolo da F.T.
a = 2;
b = 1;

U=1/s;  % Degrau unitário
S1=(a*s+1)/(s^2+b*a*s+b);                                                   % F.Trans de Subsistema 1
S2=(s+2)/(s+6)/(s+1);                                                       % F.Trans de Subsistema 2
S3=(16*s^4+141*s^3+454*s^2+565*s+206)/(4*s+6)/(s+1)/(2*s+1)/(s^2+6*s+10);   % F.Trans de Subsistema 3
S4=7*(s+176/7)/(s+14)/(s+25);                                               % F.Trans de Subsistema 4
A=S1*S2*(S3+S4)/(1-(S1*S2*(S3+S4))/12);                                     % F.Trans de Subsistema 5
S5=A*S1;

step(S5);                                                                   % Grafico do sistema
Y=S5*U;
[z, p, k] = tf2zp(Y.num{1,1}, Y.den{1,1});                                  % Zeros, polos e ganhos (para degrau)
