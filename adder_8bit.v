
module adder_8bit (
    input  [7:0] A,
    input  [7:0] B,
    output [8:0] SUM
);

    assign SUM = A + B;

endmodule
