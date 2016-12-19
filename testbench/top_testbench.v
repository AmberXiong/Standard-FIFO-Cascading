`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/14/2016 12:19:14 PM
// Design Name: 
// Module Name: top_testbench
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


module top_testbench();
 reg wr_clk,rd_clk,int_clk,wr_en,rd_en,rst;
 reg [35:0] din;
 wire [35:0] dout;
 wire empty,full;
 
 fifo_top DUT(
  .rst(rst),
  .wr_clk(wr_clk),
  .wr_en(wr_en),
  .int_clk(int_clk),
  .rd_clk(rd_clk),
  .rd_en(rd_en),
  .din(din),
  .dout(dout),
  .empty(empty),
  .full(full)
  ); 

 initial begin
  $dumpfile ("fifostatemachine2.dump");
  $dumpvars (0, fifo_top);
 end
 
 initial begin
  wr_clk=0;
  repeat(24000) #10 wr_clk= ~wr_clk;
  repeat(6000) #20 wr_clk=~wr_clk;
  repeat(8000) #30 wr_clk=~wr_clk;
  repeat(6000) #20 wr_clk=~wr_clk;
  $finish;
  end
     
 initial begin
  int_clk=0;
  repeat(4000) #30 int_clk= ~int_clk;
  repeat(6000) #20 int_clk=~int_clk;
  repeat(4000) #30 int_clk=~int_clk;
  repeat(6000) #20 int_clk=~int_clk;
  repeat(24000) #10 int_clk=~int_clk;
  $finish;
  end
        
 initial begin
  rd_clk=0;
  repeat(6000) #20 rd_clk= ~rd_clk;
  repeat(4000) #30 rd_clk= ~rd_clk;
  repeat(24000) #10 rd_clk= ~rd_clk;
  repeat(6000) #20 rd_clk= ~rd_clk;
  repeat(4000) #30 rd_clk= ~rd_clk;
  $finish;
  end
     
 initial begin
  rst=1;
  wr_en=0;
  rd_en=0;
  #200 rst=0;
  #120 wr_en=1;
  #4000 rd_en=1;
  #800 rd_en=0;
  #41300 wr_en=0;
  #40 rd_en=1;
  #63000 wr_en=1;
  #10540 rst=1;
         wr_en=0;
         rd_en=0;
  #200 rst=0;
  #120 wr_en=1;
  #4000 rd_en=1;
  #800 rd_en=0;
  #41300 wr_en=0;
  #40 rd_en=1;
  #63000 wr_en=1;
  #10540 rst=1;
         wr_en=0;
         rd_en=0;
  #200 rst=0;
  #120 wr_en=1;
  #4000 rd_en=1;
  #800 rd_en=0;
  #41300 wr_en=0;
  #40 rd_en=1;
  #63000 wr_en=1;
  #10540 rst=1;
         wr_en=0;
         rd_en=0;
  #200 rst=0;
  #120 wr_en=1;
  #4000 rd_en=1;
  #800 rd_en=0;
  #41300 wr_en=0;
  #40 rd_en=1;
  #63000 wr_en=1;
  #10540 rst=1;
         wr_en=0;
         rd_en=0;
  #200 rst=0;
  #120 wr_en=1;
  #4000 rd_en=1;
  #800 rd_en=0;
  #41300 wr_en=0;
  #40 rd_en=1;
  #63000 wr_en=1;
  #10540 rst=1;
         wr_en=0;
         rd_en=0;
  #200 rst=0;
  #120 wr_en=1;
  #4000 rd_en=1;
  #800 rd_en=0;
  #41300 wr_en=0;
  #40 rd_en=1;
  #63000 wr_en=1;  
  end
     
 initial begin
  din= 36'b1;
  #360 din=36'b10;
  repeat(5982) #20 din=din+1;
  #1 din= 36'b1;
  #359 din=36'b10;
  repeat(5982) #20 din=din+1;
  #1 din= 36'b1;
  #359 din=36'b10;
  repeat(2911) #40 din=din+1;
  #1 din= 36'b1;
  #359 din=36'b10;
  repeat(1994) #60 din=din+1;
  #1 din= 36'b1;
  #359 din=36'b10;
  repeat(1994) #60 din=din+1;
  #1 din= 36'b1;
  #359 din=36'b10;
  repeat(2911) #40 din=din+1;  
  end   
                
endmodule
