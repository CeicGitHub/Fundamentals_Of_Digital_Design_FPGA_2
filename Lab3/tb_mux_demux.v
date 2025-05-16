/*Este modulo es de "testbench" y trabaja en conjunto con el "top_mux_demux" 
para funcionar en Model Sim*/

/*Requerimientos (modificar en "parameter")

	1.- WIDTH = 32;
	1.- CHANNELS = 4;
	
	2.- WIDTH = 1;
	2.- CHANNELS = 8;
	
	3.- WIDTH = 18;
	3.- CHANNELS = 16;

*/


`timescale 1ns/1ps

module tb_mux_demux;

    /*Parametros de las pruebas, aqui se pueden modificar dependiendo que requerimientos se necesite
	 en los requerimientos estan algunos ejemplos de arriba*/
	 
    parameter WIDTH = 32;
    parameter CHANNELS = 4;
    localparam SEL_WIDTH = $clog2(CHANNELS);

    reg [WIDTH*CHANNELS-1:0] mux_in;
    reg [SEL_WIDTH-1:0] sel;
    wire [WIDTH-1:0] mux_out;

    reg [WIDTH-1:0] demux_in;
    wire [WIDTH*CHANNELS-1:0] demux_out;

    // Instancias
    mux #(WIDTH, CHANNELS) uut_mux (
        .in(mux_in),
        .sel(sel),
        .out(mux_out)
    );

    demux #(WIDTH, CHANNELS) uut_demux (
        .in(demux_in),
        .sel(sel),
        .out(demux_out)
    );

    integer i;
    initial begin
        // Prueba de todos los canales
        mux_in = 0;
        for (i = 0; i < CHANNELS; i = i + 1) begin
            mux_in[i*WIDTH +: WIDTH] = i + 1;
        end

        for (i = 0; i < CHANNELS; i = i + 1) begin
            sel = i;
            #10;
            $display("MUX SEL=%0d -> OUT=%h", sel, mux_out);
        end

        // Prueba del demux
        for (i = 0; i < CHANNELS; i = i + 1) begin
            sel = i;
            demux_in = 32'hA5A5A5A5;
            #10;
            $display("DEMUX SEL=%0d -> OUT=%h", sel, demux_out);
        end

        $finish;
    end

endmodule

