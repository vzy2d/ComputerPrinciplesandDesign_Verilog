`timescale 1ns/1ns
module TB;
	reg [31:0] d;
    reg clk,clrn,e;
    wire [31:0] q;

	always #2 clk = ~clk;
	always #4 e = ~e;
		
	always #3
	begin
		d <= d + 32'd1;
	end

	initial
		begin
		d <= 32'd0;
		clk <= 0;
		clrn <= 0;
		e <= 0;
		#5
		e <= 1;
		#5
		clrn <= 1;
		#100
		$dumpflush; //保存数据
		$stop; //结束
		end

	dffe32 D1(d,clk,clrn,e,q);
	initial
		begin
			$dumpfile("test.vcd");
			$dumpvars(0, TB);
			$dumpvars(0, D1);
		end
endmodule 
