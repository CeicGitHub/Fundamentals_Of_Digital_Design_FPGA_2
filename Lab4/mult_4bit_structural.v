module mult_4bit_structural (
    input  [3:0] A,
    input  [3:0] B,
    output [7:0] P
);
    wire [3:0] pp0, pp1, pp2, pp3;

    // Generación de productos parciales
    assign pp0 = A & {4{B[0]}};
    assign pp1 = A & {4{B[1]}};
    assign pp2 = A & {4{B[2]}};
    assign pp3 = A & {4{B[3]}};

    // Fila 1: Producto parcial pp0 (sin desplazamiento)
    wire [7:0] row0 = {4'b0000, pp0};

    // Fila 2: pp1 << 1
    wire [7:0] row1 = {3'b000, pp1, 1'b0};

    // Fila 3: pp2 << 2
    wire [7:0] row2 = {2'b00, pp2, 2'b00};

    // Fila 4: pp3 << 3
    wire [7:0] row3 = {1'b0, pp3, 3'b000};

    // Sumas (usamos sumas estructurales en 3 etapas)
    wire [7:0] sum1, sum2;

    // Suma 1: row0 + row1
    ripple_adder_8 adder1 (.A(row0), .B(row1), .SUM(sum1));

    // Suma 2: sum1 + row2
    ripple_adder_8 adder2 (.A(sum1), .B(row2), .SUM(sum2));

    // Suma final: sum2 + row3
    ripple_adder_8 adder3 (.A(sum2), .B(row3), .SUM(P));

endmodule



