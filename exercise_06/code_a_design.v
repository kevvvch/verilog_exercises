module comp(rst_n, clk, q, d);
    input d, rst_n, clk;
    output q;

    wire d, rst_n, clk;
    reg q;
  
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            q <= 10'd0;
        end
        else begin
            q <= d;
        end
    end
endmodule