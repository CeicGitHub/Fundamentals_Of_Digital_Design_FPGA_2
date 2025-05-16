module demux #(
    parameter WIDTH = 1,
    parameter CHANNELS = 4
)(
    input  wire [WIDTH-1:0] in,
    input  wire [$clog2(CHANNELS)-1:0] sel,
    output reg  [WIDTH*CHANNELS-1:0] out
);

    integer i;

    always @(*) begin
        out = 0;
        for (i = 0; i < CHANNELS; i = i + 1) begin
            if (i == sel)
                out[i*WIDTH +: WIDTH] = in;
        end
    end

endmodule