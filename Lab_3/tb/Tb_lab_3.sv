module tb_lab_3();
logic a1;
logic b1;
logic c1;
logic x_out;
logic y_out;

lab_3 UUT(
 .a(a1),
 .b(b1),
 .c(c1),
 .x(x_out),
 .y(y_out)
 );

initial
begin
 // Provide different combinations of the inputs to check validity of code
 a1 = 0; b1 = 0; c1 = 0;
 #10;
 a1 = 0; b1 = 0; c1 = 1;
 #10;
 a1 = 0; b1 = 1; c1 = 0;
 #10;
 a1 = 0; b1 = 1; c1 = 1;
 #10;
 a1 = 1; b1 = 0; c1 = 0;
 #10;
 a1 = 1; b1 = 0; c1 = 1;
 #10;
 a1 = 1; b1 = 1; c1 = 0;
 #10;
 a1 = 1; b1 = 1; c1 = 1;
 #10;
 $stop;
end
initial
begin
/*the following system task will print out the signal values
    every time they change ono the Transcript Window */
    $monitor("y=%b, x=%b, a=%b, b=%b, c=%b", x_out, y_out, a1, b1, c1);

end
endmodule
 