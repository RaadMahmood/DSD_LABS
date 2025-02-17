module lab_3(output logic x,y,
            input logic a,b,c
            );
   assign x = ~c ^ (a | b);
   assign y = ((a|b) & ((~(a&b))^(a|b)));
endmodule