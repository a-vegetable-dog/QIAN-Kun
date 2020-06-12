//////////////////////////////////////
// HKUST EESM5020 course project
// 2020.6.8
// QIAN Kun    ICDE
// DING Yayi   ICDE
//include parts:
///////1.addition part
///////2.subtraction part
///////3.multiplication and multiplication-addition part
///////4.logic shifter part
///////5.arithmetic shifter part
///////6.bit operation part
//////////////////////////////////////
module SIMD(
input [11:0] instruction,
input clk,
input rst,
output [31:0] outputvalue
);

///////////////////////////////////register////////////////////////////////
reg [15:0] register[0:15];
//4bits operation:register[0]-[3]
//8bits operation:register[4]-[7]
//16bits operation:register[8]-[11]
////////////////////////////////////////////////////////////////////////
reg [11:0]command; //store instruction which will be execute, and release "instruction" wire for next instruction
reg [1:0]bitwidth; //4/8/16bit operation
reg add_en,sub_en,mux_en,shiftlg_en,mac_en,shiftam_en,and_en,or_en,xor_en,not_en; //select algorithm base on "command"
reg [3:0]fa,fb,fc; //decide use which reg, like 4bit operation,use first and second 4-bits reg as input,third as output,then "bitwidth"=="command[7:6]==00
                   //input reg number== 00,01 ,ouput reg number= 10. SO fa={00_00},fb={00_01},fc={00_10}, refer to reg[0],reg[1],reg[2]
reg [15:0]execute_H,execute,mux_H; //selected output value, mux and mac output is 32 bits not fit in the "executed"
reg [3:0]wbnum,wb;

wire [15:0] add_out,sub_out,mux_out_H,mux_out_L,and_out,or_out,xor_out,not_out,shifam_out,shiflg_out; //output  of each  module

always @(posedge clk)
begin
  if(rst) begin
            command<=12'b0;
            bitwidth<=2'b0;
            add_en<=0; sub_en<=0; mux_en<=0; mac_en<=0; shiftlg_en<=0; shiftam_en<=0; and_en<=0; or_en<=0; xor_en<=0; not_en<=0;
            fa<=4'b0; fb<=4'b0; fc<=4'b0;
            execute<=16'b0;
            wbnum<=4'b0;
            /////////////////////////reg_data///////////////////////////
            register[0]<=16'b0;  
            register[1]<=16'b0001_1000_1000_0100;   
            register[2]<=16'b1110_0110_0110_1100;
            register[3]<=16'b0;

            register[4]<=16'b0010_0111_0100_1100;
            register[5]<=16'b1101_1000_1000_0101;
            register[6]<=16'b0;
            register[7]<=16'b0;

            register[8]<=16'b0001_0110_0100_1010;
            register[9]<=16'b1111_1010_1010_0100;
            register[10]<=16'b0;
            register[11]<=16'b0;

            register[12]<=16'b0;
            register[13]<=16'b0001_1000_1000_0100;
            register[14]<=16'b0;
            register[15]<=16'b0;
          end
  else begin
///////////////////////////STATE_IF/////////////////////////////
        command<=instruction;
///////////////////////////STATE_ID/////////////////////////////
        //bitwidth
        bitwidth<=command[7:6];
        //enable signals
        add_en<=((command[11:8]==4'd0)? 1'b1:1'b0);
        sub_en<=((command[11:8]==4'd1)? 1'b1:1'b0);
        mux_en<=((command[11:8]==4'd2)? 1'b1:1'b0);
        mac_en<=((command[11:8]==4'd3)? 1'b1:1'b0);
        shiftlg_en<=((command[11:8]==4'd4)? 1'b1:1'b0);
        shiftam_en<=((command[11:8]==4'd6)? 1'b1:1'b0);
        and_en<=((command[11:8]==4'd8)? 1'b1:1'b0);
        or_en<=((command[11:8]==4'd9)? 1'b1:1'b0);
        xor_en<=((command[11:8]==4'd10)? 1'b1:1'b0);
        not_en<=((command[11:8]==4'd11)? 1'b1:1'b0);
        //address
        fa<={command[7:6],command[1:0]};
        fb<={command[7:6],command[3:2]};
        fc<={command[7:6],command[5:4]};
////////////////////////////STATE_EX////////////////////////////////
        execute <= add_en? add_out:(sub_en? sub_out:(mux_en? mux_out_L:(mac_en? mux_out_L:(shiftlg_en? shiflg_out:(
                  shiftam_en? shifam_out:(and_en? and_out:(or_en? or_out:(xor_en? xor_out:(not_en? not_out:0)))))))));
        execute_H <=(mux_en|mac_en)? mux_out_H:16'b0;
        wbnum <= fc;
////////////////////////////STATE_WB////////////////////////////////
        register[wbnum] <=execute;
        mux_H<=execute_H;
        wb<=wbnum;
  end
end

///////////////////////////moudle///////////////////////////////////////
add    a(.dataA(register[fa]),.dataB(register[fb]),.bitnum(bitwidth),.sum(add_out));
sub    b(.dataA(register[fa]),.dataB(register[fb]),.bitnum(bitwidth),.sub(sub_out));
multi mu(.A(register[fa]),.B(register[fb]),.dataC(register[fc]),.select(mac_en),.bitnum(bitwidth),.multi_H(mux_out_H),.multi_L(mux_out_L));
AND   an(.dataA(register[{fb[1:0],fa[1:0]}]),.dataB(register[fc]),.out(and_out));
OR     o(.dataA(register[{fb[1:0],fa[1:0]}]),.dataB(register[fc]),.out(or_out));
XOR   xo(.dataA(register[{fb[1:0],fa[1:0]}]),.dataB(register[fc]),.out(xor_out));
NOT   no(.dataA(register[{fb[1:0],fa[1:0]}]),.out(not_out));
am_shifter am(.datain(register[fa]),.right(fb[0]),.bitnum(bitwidth),.dataout(shifam_out));
lg_shifter lg(.datain(register[fa]),.right(fb[0]),.bitnum(bitwidth),.dataout(shiflg_out));
//////////////////////////////////////////////////////////////////////////////
assign outputvalue = {mux_H,register[wb]};

endmodule
