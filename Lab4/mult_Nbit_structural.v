/*This is the base for use with the testbench Nbit, 
 here can set the parameter for use in the testbench for example N value*/

module mult_Nbit_structural #(
    parameter N = 8
)(
    input  [N-1:0] A,
    input  [N-1:0] B,
    output [2*N-1:0] P
);
    wire [N-1:0] partial [N-1:0];        // productos parciales
    wire [2*N-1:0] shifted [N-1:0];      // productos parciales desplazados
    wire [2*N-1:0] sum [N:0];            // acumuladores parciales

    assign sum[0] = 0;

    genvar i, j;
    generate
        for (i = 0; i < N; i = i + 1) begin : PARTIAL_PRODUCTS
            for (j = 0; j < N; j = j + 1) begin : ANDS
                assign partial[i][j] = A[j] & B[i];
            end

            assign shifted[i] = {{(2*N-N-i){1'b0}}, partial[i], {i{1'b0}}}; // desplazar
            assign sum[i+1] = sum[i] + shifted[i];
        end
    endgenerate

    assign P = sum[N];

endmodule


