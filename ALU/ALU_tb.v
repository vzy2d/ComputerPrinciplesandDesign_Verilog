`timescale 1ns/1ns
module TB;
    reg [31:0] a,b;
    reg [3:0] aluc; //option
    wire [31:0] r; //result
    wire z;

	always #10 begin
		aluc <= aluc + 4'd1;
	end
	initial
		begin
		aluc <= 4'b0000; //ADD
		a <= 32'h00000001;
		b <= 32'h00000002;
		#10
		aluc <= 4'b0100; //SUB
		#10

		aluc <= 4'b0001; //AND
		a <= 32'hCCCCCCCC;
		b <= 32'hAAAAAAAA;
		#10
		aluc <= 4'b0101; //OR
		#10

		aluc <= 4'b0010; //XOR
		a <= 32'h33333333;
		b <= 32'hFF005555;
		#10
		aluc <= 4'b0110; //LUI
		#10

		aluc <= 4'b0011; //SLL
		a <= 32'h0000000F;
		b <= 32'hFFFFFFFF;
		#10
		aluc <= 4'b0111; //SRL
		#10
		
		aluc <= 4'b1111; //SRA
		a <= 32'h00000010;
		b <= 32'h7F000000;
		#10
		a <= 32'h00000010;
		b <= 32'hFFFFFF00;
		#10

		
		$dumpflush;
		$stop;
		end

	ALU D1(a,b,aluc,r,z);
	initial
		begin
			$dumpfile("test.vcd");
			$dumpvars(0, TB);
			$dumpvars(0, D1);
		end

endmodule 