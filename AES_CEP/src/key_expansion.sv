module key_expansion #(
    parameter DATA_WIDTH = 128,
    parameter BYTE  = 8
) (
    input logic [DATA_WIDTH-1:0] round_key,

    output logic [DATA_WIDTH-1:0] new_round_key
);

logic [(DATA_WIDTH/4) -1:0]   new_key_col_d           [3:0];
logic [(DATA_WIDTH/16)-1:0]   substituted_round_key   [3:0];
logic [(DATA_WIDTH/4) -1:0]   shifted_key_column;

// substituting the elements of third column of round key
generate
    for (genvar elements=0; elements<4; elements++) begin
        s_box substitution_boxes_for_round_key (   
                                    .byte_in(round_key[(8*(elements)+96) + 7 : 8*(elements)+96]),
                                    .s_byte_out(substituted_round_key[elements])
                                );
    end
endgenerate

// Rearranging bytes for shifting substituted round key
assign shifted_key_column = { substituted_round_key[0], substituted_round_key[3], 
                              substituted_round_key[2], substituted_round_key[1]
                            };

assign new_key_col_d[0] = (round_key [31  : 0 ]) ^ (shifted_key_column);  // round_key first col
assign new_key_col_d[1] = (round_key [63  : 32]) ^ new_key_col_d[0];
assign new_key_col_d[2] = (round_key [95  : 64]) ^ new_key_col_d[1];
assign new_key_col_d[3] = (round_key [127 : 96]) ^ new_key_col_d[2];

// generating new round key 
assign  new_round_key = {new_key_col_d[3], new_key_col_d[2], new_key_col_d[1], new_key_col_d[0]};
 
endmodule