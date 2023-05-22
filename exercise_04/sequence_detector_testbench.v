module sequence_detector_tb;
    reg clk;
    reg dataIn;
    reg rst_n;
    wire detected;

    sequence_detector dut (
        .clk(clk),
        .dataIn(dataIn),
        .rst_n(rst_n),
        .detected(detected)
    );

  	always begin
        #5 clk = ~clk;
    end

    initial begin
        $dumpfile("dump.vcd"); $dumpvars;
        dataIn = 0;
        clk = 0;
      	rst_n = 1;
        
        #10 dataIn = 1;
        #10 dataIn = 0;
        #10 dataIn = 1;
        #10 dataIn = 0;
      	rst_n = 0;

        #10 dataIn = 1;
        #10 dataIn = 1;
      	rst_n = 1;

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