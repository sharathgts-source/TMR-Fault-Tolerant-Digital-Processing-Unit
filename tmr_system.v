
module tmr_system (
    input  [7:0] A,
    input  [7:0] B,
    input        inject_fault,

    output [8:0] final_sum,
    output       fault_detected,

    output       faulty_M1,
    output       faulty_M2,
    output       faulty_M3
);

    wire [8:0] M1;
    wire [8:0] M2;
    wire [8:0] M3;

    wire [8:0] M3_faulty;

    // Three redundant adders
    adder_8bit ADDER1 (
        .A(A),
        .B(B),
        .SUM(M1)
    );

    adder_8bit ADDER2 (
        .A(A),
        .B(B),
        .SUM(M2)
    );

    adder_8bit ADDER3 (
        .A(A),
        .B(B),
        .SUM(M3)
    );

    // Fault injection in Module 3
    assign M3_faulty = inject_fault ? (M3 ^ 9'b000000001) : M3;

    // Majority voter
    majority_voter VOTER (
        .M1(M1),
        .M2(M2),
        .M3(M3_faulty),
        .VOTED_OUT(final_sum)
    );

    // Fault detection
    assign faulty_M1 = (M1 != final_sum);
    assign faulty_M2 = (M2 != final_sum);
    assign faulty_M3 = (M3_faulty != final_sum);

    assign fault_detected =
        faulty_M1 | faulty_M2 | faulty_M3;

endmodule
