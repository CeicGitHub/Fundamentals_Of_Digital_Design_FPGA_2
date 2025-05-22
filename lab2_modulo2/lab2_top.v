module lab2_top(
    input [17:0] SW,                   // SW[17:14] = A, SW[3:0] = B, SW[4] = K
    output [17:0] LEDR,
    output [8:0] LEDG,
    output [6:0] HEX0, HEX1, HEX2,
    output [6:0] HEX3, HEX4, HEX5
);
    wire [3:0] A = SW[17:14];
    wire [3:0] B = SW[3:0];
    wire K     = SW[4];

    wire [3:0] S;
    wire cout;

    assign LEDR[17:14] = A;
    assign LEDR[3:0] = B;
    assign LEDR[4] = K;
    assign LEDG[3:0] = S;

    lab2_adder_subtractor_parametrizable #(4) calc (
        .a(A),
        .b(B),
        .K(K),
        .sum(S),
        .cout(cout)
    );

    // Extiende S a 5 bits para que pueda representar hasta +15 sin ser confundido con negativo
    wire signed [4:0] signed_S = $signed({S[3], S});

    lab2_display_decimal disp (
        .value(signed_S),
        .HEX0(HEX0),
        .HEX1(HEX1),
        .HEX2(HEX2)
    );

    lab2_hex_7seg hexA (.in(A), .out(HEX5));
    lab2_hex_7seg hexB (.in(B), .out(HEX3));
    assign HEX4 = 7'b1111111; // apagado
endmodule
