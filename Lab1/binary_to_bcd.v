//Este modulo cinvierte el binario de 18 bits a 7 dígitos bcd usando el "double dabble"

module binary_to_bcd(
    input [17:0] binary, //entrada binaria de 18 bits (valor maximo = 262143)
    output reg [3:0] bcd6, bcd5, bcd4, bcd3, bcd2, bcd1, bcd0 //salidas 7 digitos bcd a 4 bits de cada uno
);
    integer i;
    reg [55:0] shift_reg; //registro de desplazamiento 18 bots de entrada + 7*4 bits BCD = 46, se usan 56 bits por seguridad

    always @(*) begin
        shift_reg = 56'b0; 		 //se inicializa el registro a 0
		  shift_reg[17:0] = binary; //se coloca el numero binario en los bits menos significativos

		//aqui el double dabble se ejecutara 18 ciclos
		for (i = 0; i < 18; i = i + 1) begin
    
	 //aqui se corrige el bcd si es >=5 antes de desplazar
    if (shift_reg[21:18] >= 4'd5) shift_reg[21:18] = shift_reg[21:18] + 4'd3;
    if (shift_reg[25:22] >= 4'd5) shift_reg[25:22] = shift_reg[25:22] + 4'd3;
    if (shift_reg[29:26] >= 4'd5) shift_reg[29:26] = shift_reg[29:26] + 4'd3;
    if (shift_reg[33:30] >= 4'd5) shift_reg[33:30] = shift_reg[33:30] + 4'd3;
    if (shift_reg[37:34] >= 4'd5) shift_reg[37:34] = shift_reg[37:34] + 4'd3;
    if (shift_reg[41:38] >= 4'd5) shift_reg[41:38] = shift_reg[41:38] + 4'd3;
    if (shift_reg[45:42] >= 4'd5) shift_reg[45:42] = shift_reg[45:42] + 4'd3;

    shift_reg = shift_reg << 1; //se hace un desplazamiento a la izquierda (con el bit nuevo)
        end
	//se extraen los 7 digitos del bcd del registro
	bcd6 = shift_reg[45:42]; //digito mas signiticativo
	bcd5 = shift_reg[41:38];
	bcd4 = shift_reg[37:34];
	bcd3 = shift_reg[33:30];
	bcd2 = shift_reg[29:26];
	bcd1 = shift_reg[25:22];
	bcd0 = shift_reg[21:18]; //digito menos significativo

    end
endmodule