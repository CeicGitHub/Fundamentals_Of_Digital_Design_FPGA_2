module ripple_adder_8 (
    input  [7:0] A,
    input  [7:0] B,
    output [7:0] SUM
);
    wire [7:0] carry;
    
    full_adder FA0 (.A(A[0]), .B(B[0]), .Cin(1'b0),     .SUM(SUM[0]), .CARRY(carry[0]));
    full_adder FA1 (.A(A[1]), .B(B[1]), .Cin(carry[0]), .SUM(SUM[1]), .CARRY(carry[1]));
    full_adder FA2 (.A(A[2]), .B(B[2]), .Cin(carry[1]), .SUM(SUM[2]), .CARRY(carry[2]));
    full_adder FA3 (.A(A[3]), .B(B[3]), .Cin(carry[2]), .SUM(SUM[3]), .CARRY(carry[3]));
    full_adder FA4 (.A(A[4]), .B(B[4]), .Cin(carry[3]), .SUM(SUM[4]), .CARRY(carry[4]));
    full_adder FA5 (.A(A[5]), .B(B[5]), .Cin(carry[4]), .SUM(SUM[5]), .CARRY(carry[5]));
    full_adder FA6 (.A(A[6]), .B(B[6]), .Cin(carry[5]), .SUM(SUM[6]), .CARRY(carry[6]));
    full_adder FA7 (.A(A[7]), .B(B[7]), .Cin(carry[6]), .SUM(SUM[7]), .CARRY(/*ignored*/));

endmodule
