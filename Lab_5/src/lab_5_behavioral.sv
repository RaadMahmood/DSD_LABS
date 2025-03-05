module lab_5_b(
    input  logic [3:0] num,
    input  logic [2:0] se,
    output logic seg_a,
    output logic seg_b,
    output logic seg_c,
    output logic seg_d,
    output logic seg_e,   
    output logic seg_f,
    output logic seg_g,
    output logic seg_no_0,
    output logic seg_no_1,
    output logic seg_no_2,
    output logic seg_no_3,
    output logic seg_no_4,
    output logic seg_no_5,
    output logic seg_no_6,
    output logic seg_no_7

    );
    
//-----Behavioral Model for Cathodes-----//
always_comb begin
    case (num)
        4'b0000: {seg_a, seg_b, seg_c, seg_d, seg_e, seg_f, seg_g} = 7'b0000001;
        4'b0001: {seg_a, seg_b, seg_c, seg_d, seg_e, seg_f, seg_g} = 7'b1001111;
        4'b0010: {seg_a, seg_b, seg_c, seg_d, seg_e, seg_f, seg_g} = 7'b0010010;
        4'b0011: {seg_a, seg_b, seg_c, seg_d, seg_e, seg_f, seg_g} = 7'b0000110;
        4'b0100: {seg_a, seg_b, seg_c, seg_d, seg_e, seg_f, seg_g} = 7'b1001100;
        4'b0101: {seg_a, seg_b, seg_c, seg_d, seg_e, seg_f, seg_g} = 7'b0100100;
        4'b0110: {seg_a, seg_b, seg_c, seg_d, seg_e, seg_f, seg_g} = 7'b0100000;
        4'b0111: {seg_a, seg_b, seg_c, seg_d, seg_e, seg_f, seg_g} = 7'b0001111;
        4'b1000: {seg_a, seg_b, seg_c, seg_d, seg_e, seg_f, seg_g} = 7'b0000000;
        4'b1001: {seg_a, seg_b, seg_c, seg_d, seg_e, seg_f, seg_g} = 7'b0000100;
        4'b1010: {seg_a, seg_b, seg_c, seg_d, seg_e, seg_f, seg_g} = 7'b0001000;
        4'b1011: {seg_a, seg_b, seg_c, seg_d, seg_e, seg_f, seg_g} = 7'b1100000;
        4'b1100: {seg_a, seg_b, seg_c, seg_d, seg_e, seg_f, seg_g} = 7'b0110001;
        4'b1101: {seg_a, seg_b, seg_c, seg_d, seg_e, seg_f, seg_g} = 7'b1000010;
        4'b1110: {seg_a, seg_b, seg_c, seg_d, seg_e, seg_f, seg_g} = 7'b0110000;
        4'b1111: {seg_a, seg_b, seg_c, seg_d, seg_e, seg_f, seg_g} = 7'b0111000;
        default: {seg_a, seg_b, seg_c, seg_d, seg_e, seg_f, seg_g} = 7'b1111111; //-----All Cathodes OFF-----//
    endcase
end

//-----Behavioral Model for Anode-----//
always_comb begin
    case (se)
        3'b000: {seg_no_0, seg_no_1, seg_no_2, seg_no_3, seg_no_4, seg_no_5, seg_no_6, seg_no_7} = 8'b01111111;
        3'b001: {seg_no_0, seg_no_1, seg_no_2, seg_no_3, seg_no_4, seg_no_5, seg_no_6, seg_no_7} = 8'b10111111;
        3'b010: {seg_no_0, seg_no_1, seg_no_2, seg_no_3, seg_no_4, seg_no_5, seg_no_6, seg_no_7} = 8'b11011111;
        3'b011: {seg_no_0, seg_no_1, seg_no_2, seg_no_3, seg_no_4, seg_no_5, seg_no_6, seg_no_7} = 8'b11101111;
        3'b100: {seg_no_0, seg_no_1, seg_no_2, seg_no_3, seg_no_4, seg_no_5, seg_no_6, seg_no_7} = 8'b11110111;
        3'b101: {seg_no_0, seg_no_1, seg_no_2, seg_no_3, seg_no_4, seg_no_5, seg_no_6, seg_no_7} = 8'b11111011;
        3'b110: {seg_no_0, seg_no_1, seg_no_2, seg_no_3, seg_no_4, seg_no_5, seg_no_6, seg_no_7} = 8'b11111101;
        3'b111: {seg_no_0, seg_no_1, seg_no_2, seg_no_3, seg_no_4, seg_no_5, seg_no_6, seg_no_7} = 8'b01111110;
        default:{seg_no_0, seg_no_1, seg_no_2, seg_no_3, seg_no_4, seg_no_5, seg_no_6, seg_no_7} = 8'b11111111; //-----All Anodes OFF-----//
    endcase
end
endmodule
