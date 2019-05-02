`timescale 1ns/1ns
module TB;
	//input
	reg clk;

	always #1 clk = ~clk;
		
	always @()
	begin

	end

	initial
		begin

		#100
		$dumpflush; //保存数据
		$stop; //结束
		end

	 D1();
	initial
		begin
			$dumpfile("test.vcd");
			$dumpvars(0, TB);
			$dumpvars(0, D1);
		end
endmodule 
