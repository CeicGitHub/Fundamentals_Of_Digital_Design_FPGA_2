module alu4bit (
    input  [3:0] A,
    input  [3:0] B,
    input  [3:0] SEL,
    output reg [7:0] RESULT
);
    always @(*) begin
        case (SEL)
            4'b0000: RESULT = A + B;
            4'b0001: RESULT = A - B;
            4'b0010: RESULT = {4'b0000, A & B};
            4'b0011: RESULT = {4'b0000, A | B};
            4'b0100: RESULT = {4'b0000, A ^ B};
            4'b0101: RESULT = {4'b0000, ~(A & B) & 4'b1111}; // NAND
            4'b0110: RESULT = {4'b0000, ~(A | B) & 4'b1111}; // NOR
            4'b0111: RESULT = {4'b0000, ~(A ^ B) & 4'b1111}; // XNOR
            4'b1000: RESULT = A << B;
            4'b1001: RESULT = A >> B;
            4'b1010: RESULT = {4'b0000, (A << B) | (A >> (4 - B))}; // Rotate Left
            4'b1011: RESULT = {4'b0000, (A >> B) | (A << (4 - B))}; // Rotate Right
            4'b1100: RESULT = (A > B)  ? 8'b00000001 : 8'b00000000;
            4'b1101: RESULT = (A <= B) ? 8'b00000001 : 8'b00000000;
            4'b1110: RESULT = (A == B) ? 8'b00000001 : 8'b00000000;
            4'b1111: RESULT = A * B;
            default: RESULT = 8'b00000000;
        endcase
    end
endmodule
