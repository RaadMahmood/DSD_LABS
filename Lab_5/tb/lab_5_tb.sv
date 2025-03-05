module lab_5_tb;

logic [3:0]i;
logic [2:0]s;
logic a;
logic b;
logic c;
logic d;
logic e;
logic f;
logic g;
logic dp;
logic an0;
logic an1;
logic an2;
logic an3;
logic an4;
logic an5;
logic an6;
logic an7;

localparam period = 10;

lab_5 UUT(
.num(i),
.sel(s),
.A(a),
.B(b),
.C(c),
.D(d),
.E(e),
.F(f),
.G(g),
.Dp(dp),
.AN0(an0),
.AN1(an1),
.AN2(an2),
.AN3(an3),
.AN4(an4),
.AN5(an5),
.AN6(an6),
.AN7(an7)
);

initial //initial block executes only once
begin
	// Provide different combinations of the inputs to check validity of code


i[3] = 0; i[2] = 0; i[1] = 0; i[0] = 0;
	#period;
i[3] = 0; i[2] = 0; i[1] = 0; i[0] = 1;
	#period;
i[3] = 0; i[2] = 0; i[1] = 1; i[0] = 0;
	#period;
i[3] = 0; i[2] = 0; i[1] = 1; i[0] = 1;
	#period;
i[3] = 0; i[2] = 1; i[1] = 0; i[0] = 0;
	#period;
i[3] = 0; i[2] = 1; i[1] = 0; i[0] = 1;
	#period;
i[3] = 0; i[2] = 1; i[1] = 1; i[0] = 0;
	#period;
i[3] = 0; i[2] = 1; i[1] = 1; i[0] = 1;
	#period;
i[3] = 1; i[2] = 0; i[1] = 0; i[0] = 0;
	#period;
i[3] = 1; i[2] = 0; i[1] = 0; i[0] = 1;
	#period;
i[3] = 1; i[2] = 0; i[1] = 1; i[0] = 0;
	#period;
i[3] = 1; i[2] = 0; i[1] = 1; i[0] = 1;
	#period;
i[3] = 1; i[2] = 1; i[1] = 0; i[0] = 0;
	#period;
i[3] = 1; i[2] = 1; i[1] = 0; i[0] = 1;
	#period;
i[3] = 1; i[2] = 1; i[1] = 1; i[0] = 0;
	#period;
i[3] = 1; i[2] = 1; i[1] = 1; i[0] = 1;
	#period;
	$stop;
end

initial
begin
     
s[2] = 0; s[1] = 0; s[0] = 0;
	#period;
s[2] = 0; s[1] = 0; s[0] = 1;
	#period;
s[2] = 0; s[1] = 1; s[0] = 0;
	#period;
s[2] = 0; s[1] = 1; s[0] = 1;
	#period;
s[2] = 1; s[1] = 0; s[0] = 0;
	#period;
s[2] = 1; s[1] = 0; s[0] = 1;
	#period;
s[2] = 1; s[1] = 1; s[0] = 0;
	#period;
s[2] = 1; s[1] = 1; s[0] = 1;
	#period;

	$stop;
end

initial
begin
        /*the following system task will print out the signal values
        every time they change on the Transcript Window */
        $monitor("A=%b, B=%b, C=%b, D=%b, E=%b, F=%b, G=%b, Dp=%b, a=%b, b=%b, c=%b, d=%b", a,b,c,d,e,f,g,dp,i[0],i[1],i[2],i[3]);
	    $monitor("AN0=%b,AN1=%b,AN2=%b,AN3=%b,AN4=%b,AN5=%b,AN6=%b,AN7=%b,sel[0]=%b,sel[1]=%b,sel[2]=%b", an0,an1,an2,an3,an4,an5,an6,an7,s[0],s[1],s[2]);
end
endmodule

