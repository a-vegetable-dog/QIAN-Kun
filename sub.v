//////////////////////////////////
//subtraction part
//sub = dataA - dataB
//////////////////////////////////
module sub(
input [15:0] dataA,
input [15:0] dataB,
input [1:0] bitnum,
output [15:0] sub
);

wire [4:0] c0,c1,c2,c3;
wire [3:0] d0,d1,d2,d3,d4,d5,d6,d7;
wire [15:0] negB;

assign negB = ~dataB;
assign d0 = dataA[3:0];
assign d1 = dataA[7:4];
assign d2 = dataA[11:8];
assign d3 = dataA[15:12];
assign d4 = negB[3:0];
assign d5 = negB[7:4];
assign d6 = negB[11:8];
assign d7 = negB[15:12];

assign c0[4:0]= d0 + d4 +2'b01;
assign c1[4:0]= (bitnum==2'b00)? (d1+ d5 +2'b01):(d1+ d5 + c0[4]);
assign c2[4:0]= (bitnum==2'b10)? (d2+ d6 +c1[4]):(d2+ d6 +2'b01);
assign c3[4:0]= (bitnum==2'b00)? (d3+ d7 +2'b01):(d3+ d7 + c2[4]);

assign sub = {c3[3:0],c2[3:0],c1[3:0],c0[3:0]};

endmodule
