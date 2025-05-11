/*Este corresponde al modulo principal de la practica, debe estar en top entity
Aqui se conectan los switches a la entrada de los displays de 7 segmentos*/

module top(
    input [17:0] SW, 	//Entradas de los 18 switches si esta todo alto es: "262143"
    output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6 //Salida 7 displays de 7 segmentos (hex0 a hex6)
);
    wire [3:0] bcd [6:0]; //Este es un arreglo de 7 digitios del bcd a los 4 bits bcd0 a bcd6

	 //Esta es una instancia de modulo que convierte el binario a bcd
    binary_to_bcd converter(
        .binary(SW), 			//entrada binaria 18 bits a los switches
        .bcd6(bcd[6]),			//digito más significativo (centenas de millar)
        .bcd5(bcd[5]),
        .bcd4(bcd[4]),
        .bcd3(bcd[3]),
        .bcd2(bcd[2]),
        .bcd1(bcd[1]),
        .bcd0(bcd[0])        //digito menos signitico (unidades)
    );

	 //Instancia de decodificador bcd 7segmentos para cada dígito
    bcd_to_7seg disp0(.bcd(bcd[0]), .seg(HEX0)); //unidades
    bcd_to_7seg disp1(.bcd(bcd[1]), .seg(HEX1)); //decenas
    bcd_to_7seg disp2(.bcd(bcd[2]), .seg(HEX2)); //centenas
    bcd_to_7seg disp3(.bcd(bcd[3]), .seg(HEX3)); //unidades de mil
    bcd_to_7seg disp4(.bcd(bcd[4]), .seg(HEX4)); //decenas de mil
    bcd_to_7seg disp5(.bcd(bcd[5]), .seg(HEX5)); //centenas de mil
    bcd_to_7seg disp6(.bcd(bcd[6]), .seg(HEX6)); //millón (solo mostrara 0,1,2 en este caso)
endmodule
