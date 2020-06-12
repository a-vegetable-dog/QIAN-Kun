/////////////////////////////////////
//logic shifter part
//dataout = datain >> right
////////////////////////////////////
module lg_shifter(
input [15:0]datain,
input right,
input [1:0] bitnum,
output [15:0]dataout
);

wire [14:0]	right_temp = datain[15:1];
wire [14:0] left_temp = datain[14:0];

wire [15:0] data_temp = (right==1'b1)? {1'b0, right_temp} : {left_temp, 1'b0};

assign  dataout[3:0] = {(bitnum == 2'b00)? {(!right)&data_temp[3], data_temp[2:0]} : {data_temp[3:0]}};
assign  dataout[7:4] = {(bitnum == 2'b10)? {data_temp[7]} : {(!right)&data_temp[7]},
                        data_temp[6:5], (bitnum == 2'b00)? {right&data_temp[4]} : {data_temp[4]} };
assign  dataout[11:8] = {(bitnum == 2'b00)? {(!right)&data_temp[11]} : data_temp[11],
                        data_temp[10:9],(bitnum == 2'b10)? {data_temp[8]} : {right&data_temp[8]} };
assign  dataout[15:12]= {data_temp[15:13], (bitnum == 2'b00)? {right&data_temp[12]} : {data_temp[12]} };

endmodule										  
