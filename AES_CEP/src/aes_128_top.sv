`include "../include/registers.svh"

module aes_128_top #(
    parameter DATA_WIDTH = 128
) (
    input logic                     clk_i, rst_ni,

    input logic [DATA_WIDTH-1:0]    plain_text_data,
    input logic [DATA_WIDTH-1:0]    cipher_key,
    input logic                     valid_in,

    output logic [DATA_WIDTH-1:0]   cipherPlainText,
    output logic                    valid_out
);

// Controller signals
logic input_en;             // Register enable 
logic round0_in;            // Mux selections
logic round_10_completed;   // all rounds completed 
logic round_count_en;       // start_rounding_enable

logic [DATA_WIDTH-1:0] plainData_q, keyData_q;  // Registers Outputs
logic [DATA_WIDTH-1:0] dataMuxOut, keyMuxOut;   // Mux outputs

logic [DATA_WIDTH-1:0] shifted_rows_data, round_key_new;

logic [DATA_WIDTH-1:0] plain_xor_text;

logic [(DATA_WIDTH/16)-1:0] substituted_bytes [15:0];   // 16 substituted bytes of plain text

// Plain input register and mux
assign dataMuxOut = round0_in ? plain_text_data : shifted_rows_data;
`FFL(plainData_q, dataMuxOut, input_en, '0)

// cipher key register and mux
assign keyMuxOut = round0_in ? cipher_key : round_key_new;
`FFL(keyData_q, keyMuxOut, input_en, '0)

// XOR key and data
assign plain_xor_text = plainData_q ^ keyData_q;

generate
    for (genvar elements=0; elements<16; elements++) begin
        s_box substitution_boxes(   .byte_in(plain_xor_text[8*elements +: 8]),
                                    .s_byte_out(substituted_bytes[elements])
                                );
    end
endgenerate
    
// Rearranging bytes of substituted data
assign shifted_rows_data = {    substituted_bytes[11],substituted_bytes[6] ,substituted_bytes[1] ,substituted_bytes[12],
                                substituted_bytes[7] ,substituted_bytes[2] ,substituted_bytes[13],substituted_bytes[8],
                                substituted_bytes[3] ,substituted_bytes[14],substituted_bytes[9] ,substituted_bytes[4],
                                substituted_bytes[15],substituted_bytes[10],substituted_bytes[5] ,substituted_bytes[0]
                            };

// key_expansion
key_expansion KEY_EXPANSION_UNIT ( .round_key(keyData_q), .new_round_key(round_key_new));

// 10 rounds counter
round_counter ROUND_COUNTER_UNIT ( .clk(clk_i), .n_rst(rst_ni),
                                    .round_count_en(round_count_en),
                                    .is_round_completed(round_10_completed)
                                );

// aes-128 controller
aes_128_controller AES_CONTROLLER_UNIT (    .clk_i(clk_i), .rst_ni(rst_ni),
                                            .valid_in(valid_in), 

                                            // controller <--> round_counter
                                            .round_10_completed(round_10_completed),
                                            .valid_round_en(round_count_en), 

                                            // controller --> input_mux
                                            .round0_in(round0_in),

                                            // controller --> input_registers
                                            .input_en(input_en),
                                            
                                            .valid_out(valid_out)
                                        
                                        );

assign cipherPlainText = round_10_completed ? plain_xor_text : '0;

endmodule