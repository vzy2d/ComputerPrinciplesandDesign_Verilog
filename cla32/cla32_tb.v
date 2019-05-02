`timescale 1ns/1ns
module TB;

reg [31:0] a,b;
reg ci;
wire [31:0] s;
wire co;

cla32 D1(a,b,ci, s,co);
initial
	begin
		$dumpfile("test.vcd");
		$dumpvars(0, TB);
		$dumpvars(0, D1.a, D1.b, D1.ci, D1.s, D1.co);
	end

initial
	begin
	ci <= 1'b1;
	a <= 32'd50;
	b <= 32'd60;
	#100
	$dumpflush; //保存数据
	$stop; //结束
	end
endmodule 
