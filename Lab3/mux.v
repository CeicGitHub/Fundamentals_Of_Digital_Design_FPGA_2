/*This module is part from mux functionaly allows the inputs
considerations for logic channels and the width parameter
Was did by: Team14: Alonso Emmanuel Lopez Macias & Cesar Eduardo Inda Ceniceros
*/

module mux #(
    parameter WIDTH = 1,
    parameter CHANNELS = 4
)(	
    input  wire [WIDTH*CHANNELS-1:0] in,  	//Aqui se concatenan las entradas
    input  wire [$clog2(CHANNELS)-1:0] sel,
    output wire [WIDTH-1:0] out
);

    assign out = in[sel*WIDTH +: WIDTH];

endmodule