module comp(rst_n, enable, clk, q, d);
    input d, rst_n, clk, enable;
    output q;
    
    wire d, rst_n, clk, enable;
    reg q;
    
    assign gated_clock = clk & enable;
    always @(posedge gated_clock or negedge rst_n) begin
        if (!rst_n) begin
                q <= 10'd0;
        end
        else begin
                q <= d;
        end
    end

endmodule