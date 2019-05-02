`timescale 1ns/1ns
module TB;
//input
    reg [31:0] d;
    reg [4:0] sa;
    reg right,arith;
    wire [31:0] sh;

	shift D1(d,sa,right,arith,sh);
	initial
		begin
			$dumpfile("test.vcd");
			$dumpvars(0, TB);
			$dumpvars(0, D1);
		end

	initial
		begin
		d <= 32'b10000000000000001111111111111111;
		sa <= 5'd0;
		right <=0;
		arith <=0; //init
		#5

		right <=0;
		arith <=0;
		sa <= 5'd5;
		#5

		right <=1;
		arith <=0;
		sa <= 5'd5;
		#5

		right <=1;
		arith <=1;
		sa <= 5'd16;
		#10

		$dumpflush; //保存数据
		$stop; //结束
		end
endmodule 

/*
-Notepad++自动补全-
module endmodule
assign wire reg
begin end
initial always
function endfunction
task endtask
case default endcase
parameter
posedge negedge
*/