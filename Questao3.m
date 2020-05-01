% Questao3.m
clear all; close all; clc;

s = tf('s');												% Símbolo da F.T.
a = 2;
b = 1;

U=1/s;														% Degrau unitário
S1=(a*s+1)/(s^2+b*a*s+b);									% F.Trans de Subsistema 1
S2=(s)/(s+6)/(s+1);											% F.Trans de Subsistema 2
S3=(2+2/(8*s+4))*S2+(3*s+1)/(2*s^2+12*s+20)*2/(8*s+4);		% F.Trans de Subsistema 3
S4=7*(s+176/7)/(s+14)/(s+25);								% F.Trans de Subsistema 4
A=S1*S2*(S3+S4)/(1+(S1*S2*(S3+S4))/12);
S5=A*S1;													% F.Trans de Subsistema 5

step(S5, 18);												% Grafico do sistema para degrau
figure
Y=S5*U;
[z, p, k] = tf2zp(Y.num{1,1}, Y.den{1,1});					% Zeros, polos e ganhos (para degrau)
Y=minreal(S5*U, sqrt(eps)*2000000);							% Aproximar para somente os mais significativos
impulse(Y, 18);												% Grafico do sistema simplificado
[z_sim, p_sim, k_sim] = tf2zp(Y.num{1,1}, Y.den{1,1});		% Zeros, polos e ganhos (para degrau simplificado)