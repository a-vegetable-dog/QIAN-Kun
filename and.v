////////////////////////////////
//bit operation
//AND
//OR
//XOR
//NOT
///////////////////////////////

module AND(
input [15:0] dataA, dataB,
output [15:0] out
);
assign out[0]=dataA[0]&dataB[0];
assign out[1]=dataA[1]&dataB[1];
assign out[2]=dataA[2]&dataB[2];
assign out[3]=dataA[3]&dataB[3];
assign out[4]=dataA[4]&dataB[4];
assign out[5]=dataA[5]&dataB[5];
assign out[6]=dataA[6]&dataB[6];
assign out[7]=dataA[7]&dataB[7];
assign out[8]=dataA[8]&dataB[8];
assign out[9]=dataA[9]&dataB[9];
assign out[10]=dataA[10]&dataB[10];
assign out[11]=dataA[11]&dataB[11];
assign out[12]=dataA[12]&dataB[12];
assign out[13]=dataA[13]&dataB[13];
assign out[14]=dataA[14]&dataB[14];
assign out[15]=dataA[15]&dataB[15];

endmodule

module OR(
input [15:0] dataA, dataB,
output [15:0] out
);
assign out[0]=dataA[0]|dataB[0];
assign out[1]=dataA[1]|dataB[1];
assign out[2]=dataA[2]|dataB[2];
assign out[3]=dataA[3]|dataB[3];
assign out[4]=dataA[4]|dataB[4];
assign out[5]=dataA[5]|dataB[5];
assign out[6]=dataA[6]|dataB[6];
assign out[7]=dataA[7]|dataB[7];
assign out[8]=dataA[8]|dataB[8];
assign out[9]=dataA[9]|dataB[9];
assign out[10]=dataA[10]|dataB[10];
assign out[11]=dataA[11]|dataB[11];
assign out[12]=dataA[12]|dataB[12];
assign out[13]=dataA[13]|dataB[13];
assign out[14]=dataA[14]|dataB[14];
assign out[15]=dataA[15]|dataB[15];

endmodule

module XOR(
input [15:0] dataA, dataB,
output [15:0] out
);
assign out[0]=(dataA[0]==dataB[0])?1'b0:1'b1;
assign out[1]=(dataA[1]==dataB[1])?1'b0:1'b1;
assign out[2]=(dataA[2]==dataB[2])?1'b0:1'b1;
assign out[3]=(dataA[3]==dataB[3])?1'b0:1'b1;
assign out[4]=(dataA[4]==dataB[4])?1'b0:1'b1;
assign out[5]=(dataA[5]==dataB[5])?1'b0:1'b1;
assign out[6]=(dataA[6]==dataB[6])?1'b0:1'b1;
assign out[7]=(dataA[7]==dataB[7])?1'b0:1'b1;
assign out[8]=(dataA[8]==dataB[8])?1'b0:1'b1;
assign out[9]=(dataA[9]==dataB[9])?1'b0:1'b1;
assign out[10]=(dataA[10]==dataB[10])?1'b0:1'b1;
assign out[11]=(dataA[11]==dataB[11])?1'b0:1'b1;
assign out[12]=(dataA[12]==dataB[12])?1'b0:1'b1;
assign out[13]=(dataA[13]==dataB[13])?1'b0:1'b1;
assign out[14]=(dataA[14]==dataB[14])?1'b0:1'b1;
assign out[15]=(dataA[15]==dataB[15])?1'b0:1'b1;

endmodule

module NOT(
input [15:0] dataA,
output [15:0] out
);
assign out[0]=!dataA[0];
assign out[1]=!dataA[1];
assign out[2]=!dataA[2];
assign out[3]=!dataA[3];
assign out[4]=!dataA[4];
assign out[5]=!dataA[5];
assign out[6]=!dataA[6];
assign out[7]=!dataA[7];
assign out[8]=!dataA[8];
assign out[9]=!dataA[9];
assign out[10]=!dataA[10];
assign out[11]=!dataA[11];
assign out[12]=!dataA[12];
assign out[13]=!dataA[13];
assign out[14]=!dataA[14];
assign out[15]=!dataA[15];

endmodule
