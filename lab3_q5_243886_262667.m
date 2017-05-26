%%%%%%%%%%%%%%%%%%LAB 3 - QUEST�O 5 %%%%%%%%%%%%%%%%
%Gabriel Marins da Costa - 243886
%Arthur Koucher - 262667
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Deseja-se encontrar a representa��o por s�rie de Fourier da sa�da y(t) =
%Vout(t) do circuito RLC. R1 = 2,2; L1 = 1/12; C1 = 1/12; Vin(t) = x(t)/ Ts
%= 0.5s e T = 2s;
%a) Calcule a resposta ao salto considerando condi��es iniciais nulas
%b) Determine a resposta em frequ�ncia do circuito RLC atrav�s da aplica��o
%da Transformada de Fourier da resposta impulsiva;
%e) Calcule a transformada inversa atrav�s da itera��o e mostre, no mesmo
%gr�fico, os sinais x(t) e y(t) para -2<t<2.
%Conclus�o: Como feito no laborat�rio anterior, obtivemos a resposta ao
%impulso derivado a resposta ao degrau. Transformando a resposta ao impulso
%-h(t) - para o dom�nio da frequ�ncia - H(jw) - obtivemos a resposta em
%frequ�ncia do sistema. Pudemos tamb�m obter a resposta do sistema atrav�s
%da multiplica��o da resposta em frequ�ncia dos sinais - equivalente �
%convolu��o no dom�nio do tempo. Por fim, comparamos os resultados
%anal�ticos com os num�ricos.

clear all
clc

t = -2:0.001:2;
k = -50:50; %Coeficientes discretos da transformada

%Constantes obtidas por inspe��o na resposta ao salto
A = (-21 + 11*sqrt(21))/42;
B = (-21-11*sqrt(21))/42;

%Ra�zes da equa��o caracter�stica
r1= (-66-6*sqrt(21))/5; 
r2= (-66+6*sqrt(21))/5;

Ts = 0.5;
T = 2;
w0 = pi;

s= (A*exp(r1*t)+B*exp(r2*t)+1).*(t>=0);  %Resposta ao degrau
h= (r1*A*exp(r1*t)+r2*B*exp(r2*t)).*(t>=0);  %Resposta ao impulso



fig = figure
fig.Name = 'Quest�o 5';

subplot(2,1,1)
plot(t,s);
xlabel('t');
ylabel('s(t');
title('Resposta ao pulso');
grid on;

subplot(2,1,2)
plot(t,h);
xlabel('t');
ylabel('h(t)');
title('Resposta ao impulso');
grid on;

w = k*w0;
H= -(r1*A)./(r1-i*w)-(r2*B)./(r2-i*w);  %Resposta em frequ�ncia do sistema

X= (2./(T*k*w0)).*(sin(k*w0*Ts));  %Entrada do sistema no dom�nio frequ�ncia
X(k==0) = 2*Ts/T;  %Ajuste para k = 0; substituir pelo valor m�dio

Y = H .* X; %Convolu��o no dom�nio da frequ�ncia - multiplica��o

%Descri��o do sinal de entrada por partes
x1 = 1*(t<(-T+Ts));    
x2= 1*(t>(T-Ts));  
x3= 1*(t>-Ts).*(t<Ts);  
x = x1+x2+x3;

fig2 = figure
fig2.Name = 'Quest�o 5';

subplot(3,1,1)
plot(t,x)
xlabel('t');
ylabel('x(t)');
title('Entrada');
grid on;
axis([-2 2 0 1.5])

subplot(3,1,2);
stem(k,abs(Y));
xlabel('k');   
ylabel('|Y[k]|');                                                                                                           
grid on;                                                                    
title('M�dulo de Y[k]');   

subplot(3,1,3);
stem(k,angle(Y));
xlabel('k');
ylabel('|Y[k]|'); 
title('Fase de Y[k]');
grid on;


y = 0;

for k = -250:250 %Redefinimos os termos para os novos k's
    w = k*w0;
    X= (2./(T*k*w0)).*(sin(k*w0*Ts));
    X(k==0) = 2*Ts/T;
    H= -(r1*A)./(r1-i*w)-(r2*B)./(r2-i*w);
    Y = H .* X;
    y = y + Y.*exp(j*k*w0*t);
end

fig3 = figure;
fig3.Name = 'Quest�o 5';

subplot(2,1,1)

plot(t,real(y));
xlabel('t');
ylabel('Valor do sinal');
grid on;
hold on;
plot(t,x);
legend('y(t)','x(t)');

subplot(2,1,2)
plot(t,s);
xlabel('t');
ylabel('s(t)'); %Resposta ao salto para t>0 � id�ntica � resposta da convolu��o.
title('Resposta ao Pulso');
grid on;
