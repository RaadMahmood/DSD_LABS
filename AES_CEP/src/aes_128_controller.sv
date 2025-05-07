module aes_128_controller(
    input logic clk_i, rst_ni,

    input logic valid_in,
    input logic round_10_completed,

    output logic valid_round_en,
    output logic round0_in,
    output logic input_en,

    output logic valid_out
);

logic c_state, n_state;
parameter S0=1'b0, S1=1'b1;

always_ff @ (posedge clk_i or negedge rst_ni) begin
    //reset is active high
    if (!rst_ni) 
    c_state <= '0;
    else
    c_state <= n_state;
end

//next_state always block
always_comb begin
  case (c_state)
    S0: begin   
      if (valid_in) n_state = S1;
      else n_state = S0; 
    end
    S1: begin   
      if (round_10_completed) n_state = S0;
      else n_state = S1;
    end

    default: n_state = S0;
  endcase
end

//output always block
always_comb begin
  case (c_state)

     'b0: begin if (valid_in) begin   
        valid_round_en  = 1'b1; 
        round0_in   = 1'b1;
        input_en    = 1'b1;
        valid_out   = 1'b0;
    end 
    else begin
        valid_out   = 1'b0;
    end 
    end

    1'b1: begin if(round_10_completed) begin
        valid_round_en  = 1'b0;
        round0_in   = 1'b0;
        input_en    = 1'b0;
        valid_out   = 1'b1;  
    end else begin
        valid_round_en  = 1'b1; 
        round0_in   = 1'b0;
        input_en    = 1'b1;
        valid_out   = 1'b0;      
    end end

    default: begin
      valid_round_en  = 1'b0; 
      round0_in   = 1'b0;
      input_en    = 1'b0;
      valid_out   = 1'b0;
    end
  endcase
end
    
endmodule