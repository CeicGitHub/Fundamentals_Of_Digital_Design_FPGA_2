/*This testebench can be used with "4bit_structural" show the part for test
in the model sim mechanism, can see all the operations in the monitor*/

`timescale 1ns / 1ps

module mult_4bit_tb;

    reg [3:0] A;
    reg [3:0] B;
    wire [7:0] P_structural;
    reg [7:0] P_expected;

    integer i;
    integer errors;

    // Instancia del multiplicador estructural
    mult_4bit_structural uut (
        .A(A),
        .B(B),
        .P(P_structural)
    );

    // Función de referencia usando el operador '*'
    function [7:0] check_multiplication;
        input [3:0] A_in;
        input [3:0] B_in;
        begin
            check_multiplication = A_in * B_in;
        end
    endfunction

    initial begin
        errors = 0;

        for (i = 0; i < 1000; i = i + 1) begin
            A = $random % 16;  // [0, 15]
            B = $random % 16;  // [0, 15]

            #1; // Esperar un poco a que se propaguen señales

            P_expected = check_multiplication(A, B);

            if (P_structural !== P_expected) begin
                $display("ERROR: A=%d B=%d | Expected=%d, Got=%d", A, B, P_expected, P_structural);
                errors = errors + 1;
            end
        end

        if (errors == 0)
            $display("TEST PASSED: All results are correct.");
        else
            $display("TEST FAILED: %d errors found.", errors);

        $finish;
    end

endmodule
