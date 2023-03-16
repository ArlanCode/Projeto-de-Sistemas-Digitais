
module test_contador;
  reg clk, rst, ud;
  reg [7:0] cont;
  
  Contador contador_8bits(.clk(clk), .rst(rst), .ud(ud), .cont(cont));
  
  initial begin
    
    //Contagem de 1 a 255
	rst <= 0;
    ud <= 1;
    $display("Contagem Crescente:");
    for( int i = 0; i < 255; i++)
      begin
      	clk <= 1;
        #1
        clk <= 0;
        #1
        $display("Cont = %d", cont);
      end
   	
    
    //Ativando o RESET
    rst <=1;
    #1
    $display("\nZerando Contador... Reset = %d\n", rst);
    
    
    //Contagem de 255 a 1
    rst <= 0;
    ud <= 0;
    $display("Contagem Decrescente:");
    for( int i = 0; i < 255; i++)
      begin
      	clk <= 1;
        #1
        clk <= 0;
        #1
        $display("Cont = %d", cont);
      end
    
    
    //Ativando o RESET
    rst <=1;
    #1
    $display("\nZerando Contador... Reset = %d\n", rst);
    
    
    //Invertendo O sentido da contagem
    rst <= 0;
    ud <= 1;
    $display("Verificando Inversão de Contagem:");
    for( int i = 0; i < 255; i++)
      begin
        if( i == 100 || i == 150 || i == 225)begin
          ud <= ~ud;
          #1
          $display("Invertendo Contagem... Up/Down = %d", ud);
        end
      	clk <= 1;
        #1
        clk <= 0;
        #1
        $display("Cont = %d", cont);
      end
    
    
    //Ativando o RESET
    rst <=1;
    #1
    $display("\nZerando Contador... Reset = %d\n", rst);
    
    
    //Verificando o RESET no meio da contagem
    rst <= 0;
    ud <= 1;
    $display("Verificando Reset:");
    for( int i = 0; i < 255; i++)
      begin
        if( i == 100 || i == 150 || i == 225)begin
          rst <= 1;
          #1
          $display("Reset Ativado");
          rst <= 0;
          $display("Reset Desativado");
          
        end
      	clk <= 1;
        #1
        clk <= 0;
        #1
        $display("Cont = %d", cont);
      end
    
  end
  
endmodule: test_contador
