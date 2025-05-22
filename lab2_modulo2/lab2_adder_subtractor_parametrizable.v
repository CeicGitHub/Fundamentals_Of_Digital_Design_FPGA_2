module lab2_adder_subtractor_parametrizable #(parameter WIDTH = 4)(
    input  [WIDTH-1:0] a,
    input  [WIDTH-1:0] b,
    input  K, // 0 = suma, 1 = resta
    output [WIDTH-1:0] sum,
    output cout
);
    wire [WIDTH-1:0] b_xor;
    wire [WIDTH:0] carry;

    // Si K = 1 → complemento a 2: ~b + 1
    assign b_xor = b ^ {WIDTH{K}};
    assign carry[0] = K; // el +1 del complemento a 2

    genvar i;
    generate
        for (i = 0; i < WIDTH; i = i + 1) begin : gen_full_adders
            lab2_full_adder FA (
                .a(a[i]),
                .b(b_xor[i]),
                .cin(carry[i]),
                .sum(sum[i]),
                .cout(carry[i+1])
            );
        end
    endgenerate

    assign cout = carry[WIDTH]; // acarreo final

endmodule
