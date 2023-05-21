module clk_divider_by_3(clk, dataIn, detected);
    input clk, dataIn;
    output detected;
    
    wire clk, dataIn;
    reg detected;
  
    reg [3:0] state = s0;
    parameter s0 = 4'b0000;
    parameter s1 = 4'b0001;
    parameter s2 = 4'b0010;
    parameter s3 = 4'b0011;
    parameter s4 = 4'b0100;
    parameter s5 = 4'b0101;
    parameter s6 = 4'b0110;
    parameter s7 = 4'b0111;
    parameter s8 = 4'b1000;
    parameter s9 = 4'b1001;
    parameter s10 = 4'b1010;
    parameter s11 = 4'b1011;
    parameter s12 = 4'b1100;
    parameter s13 = 4'b1101;
    parameter s14 = 4'b1110;
    parameter s15 = 4'b1111;
  
  	always @(posedge clk) begin
        case(state)
            s0: begin state <= dataIn ? s1 : s0; detected <= 0; end
            s1: begin state <= dataIn ? s1 : s2; detected <= 0; end
            s2: begin state <= dataIn ? s3 : s0; detected <= 0; end
            s3: begin state <= dataIn ? s1 : s4; detected <= 0; end
            s4: begin state <= dataIn ? s4 : s5; detected <= 0; end
            s5: begin state <= dataIn ? s6 : s0; detected <= 0; end
            s6: begin state <= dataIn ? s7 : s2; detected <= 0; end
            s7: begin state <= dataIn ? s1 : s8; detected <= 0; end
            s8: begin state <= dataIn ? s3 : s9; detected <= 0; end
            s9: begin state <= dataIn ? s10 : s0; detected <= 0; end
            s10: begin state <= dataIn ? s11 : s3; detected <= 0; end
            s11: begin state <= dataIn ? s1 : s12; detected <= 0; end
            s12: begin state <= dataIn ? s3 : s13; detected <= 0; end
            s13: begin state <= dataIn ? s14 : s1; detected <= 1; end
            s14: begin state <= dataIn ? s15 : s2; detected <= 0; end
            s15: begin state <= dataIn ? s1 : s0; detected <= 0; end
            default: begin state <= s0; detected <= 0; end
        endcase
    end

endmodule