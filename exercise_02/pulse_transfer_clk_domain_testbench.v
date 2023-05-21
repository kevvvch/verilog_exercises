module pulse_transfer_clk_domain_tb;
    reg clk1_pulse;
    reg clk_2;
    wire clk2_pulse;

    pulse_transfer_clk_domain dut (
        .clk1_pulse(clk1_pulse),
        .clk_2(clk_2),
        .clk2_pulse(clk2_pulse)
    );
    always begin
        #3 clk_2 = ~clk_2;
    end

    initial begin
        $dumpfile("dump.vcd"); $dumpvars;
        clk1_pulse = 0;
        clk_2 = 0;

        #5 clk1_pulse = 1;
        #10 clk1_pulse = 0;
        #10 clk1_pulse = 1;
        #20 clk1_pulse = 0;
        #30 clk1_pulse = 1;
        #20 clk1_pulse = 0;

        #10 $finish;
    end

endmodule