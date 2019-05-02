/*
aluc[3:0]
x000 ADD x001 AND x010 XOR
x100 SUB x101 OR  x110 LUI
0011 SLL
0111 SRL
1111 SRA
*/
module ALU(a,b,aluc,r,z);
    input [31:0] a,b;
    input [3:0] aluc; //option
    output [31:0] r; //result
    output z;

    wire [31:0] d_and = a&b; //and
    wire [31:0] d_or  = a|b; //or
    wire [31:0] d_xor = a^b; //xor
    wire [31:0] d_lui = {b[15:0],16'h0}; //lui
    wire [31:0] d_and_or  = aluc[2]?d_or : d_and; //sll
    wire [31:0] d_xor_lui = aluc[2]?d_lui : d_xor; //srl
    wire [31:0] d_as,d_sh; //sra

    addsub32 as32 (a,b,aluc[2],d_as);
    shift shofter ();
    mux4x32 select ();

    assign z = ~|r;
endmodule

module addsub32(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] s    
);
    cla32 as32();

endmodule // 

module shift(
    
);

endmodule // shift

module mux4x32(
    
);

endmodule // mux4x32

module cla32(
    
);

endmodule // cla32