module sequence_detector(clk, dataIn, rst_n, detected);
    input clk, dataIn, rst_n;
    output detected;
    
    wire clk, dataIn, rst_n;
    reg detected = 0;
  
  	parameter [14:0] seq = 15'b101001100110011;
    reg [14:0] shiftReg = 0;
    reg state = state_compare;
    parameter state_compare = 0;
    parameter state_detected = 1;
  
  	always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
          	shiftReg <= 0;
            state <= state_compare; 
            detected <= 0; 
        end
        else begin
            case(state)
                state_compare: begin
                    shiftReg <= shiftReg << 1;
                    shiftReg[0] <= dataIn;
                    detected <= 0;
                    
                    if(shiftReg == seq) begin
                        state = state_detected;
                    end
                    else begin
                        state = state_compare;
                    end
                end
                
                state_detected: begin
                    detected <= 1;
                    state = state_compare;
                end
            
                default: begin 
                    state <= state_compare; 
                    detected <= 0; 
                end
            endcase
        end
    end
endmodule