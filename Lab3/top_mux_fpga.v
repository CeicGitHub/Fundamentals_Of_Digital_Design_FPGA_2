/*Este modulo se debugea directamente en la FPGA para observar el "multiplexor"
esta haciendo uso del archivo mux.v*/

/*This module is part from fpga functionaly working for the main module
	the parameter to take account is the channels section and instances
Was did by: Team14: Alonso Emmanuel Lopez Macias & Cesar Eduardo Inda Ceniceros
*/
module top_mux_fpga(
    input  wire [17:0] SW,
    output wire [7:0] LEDG
);

    wire [7:0] in_mux = SW[17:10];
    wire [2:0] sel = SW[2:0];
    wire out;

    mux #(.WIDTH(1), .CHANNELS(8)) uut (
        .in(in_mux),
        .sel(sel),
        .out(out)
    );

    assign LEDG[0] = out;
    assign LEDG[7:1] = 7'b0;

endmodule