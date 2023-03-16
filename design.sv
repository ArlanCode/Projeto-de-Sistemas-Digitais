module Contador (clk, rst, ud, cont);
  input reg clk, rst, ud; //CLOCK, RESET, UP/DOWN
  output cont; //CONTADOR
  
  
  reg[7:0] cont = 0;
  
  
  always @(posedge clk, posedge rst) begin
    if(rst) begin //RESETAR CONTADOR
    	cont <= 0;
    end
    
    else if(clk) begin
      if(ud == 1) begin //CONTAGEM CRESCENTE
      	cont++;
      end
      else begin //CONTAGEM DECRESCENTE
        cont--;
      end
    end
  end
endmodule: Contador



 /* Projeto 1 - Contador de 8 bits.

Descrição do projetO: 
    Desenvolva um circuito contador de 8 bits em SystemVerilog de acordo com a especificação abaixo:
      * RESET = Ativado em nível lógico alto, saída do contador será igual a zero, este sinal é prioritário sobre os demais, ele é assíncrono.
      * CLOCK = Transição ascendente;
      * UP/DOWN = Contagem crescente quando sinal igual a 1;
                = Contagem decrescente quando sinal igual a 0;


Interface do modulo: module contador ( clk, rst, ud, cont );
 */