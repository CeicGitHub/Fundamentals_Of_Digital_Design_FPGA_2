module top_mux_demux #(
	parameter WIDTH = 32,
	parameter CHANNELS = 4

)(
	input wire [WIDTH*CHANNELS-1:0] mux_in,
	input wire [WIDTH-1:0] demux_in,
	input wire [$clog2(CHANNELS)-1:0] sel,
	output wire [WIDTH-1:0] mux_out,
	output wire [WIDTH*CHANNELS-1:0] demux_out

);


	mux #(WIDTH, CHANNELS) u_mux (
		.in(mux_in),
		.sel(sel),
		.out(mux_out)
	);
	
	
	demux #(WIDTH, CHANNELS) u_demux (
		.in(demux_in),
		.sel(sel),
		.out(demux_out)
	);
	
endmodule

