/*Este modulo se debugea directamente en la FPGA para observar el "demultiplexor"
esta haciendo uso del archivo demux.v*/

/*This module is part from demux functionaly allow the main 
	functionality in the fpga instance
Was did by: Team14: Alonso Emmanuel Lopez Macias & Cesar Eduardo Inda Ceniceros
*/

module top_demux_fpga(
    input  wire [17:0] SW,
    output wire [7:0] LEDG
);

    wire [2:0] sel = SW[2:0];
    wire in_demux = SW[17];
    wire [7:0] out;

    demux #(.WIDTH(1), .CHANNELS(8)) uut (
        .in(in_demux),
        .sel(sel),
        .out(out)
    );

    assign LEDG = out;

endmodule
