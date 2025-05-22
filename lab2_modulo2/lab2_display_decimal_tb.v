`timescale 1ns / 1ps

module lab2_display_decimal_tb;

    // Señal de entrada
    reg signed [3:0] value;
    
    // Salidas hacia los displays
    wire [6:0] HEX0, HEX1, HEX2;

    // Instancia del módulo a probar
    lab2_display_decimal uut (
        .value(value),
        .HEX0(HEX0),
        .HEX1(HEX1),
        .HEX2(HEX2)
    );

    // Tarea para imprimir el valor de los segmentos
    task display_segment_output;
        input [3:0] val;
        begin
            value = val;
            #10;  // Espera 10 ns
            $display("Valor: %0d -> HEX2(Signo): %b, HEX1(Decenas): %b, HEX0(Unidades): %b", 
                     val, HEX2, HEX1, HEX0);
        end
    endtask

    initial begin
        $display("=== Testbench: lab2_display_decimal ===");
        
        // Casos de prueba
        display_segment_output(4'd0);   // 0
        display_segment_output(4'd5);   // 5
        display_segment_output(4'd9);   // 9
        display_segment_output(4'd10);  // -6 (en complemento a 2 de 4 bits → 1010)
        display_segment_output(4'd12);  // -4
        display_segment_output(4'd13);  // -3
        display_segment_output(4'd14);  // -2
        display_segment_output(4'd15);  // -1

        $finish;
    end

endmodule