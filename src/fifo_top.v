`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2016 03:03:49 PM
// Design Name: 
// Module Name: fifo_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module fifo_top(
    input rst,
    input wr_clk,
    input wr_en,
    input int_clk,
    input rd_clk,
    input rd_en,
    input [35:0] din,
    output [35:0] dout,
    output full,
    output empty
    );
 wire rd_en_0,wr_en_1; //this is control signal of fifo_fwft's rd_en and fifo_standard's wr_en.
 wire [35:0] dout_0;
 wire empty_0;
 wire full_1;
// wire int_clk_n;
     
 fifo_36_512 fifo_0(
    .rst(rst),
    .wr_clk(wr_clk),
    .rd_clk(int_clk),
    .din(din),
    .wr_en(wr_en),
    .rd_en(rd_en_0),
    .dout(dout_0),
    .full(full),
    .empty(empty_0)
    );  
    
  seperate_statemachine state_machine0(
    .int_clk(int_clk),
    .rst(rst),
    .full_1(full_1),
    .empty_0(empty_0),
    .rd_en_0(rd_en_0),
    .wr_en_1(wr_en_1)
    );  

//assign int_clk_n=~int_clk;    
  fifo_36_512 fifo_1(
    .rst(rst),
    .wr_clk(int_clk),
    .rd_clk(rd_clk),
    .wr_en(wr_en_1),
    .rd_en(rd_en),
    .din(dout_0),
    .dout(dout),
    .empty(empty),
    .full(full_1)
    );
endmodule
