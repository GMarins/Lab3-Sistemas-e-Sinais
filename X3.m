function [ y ] = X3( k )
%%Função que representa o sinal da questão 2 no domínio da frequência
% Período = 4
    o = 2*pi/ 4;
    y = 1/4*cos(2*k*o) + 1/4*cos(k*o);
   

end

