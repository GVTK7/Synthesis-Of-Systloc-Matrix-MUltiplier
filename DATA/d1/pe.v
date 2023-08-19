// N size of input data
//M size of the calculated output
//K size of the desired output 




module pe #(parameter N=8,K=8) (A,B, clk,rst,sn,data,A1,B1);

parameter M=2*N-1;
input [N-1:0]A,B;
input clk,rst,sn;
output reg [K-1:0]data;
output  [N-1:0] A1,B1;

//Multiplication
wire [2*N-1:0]out;
Array_MUL_Sign #(N,N) mul_pe(A,B,sn,out);



reg [M-1:0]add_in1;
wire [M-1:0]add_in2;
wire [M-1:0]add_sum;


//Adition
/*assign add_in1={{(M-N-N){sn}},out};*/
always@(*)begin
	add_in1=out;
end


//Add_Sub_Nbit #(M)  add_pe({(sn){add_in1[M-2]},add_in1},add_in2}, 0, add_sum);
Add_Sub_Nbit #(M)  add_pe(add_in1,add_in2, 1'b0, add_sum);

//Data Flipflop
wire [M-1:0]QbarD;
DFlipFlop  #(M) data_flipflop(clk,rst, add_sum, add_in2, QbarD);


//A flipflop
wire [N-1:0]QbarA;
DFlipFlop  #(N) A_flipflop(clk,rst,A,A1,QbarA);

//B flipflop
wire [N-1:0]QbarB;
DFlipFlop  #(N) B_flipflop(clk,rst,B,B1, QbarB);
/*assign data=add_in2;*/
always@(*)begin
	data=add_in2[K-1:0];
end

endmodule




















/*
always@(posedge clk)begin
if(rst==1)
data=0;
else 
data=add_in2;
end
*/
