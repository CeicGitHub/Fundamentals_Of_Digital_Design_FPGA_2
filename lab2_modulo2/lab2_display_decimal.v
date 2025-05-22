module lab2_display_decimal (
    input signed [4:0] value,
    output [6:0] HEX0,
    output [6:0] HEX1,
    output [6:0] HEX2
);
    wire [4:0] abs_val = (value < 0) ? -value : value;
    reg [3:0] unidades, decenas;
    reg [6:0] signo;
    wire [6:0] dec0, dec1;

    always @(*) begin
        if (abs_val >= 10) begin
            decenas = 1;
            unidades = abs_val - 10;
        end else begin
            decenas = 0;
            unidades = abs_val;
        end

        signo = (value < 0) ? 7'b0111111 : 7'b1111111; // ‘-’ o apagado
    end

    lab2_hex_7seg u0 (.in(unidades), .out(dec0));
    lab2_hex_7seg u1 (.in(decenas),  .out(dec1));

    assign HEX0 = ~dec0;
    assign HEX1 = ~dec1;
    assign HEX2 = ~signo;
endmodule
