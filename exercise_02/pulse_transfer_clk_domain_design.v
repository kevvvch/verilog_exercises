module pulse_transfer_clk_domain(clk2_pulse, clk1_pulse, clk_2);
    input clk1_pulse, clk_2;
    output clk2_pulse;
    
    wire clk1_pulse, clk_2;
    reg clk2_pulse = 1'b0;
    
  	reg pulse = 1'b0;
  
    always @(posedge clk_2) begin
        pulse <= clk1_pulse;
        if(clk2_pulse != pulse) begin
            clk2_pulse <= pulse;
        end
    end
endmodule