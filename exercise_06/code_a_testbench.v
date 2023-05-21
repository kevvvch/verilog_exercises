module comp_tb;
    reg d;
    reg rst_n;
    reg clk;
    wire q;

    comp uut (
        .d(d),
        .rst_n(rst_n),
        .clk(clk),
        .q(q)
    );

    initial begin
        $dumpfile("dump.vcd"); $dumpvars;
        d = 0;
        rst_n = 0;
        clk = 0;
        
        #10 rst_n = 1;
        #10 d = 1;
        #10 d = 0;
        #20 d = 1;
        #3 rst_n = 0;
        #10 d = 0;
        #30 d = 1;
        #5 rst_n = 1;
        #10 d = 1;
        #10 d = 0;
        #20 d = 1;
        #20;

        $finish;
    end

    always begin
        #5 clk = ~clk;
    end

endmodule