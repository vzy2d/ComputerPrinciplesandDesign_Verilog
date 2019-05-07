module dffe32(d,clk,clrn,e,q);
    input [31:0] d;
    input clk,clrn,e;
    output reg [31:0] q;

    always @(negedge clrn or posedge clk) begin
        if(!clrn) q <= 32'd0; //clrn==0 -> clear <q> 
        else if (e) q <= d; //e==1 -> <d>(data in)write2 <q>
    end
endmodule // dffe32

