module lab2_tb;

    reg [3:0] a, b;
    reg k; // 0 = suma, 1 = resta
    wire [3:0] sum;
    wire cout;

    // Instancia del DUT
    adder_subtractor_parametrizable #(4) uut (
        .a(a),
        .b(b),
        .K(k),
        .sum(sum),
        .cout(cout)
    );

    // Función para mostrar el resultado con signo
    function signed [4:0] to_signed;
        input [3:0] value;
        begin
            if (value[3] == 1)
                to_signed = {1'b1, value}; // complemento a 2 negativo
            else
                to_signed = {1'b0, value};
        end
    endfunction

    initial begin
        $display(" A    B    K | SUM  (signed) | COUT");
        $display("-----------------------------------");

        a = 4'd5; b = 4'd3; k = 0; #10; // 5 + 3 = 8
        $display("%2d + %2d = %2d |  %b", a, b, to_signed(sum), cout);

        a = 4'd5; b = 4'd3; k = 1; #10; // 5 - 3 = 2
        $display("%2d - %2d = %2d |  %b", a, b, to_signed(sum), cout);

        a = 4'd3; b = 4'd5; k = 1; #10; // 3 - 5 = -2
        $display("%2d - %2d = %2d |  %b", a, b, to_signed(sum), cout);

        a = 4'd7; b = 4'd8; k = 0; #10; // 7 + 8 = 15
        $display("%2d + %2d = %2d |  %b", a, b, to_signed(sum), cout);

        a = 4'd0; b = 4'd1; k = 1; #10; // 0 - 1 = -1
        $display("%2d - %2d = %2d |  %b", a, b, to_signed(sum), cout);

        a = 4'd15; b = 4'd1; k = 0; #10; // 15 + 1 = 16 (overflow en 4 bits)
        $display("%2d + %2d = %2d |  %b", a, b, to_signed(sum), cout);

        $finish;
    end
endmodule