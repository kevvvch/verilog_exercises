module clk_divider_by_3(clk, clk_div);
    input clk;
    output clk_div;
    
    wire clk;
    reg clk_div = 0;
    
    reg[2:0] counter = 2'd0; //Internal register initilized in 0
    parameter DIVISOR = 3;
        
    always @(posedge clk) begin
        counter <= counter + 1;
        
        if (counter >= DIVISOR) begin
            clk_div <= 1;
            if (counter == (2*DIVISOR-1)) begin
                counter <= 0;
            end
        end
        else begin
            clk_div <= 0;
        end
    end

endmodule