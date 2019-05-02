`timescale 1ns/1ns
module TB;
	reg [31:0] a0,a1,a2,a3;
    reg [1:0] s;
    wire [31:0] y;

	initial
		begin
		a0 <= 32'd0;
		a1 <= 32'd1;
		a2 <= 32'd2;
		a3 <= 32'd3;
		s <= 2'd3;
		#5
		s <= 2'd2;
		#5
		s <= 2'd1;
		#5
		s <= 2'd0;
		#5
		#100
		$dumpflush; //保存数据
		$stop; //结束
		end
		
	mux4x32 D1(a0,a1,a2,a3,s, y);
	initial
		begin
			$dumpfile("test.vcd");
			$dumpvars(0, TB);
			$dumpvars(0, D1);
		end

endmodule 
