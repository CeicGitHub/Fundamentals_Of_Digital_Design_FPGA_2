module top_fpga_mult (
    input  [15:0] SW,
    output [6:0] HEX0, HEX1, HEX2, HEX3,
                 HEX4, HEX5, HEX6, HEX7
);
    wire [7:0] A = SW[7:0];
    wire [7:0] B = SW[15:8];
    wire [15:0] P;

    // Instanciar multiplicador
    mult_Nbit_structural #(.N(8)) multiplier (
        .A(A),
        .B(B),
        .P(P)
    );

    // Decodificar entradas y salidas en hexadecimal
    hex_decoder h0 (.in(P[3:0]),   .seg(HEX0));
    hex_decoder h1 (.in(P[7:4]),   .seg(HEX1));
    hex_decoder h2 (.in(P[11:8]),  .seg(HEX2));
    hex_decoder h3 (.in(P[15:12]), .seg(HEX3));

    hex_decoder h4 (.in(B[3:0]),   .seg(HEX4));
    hex_decoder h5 (.in(B[7:4]),   .seg(HEX5));

    hex_decoder h6 (.in(A[3:0]),   .seg(HEX6));
    hex_decoder h7 (.in(A[7:4]),   .seg(HEX7));
endmodule
