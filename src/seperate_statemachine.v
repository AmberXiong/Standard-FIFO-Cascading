`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2016 05:36:09 PM
// Design Name: 
// Module Name: seperate_statemachine
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


module seperate_statemachine(
    input int_clk,
    input rst,
    input full_1,
    input empty_0,
    output reg rd_en_0,
    output reg wr_en_1
    );
 reg [1:0] current_state,next_state;
 reg wr_en_temp;
 parameter s0 = 2'b01;
 parameter s1 = 2'b10;
 
 always@(posedge int_clk or posedge rst)
  begin
   if(rst) 
    begin
     current_state<=s0;
    end
   else
    begin
     current_state<=next_state;
    end
  end    
 
 always@(current_state or empty_0 or full_1 or rst)
  begin
   if(rst)
    begin
     next_state=s0;
     rd_en_0=0;
     wr_en_temp=0;
    end
   else
    begin
     case(current_state)
      s0: 
       if(!empty_0)
        begin
         rd_en_0=1;
         wr_en_temp=0;
         next_state=s1;
        end
       else
        begin
         rd_en_0=0;
         wr_en_temp=0;
         next_state=s0;
        end
//      next_state=(empty_0==0)?s1:s0;
      s1: 
       if(!full_1)
        begin
         rd_en_0=0;
         wr_en_temp=1;
         next_state=s0;
        end
       else
        begin
         rd_en_0=0;
         wr_en_temp=0;
         next_state=s1;
        end 
//      next_state=(full_1==0)?s0:s1;
      default: next_state=s0;
     endcase
    end
  end

// always@(rst or current_state)
// begin
//  if(rst)
//   begin
//    rd_en_0=0;
//    wr_en_temp=0;
//   end
//  else
//   begin
//    case(current_state)
//     s0: begin
//         rd_en_0=1;
//         wr_en_temp=0;
//         end
//     s1: begin
//         rd_en_0=0;
//         wr_en_temp=1;
//         end
//     default: begin
//              rd_en_0=0;
//              wr_en_temp=0;
//              end
//    endcase
//   end
//  end
 always@(posedge int_clk or posedge rst)
  begin
   if(rst)
    begin
     wr_en_1<=0;
    end
   else
    begin
     wr_en_1<=wr_en_temp;
    end
  end
endmodule
