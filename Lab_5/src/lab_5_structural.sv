module lab_5(
input logic [3:0]num,
  input logic [2:0]sel,
  output logic A, B, C, D, E, F, G, Dp, AN0, AN1, AN2, AN3, AN4, AN5, AN6, AN7
);
logic a,b,c,d, a1, b1, c1, x; 
 always_comb begin
  a = num [3];
  b = num [2];
  c = num[1]; 
  d = num[0];
  a1 = sel[2];
  b1 = sel[1];
  c1 = sel[0];
  
  x = (~a & ~c) & (b ^ d);
  A = (x | (a & d) &(b ^ c));
  B = ((((~a & b & ~c) | (a & c)) & d) | ((b & ~d) & (a | c))); 
  C = ((~a & ~b &c & ~d) | (a & b & (~d | c)));
  D = (x | ((b & d) | (a & ~b & ~d)) & c);
  E = ((~a & d) | (((~a & b) | (~b & d)) &~c));
  F = (((~a & ~b) & (d | c)) | ((~a & c) | ((a & b & ~c) & d)));
  G = ((~a & ~b & ~c) | (b & ((~a & c & d) | (a & ~c & ~d))));
  Dp = 0;
  AN0 = a1 | b1 | c1;
  AN1 = a1 | b1 | ~c1;
  AN2 = a1 | ~b1 | c1;
  AN3 = a1 | ~b1 | ~c1;
  AN4 = ~a1 | b1 | c1;
  AN5 = ~a1 | b1 |~ c1;
  AN6 = ~a1 | ~b1 | c1;
  AN7 = ~a1 | ~b1 | ~c1;
  end 
endmodule
