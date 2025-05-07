module round_counter #(
    parameter WIDTH = 4
) (
    input logic clk, n_rst,
    input logic round_count_en,

    // output logic round0_inputs,
    output logic is_round_completed
);

logic [WIDTH-1:0] cnt;

always_ff @( posedge clk, negedge n_rst ) begin : round_counter
    if (!n_rst)
        cnt <= '0;
    else if (round_count_en)
        cnt <= cnt + 1;
    else 
        cnt <= '0;
end

// assign round0_inputs = (cnt == 4'h0) ? 1'b1 : 1'b0;
assign is_round_completed = (cnt == 4'hb) ? 1'b1 : 1'b0;

endmodule