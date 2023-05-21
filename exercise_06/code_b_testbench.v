module comp_tb;
    reg d;
    reg rst_n;
    reg clk;
    wire q;

    // Instantiate the module under test
    comp uut (
        .d(d),
        .rst_n(rst_n),
        .clk(clk),
        .q(q),
        .enable(enable)
    );

    // Stimulus
    initial begin
        $dumpfile("dump.vcd"); $dumpvars;
        // Initialize inputs
        d = 0;
        rst_n = 0;
        clk = 0;
        enable = 0;
        
        // Wait for some time and release reset
        #10 rst_n = 1;

        // Apply test vectors
        #10 d = 1;
        enable = 1;
        #10 d = 0;
        #20 d = 1;
        #10 enable = 0;
        #10 d = 0;
        #10 d = 1;
        #10 d = 0;
        #10 enable = 1;
        #10 d = 1;
        #10 d = 0;
        #10 d = 1;

        // Wait for some more time
        #20;

        // Finish simulation
        $finish;
    end

    // Clock generation
    always begin
        #5;
        clk = ~clk; // Toggle the clock every 5 time units
    end

    // Monitor
    always @(posedge clk) begin
        $display("q = %b, d = %b, clk = %b, rst_n = %b", q, d, clk, rst_n);
    end

endmodule