//////////////////////////////////
//multiplication and multiplication-addition part
//select:1-mac  0-mux
//multi_H,multi_L = A * B + dataC
//////////////////////////////////
module multi(
input [15:0] A,
input [15:0] B,
input [15:0] dataC,
input [1:0] bitnum,
input select,
output [15:0] multi_H,
output [15:0] multi_L
);

wire [15:0] m0,m1,m2,m3,m4,m5,m6,m7,m8,m9,m10,m11,m12,m13,m14,m15;
wire [31:0] c0,c1,c2;

assign m0 = B[0]? A : 0;
assign m1 = B[1]? A : 0;
assign m2 = B[2]? A : 0;
assign m3 = B[3]? A : 0;
assign m4 = B[4]? A : 0;
assign m5 = B[5]? A : 0;
assign m6 = B[6]? A : 0;
assign m7 = B[7]? A : 0;
assign m8 = B[8]? A : 0;
assign m9 = B[9]? A : 0;
assign m10 = B[10]? A : 0;
assign m11 = B[11]? A : 0;
assign m12 = B[12]? A : 0;
assign m13 = B[13]? A : 0;
assign m14 = B[14]? A : 0;
assign m15 = B[15]? A : 0;


assign c0[7:0]  = {m0[3]  ,m0[3]  ,m0[3]  ,m0[3:0]}   + {m1[3],  m1[3],  m1[3:0],   1'b0}+ {m2[3],  m2[3:0],   2'b0}+ {B[3]? (~m3[3:0]+1):m3[3:0],      3'b0}+ {select? (dataC[3]?4'hf:4'b0):4'b0,select?dataC[3:0]:4'b0};
assign c0[15:8] = {m4[7]  ,m4[7]  ,m4[7]  ,m4[7:4]}   + {m5[7],  m5[7],  m5[7:4],   1'b0}+ {m6[7],  m6[7:4],   2'b0}+ {B[7]? (~m7[7:4]+1):m7[7:4],      3'b0}+ {select? (dataC[7]?4'hf:4'b0):4'b0,select?dataC[7:4]:4'b0};
assign c0[23:16]= {m8[11] ,m8[11] ,m8[11] ,m8[11:8]}  + {m9[11], m9[11], m9[11:8],  1'b0}+ {m10[11],m10[11:8], 2'b0}+ {B[11]?(~m11[11:8]+1):m11[11:8],  3'b0}+ {select? (dataC[11]?4'hf:4'b0):4'b0,select?dataC[11:8]:4'b0};
assign c0[31:24]= {m12[15],m12[15],m12[15],m12[15:12]}+ {m13[15],m13[15],m13[15:12],1'b0}+ {m14[15],m14[15:12],2'b0}+ {B[15]?(~m15[15:12]+1):m15[15:12],3'b0}+ {select? (dataC[15]?4'hf:4'b0):4'b0,select?dataC[15:12]:4'b0};

assign c1[15:0] = {m0[7]?7'h7f:7'h0,m0[7:0]}   +{m1[7]?6'h3F:6'h0,m1[7:0],1'b0}   + {m2[7]?5'h1f:5'h0,m2[7:0],2'b00}    + {m3[7]?4'hf:4'h0,m3[7:0],3'b0}+
				   {m4[7]?3'h7:3'h0, m4[7:0],4'b0}     +{m5[7]?2'h3:2'h0,m5[7:0],5'b0}     +{m6[7],m6[7:0],6'b0}     +{B[7]?(~m7[7:0]+1):m7[7:0],7'b0}      +{select? (dataC[7]?8'hff:8'b0):8'b0,select?dataC[7:0]:8'b0};
assign c1[31:16]= {m8[15]?7'h7f:7'h0,m8[15:8]} +{m9[15]?6'h3F:6'h0,m9[15:8],1'b0} + {m10[15]?5'h1f:5'h0,m10[15:8],2'b00}+ {m11[15]?4'hf:4'h0,m11[15:8],3'b0}+
				   {m12[15]?3'h7:3'h0, m12[15:8],4'b0} +{m13[15]?2'h3:2'h0,m13[15:8],5'b0} +{m14[15],m14[15:8],6'b0} +{B[15]?(~m15[15:8]+1):m15[15:8],7'b0} +{select? (dataC[15]?8'hff:8'b0):8'b0,select?dataC[15:8]:8'b0};

assign c2 = {m0[15]? 15'h7fff:15'h0,m0}       +{m1[15]? 14'h3fff:14'h0, m1,1'b0}  +{m2[15]? 13'h1fff:13'h0,m2 ,2'b0} +{m3[15]? 12'hfff:12'h0,m3,3'b0}
	       +{m4[15]? 11'h7ff :11'h0,m4 ,4'b0} +{m5[15]? 10'h3ff :10'h0, m5,5'b0}  +{m6[15]?  9'h1ff : 9'h0,m6 ,6'b0} +{m7[15]?  8'hff :8'h0, m7,7'b0}
           +{m8[15]?  7'h7f  : 7'h0,m8 ,8'b0} +{m9[15]?  6'h3f  : 6'h0, m9,9'b0}  +{m10[15]? 5'h1f  : 5'h0,m10,10'b0}+{m11[15]? 4'hf  :4'h0, m11,11'b0}
           +{m12[15]? 3'h7   : 3'h0,m12,12'b0}+{m13[15]? 2'h3   : 2'h0, m13,13'b0}+{m14[15]? 1'h1   : 1'h0,m14,14'b0}+{B[15]?(~m15+1):m15,15'b0}+{select? (dataC[15]?16'hffff:16'b0):16'b0,select?dataC:16'b0};

assign multi_H=bitnum[1]? c2[31:16]:(bitnum[0]? c1[31:16]:c0[31:16]);
assign multi_L=bitnum[1]? c2[15:0]:(bitnum[0]? c1[15:0]:c0[15:0]);

endmodule
