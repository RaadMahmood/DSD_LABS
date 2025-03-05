module lab_4_tb;

logic [1:0]a1;
logic [1:0]b1;
logic Red;
logic Blue;
logic Green;

localparam period = 10;

lab_4 UUT(
.a2(a1),
.b2(b1),
.rd(Red),
.grn(Green),
.blu(Blue)
);

initial //initial block executes only once
begin
	// Provide different combinations of the inputs to check validity of code

	a1[1] = 0; a1[0] = 0; b1[1] = 0; b1[0] = 0;
	#period;
    a1[1] = 0; a1[0] = 0; b1[1] = 0; b1[0] = 1;
	#period;
    a1[1] = 0; a1[0] = 0; b1[1] = 1; b1[0] = 0;
	#period;
    a1[1] = 0; a1[0] = 0; b1[1] = 1; b1[0] = 1;
	#period;
    a1[1] = 0; a1[0] = 1; b1[1] = 0; b1[0] = 0;
	#period;
    a1[1] = 0; a1[0] = 1; b1[1] = 0; b1[0] = 1;
	#period;
    a1[1] = 0; a1[0] = 1; b1[1] = 1; b1[0] = 0;
	#period;
    a1[1] = 0; a1[0] = 1; b1[1] = 1; b1[0] = 1;
	#period;
    a1[1] = 1; a1[0] = 0; b1[1] = 0; b1[0] = 0;
	#period;
    a1[1] = 1; a1[0] = 0; b1[1] = 0; b1[0] = 1;
	#period;
    a1[1] = 1; a1[0] = 0; b1[1] = 1; b1[0] = 0;
	#period;
    a1[1] = 1; a1[0] = 0; b1[1] = 1; b1[0] = 1;
	#period;
    a1[1] = 1; a1[0] = 1; b1[1] = 0; b1[0] = 0;
	#period;
    a1[1] = 1; a1[0] = 1; b1[1] = 0; b1[0] = 1;
	#period;
    a1[1] = 1; a1[0] = 1; b1[1] = 1; b1[0] = 0;
	#period;
    a1[1] = 1; a1[0] = 1; b1[1] = 1; b1[0] = 1;
	#period;
	$stop;
end
initial
begin
        /*the following system task will print out the signal values
        every time they change on the Transcript Window */
        $monitor("Blue=%b, Green=%b, Red=%b, a=%b, b=%b, c=%b, d=%d", Blue,Green,Red,a1[1],a1[0],b1[1],b1[0]);
end
endmodule