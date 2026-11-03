
`timescale 1ns / 1ps

module testbench;

    reg  [7:0] A;
    reg  [7:0] B;
    reg        inject_fault;

    wire [8:0] final_sum;
    wire       fault_detected;

    wire faulty_M1;
    wire faulty_M2;
    wire faulty_M3;

    // Instantiate TMR system
    tmr_system DUT (
        .A(A),
        .B(B),
        .inject_fault(inject_fault),
        .final_sum(final_sum),
        .fault_detected(fault_detected),
        .faulty_M1(faulty_M1),
        .faulty_M2(faulty_M2),
        .faulty_M3(faulty_M3)
    );

    // Waveform generation
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, testbench);
    end

    initial begin

        // Test 1: Normal operation
        A = 8'd5;
        B = 8'd3;
        inject_fault = 0;

        #10;
        $display("Normal: Output=%d Fault=%b",
                 final_sum, fault_detected);

        // Test 2: Inject fault
        A = 8'd10;
        B = 8'd20;
        inject_fault = 1;

        #10;
        $display("Fault: Output=%d Fault=%b",
                 final_sum, fault_detected);

        $display("Faulty M1=%b M2=%b M3=%b",
                 faulty_M1, faulty_M2, faulty_M3);

        // Test 3: Maximum carry
        A = 8'd255;
        B = 8'd1;
        inject_fault = 0;

        #10;
        $display("Large: Output=%d Fault=%b",
                 final_sum, fault_detected);

        #10;
        $finish;

    end

endmodule
