function [y] = X1( k )
%Função que representa o sinal da questão 1 no domínio da frequência
%Obtido através da definição da série de fourier
%Coeficientes calculados a partir da integral sobre um período
%Período = 2 ---> w = 2pi/T  ->>> w = pi
    w = pi;
    if k == 0
        y = 0.5; %Valor médio do sinal
    
    else
    y = 1./(k*w).*sin(k*w) + 1./(k*w).^2.*cos(k*w) - 1./(k*w).^2;
    end

end

