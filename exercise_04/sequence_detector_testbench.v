module clk_divider_by_3_tb;
    reg clk;
    reg dataIn;
    wire detected;

    clk_divider_by_3 dut (
        .clk(clk),
        .dataIn(dataIn),
        .detected(detected)
    );

    // Clock generation
    always begin
        #5 clk = ~clk; // Toggle the clock every 5 time units
    end

    initial begin
        $dumpfile("dump.vcd"); $dumpvars;
        dataIn = 0;
        clk = 0;

        #10 dataIn = 1;
        #10 dataIn = 0;
        #10 dataIn = 1;
        
        #10 dataIn = 1;
        #10 dataIn = 0;
        #10 dataIn = 1;
        #10 dataIn = 0;
        #10 dataIn = 0;
        #10 dataIn = 1;
        #10 dataIn = 1;
        #10 dataIn = 0;
        #10 dataIn = 0;
        #10 dataIn = 1;
        #10 dataIn = 1;
        #10 dataIn = 0;
        #10 dataIn = 0;
        #10 dataIn = 1;
        #10 dataIn = 1;
        
        #10 dataIn = 1;
        #10 dataIn = 0;
        #10 dataIn = 1;
        #10 dataIn = 1;

        #30;

        $finish;
    end

endmodule