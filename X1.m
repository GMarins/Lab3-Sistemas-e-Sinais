function [y] = X1( k )
%Fun��o que representa o sinal da quest�o 1 no dom�nio da frequ�ncia
%Obtido atrav�s da defini��o da s�rie de fourier
%Coeficientes calculados a partir da integral sobre um per�odo
%Per�odo = 2 ---> w = 2pi/T  ->>> w = pi
    w = pi;
    if k == 0
        y = 0.5; %Valor m�dio do sinal
    
    else
    y = 1./(k*w).*sin(k*w) + 1./(k*w).^2.*cos(k*w) - 1./(k*w).^2;
    end

end

