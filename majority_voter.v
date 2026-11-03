
module majority_voter (
    input  [8:0] M1,
    input  [8:0] M2,
    input  [8:0] M3,
    output [8:0] VOTED_OUT
);

    assign VOTED_OUT = (M1 & M2) | (M2 & M3) | (M1 & M3);

endmodule
