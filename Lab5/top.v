module top (
    input [17:0] SW,
    output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7,
    output [7:0] LEDG,
    output [17:0] LEDR
);
    wire [3:0] A = SW[3:0];
    wire [3:0] B = SW[7:4];
    wire [3:0] SEL = SW[17:14];
    wire mode = SW[13];
    wire [7:0] RESULT;
    wire is_negative = RESULT[7];
    wire [7:0] abs_result = is_negative ? (~RESULT + 1'b1) : RESULT;

    wire [3:0] a_ones, a_tens;
    wire [3:0] b_ones, b_tens;
    wire [3:0] r_hundreds, r_tens, r_ones;

    alu4bit alu_inst(.A(A), .B(B), .SEL(SEL), .RESULT(RESULT));

    binary_to_bcd bcd_a(.binary({4'b0000, A}), .hundreds(), .tens(a_tens), .ones(a_ones));
    binary_to_bcd bcd_b(.binary({4'b0000, B}), .hundreds(), .tens(b_tens), .ones(b_ones));
    binary_to_bcd bcd_r(.binary(abs_result), .hundreds(r_hundreds), .tens(r_tens), .ones(r_ones));

    assign LEDG = RESULT;
    assign LEDR[3:0] = A;
    assign LEDR[7:4] = B;
    assign LEDR[17:14] = SEL;

    // HEX displays depending on mode
    // Result
    hex7seg h0(.num(mode ? r_ones     : RESULT[3:0]), .seg(HEX0));
    hex7seg h1(.num(mode ? r_tens     : RESULT[7:4]), .seg(HEX1));
    hex7seg h2(.num(mode ? r_hundreds : 4'd0),        .seg(HEX2));
    assign HEX3 = mode ? (is_negative ? 7'b0111111 : 7'b1111111) : 7'b1111111; // muestra guión si negativo

    // Input B
    hex7seg h4(.num(mode ? b_ones : B), .seg(HEX4));
    hex7seg h5(.num(mode ? b_tens : 4'd0), .seg(HEX5));

    // Input A
    hex7seg h6(.num(mode ? a_ones : A), .seg(HEX6));
    hex7seg h7(.num(mode ? a_tens : 4'd0), .seg(HEX7));
endmodule