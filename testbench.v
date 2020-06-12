`timescale 1ns/1ps
module tb();

reg [11:0] in;
reg clk;
reg rst;
wire [31:0] out;

SIMD s(.instruction(in),.clk(clk),.rst(rst),.outputvalue(out));

initial 
begin
    clk = 1'b0;
    forever #10 clk = ~clk;
end


initial
begin

rst=1;//////reg ;

#40 rst=0;

in=12'b0000_01_10_01_00;  //add 8bit (reg4 + reg5): 0000_ffd1
#20



in=12'b1000_10_01_10_00;  //reg8 and reg 9 : 0000_1200
#20



in=12'b0001_10_10_01_00;  //sub 16bit (reg8 - reg9) : 0000_1ba6
#20



in=12'b0010_01_11_01_00;  //mux 8bit (reg4 x reg5) :  f9e8_db7c
#20



in=12'b0100_10_11_01_00;  //lg_shift left 16bit (reg8):  0000_2c94 error
#20



in=12'b1010_00_01_00_10;  //reg2 xor reg 1 :  0000_fee8 
#20



in=12'b0011_01_10_01_00;  //mac 8bit   0000_ffd1 + f9e8_db7c= : f9e7_db4d 
#20


in=12'b1011_00_00_00_01;   //not reg1:   0000_e77b error
#20



in=12'b0100_01_11_01_00;  //am_shift right 8bit: 0000_1326  
#20



in=12'b1001_00_01_00_10;  //reg2 or reg 1 : 0000_feec 
#20

#110

$finish;




end

endmodule
