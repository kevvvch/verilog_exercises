module clk_divider_by_3_tb;
    reg clk;
    wire clk_div;

    clk_divider_by_3 uut (
        .clk(clk),
        .clk_div(clk_div)
    );

    initial begin
        $dumpfile("dump.vcd"); $dumpvars;
        clk = 0;

        #200;

        $finish;
    end

    // Clock generation
    always begin
        #5;
        clk = ~clk;
    end

endmodule