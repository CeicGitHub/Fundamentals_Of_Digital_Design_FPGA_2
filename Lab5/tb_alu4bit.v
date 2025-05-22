module tb_alu4bit;
    reg [3:0] A, B, SEL;
    wire [7:0] RESULT;
    integer i;

    alu4bit uut (
        .A(A), .B(B), .SEL(SEL), .RESULT(RESULT)
    );

    initial begin
        $display("Time |  A  |  B  | SEL  | RESULT");
        for (i = 0; i < 16; i = i + 1) begin
            A = 4'd9;
            B = 4'd2;
            SEL = i[3:0];
            #10 $display("%4t | %2d  | %2d  | %4b | %3d", $time, A, B, SEL, RESULT);
        end
        $stop;
    end
endmodule
