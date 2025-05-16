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
