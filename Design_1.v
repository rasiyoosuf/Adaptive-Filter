module d1(sum,carry,x1,w,w1,w2,r_,r,clk);
output [10:0]sum,carry;
input [9:0]w1,w2,w;
input [7:0]x1;
input r,r_,clk;
////////////////////////////////////////////////////////////////////////////////////////////////////////
wire c,cc,c_,c11,c12,c13,c14,c15,c16,c17,c18,c19,c110,c111,s11,s12,s13,s14,s15,s16,s17,s18,s19,s110,s111,s112;
wire c21,c22,c23,c24,c25,c26,c27,c28,c29,c210,c211,c212,c213,s21,s22,s23,s24,s25,s26,s27,s28,s29,s210,s211,s212,s213;
wire ic21,ic22,ic23,ic24,ic25,ic26,ic27,ic28,ic29,ic210,ic211,ic212,ic213,is21,is22,is23,is24,is25,is26,is27,is28,is29,is210,is211,is212,is213;
wire sc1,sc2,sc3,sc4,sc5,sc6,sc7,sc8,sc9,sc10,sc11,sc12,sc13,cc1,cc2,cc3,cc4,cc5,cc6,cc7,cc8,cc9,cc10,cc11,cc12,cc13;
assign sum={sc3,sc4,sc5,sc6,sc7,sc8,sc9,sc10,sc11,sc12,sc13};
assign carry={cc4,cc5,cc6,cc7,cc8,cc9,cc10,cc11,cc12,cc13,c_};
///////////////////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////////////////////////
csa cs1_1(s11,c11,w1[9],w2[9],c11,r,clk);
csa cs1_2(s12,c12,w1[8],w2[9],c11,r,clk);
csa cs1_3(s13,c13,w1[7],w2[8],c12,r,clk);
csa cs1_4(s14,c14,w1[6],w2[7],c13,r,clk);
csa cs1_5(s15,c15,w1[5],w2[6],c14,r,clk);
csa cs1_6(s16,c16,w1[4],w2[5],c15,r,clk);
csa cs1_7(s17,c17,w1[3],w2[4],c16,r,clk);
csa cs1_8(s18,c18,w1[2],w2[3],c17,r,clk);
csa cs1_9(s19,c19,w1[1],w2[2],c18,r,clk);
csa cs1_10(s110,c110,w1[0],w2[1],c19,r,clk);
csa cs1_11(s111,c111,1'b0,w2[0],c110,r,clk);
Dffp df1(s112,c111,r,clk);
//////////////////////////////////////////////////////////////////////////////////////////////////////////
assign c_=s212&c213;
assign cc=c_&r_;
assign is21=sc1&r_;
assign is22=sc2&r_|(x1[7]&~r_);
assign is23=sc3&r_|(x1[6]&~r_);
assign is24=sc4&r_|(x1[5]&~r_);
assign is25=sc5&r_|(x1[4]&~r_);
assign is26=sc6&r_|(x1[3]&~r_);
assign is27=sc7&r_|(x1[2]&~r_);
assign is28=sc8&r_|(x1[1]&~r_);
assign is29=sc9&r_|(x1[0]&~r_);
assign is210=sc10&r_|~r_;
assign is211=sc11&r_;
assign is212=sc12&r_;
assign is213=sc13&r_;
/////////////////////////////////////////////////////////////////////////////////////////////////////////
assign ic21=cc1&r_|(~r_&w[9]);
assign ic22=cc2&r_|(~r_&w[8]);
assign ic23=cc3&r_|(~r_&w[7]);
assign ic24=cc4&r_|(~r_&w[6]);
assign ic25=cc5&r_|(~r_&w[5]);
assign ic26=cc6&r_|(~r_&w[4]);
assign ic27=cc7&r_|(~r_&w[3]);
assign ic28=cc8&r_|(~r_&w[2]);
assign ic29=cc9&r_|(~r_&w[1]);
assign ic210=cc10&r_|(~r_&w[0]);
assign ic211=cc11&r_|~r_;
assign ic212=cc12&r_;
assign ic213=cc13&r_;
//////////////////////////////////////////////////////////////////////////////////////////////////////
csas cs2_1(s21,c21,sc1,cc1,is21,ic21,s21,s11,c21,r,clk);
csas cs2_2(s22,c22,sc2,cc2,is22,ic22,s21,s12,c21,r,clk);
csas cs2_3(s23,c23,sc3,cc3,is23,ic23,s21,s13,c22,r,clk);
csas cs2_4(s24,c24,sc4,cc4,is24,ic24,s22,s14,c23,r,clk);
csas cs2_5(s25,c25,sc5,cc5,is25,ic25,s23,s15,c24,r,clk);
csas cs2_6(s26,c26,sc6,cc6,is26,ic26,s24,s16,c25,r,clk);
csas cs2_7(s27,c27,sc7,cc7,is27,ic27,s25,s17,c26,r,clk);
csas cs2_8(s28,c28,sc8,cc8,is28,ic28,s26,s18,c27,r,clk);
csas cs2_9(s29,c29,sc9,cc9,is29,ic29,s27,s19,c28,r,clk);
csas cs2_10(s210,c210,sc10,cc10,is210,ic210,s28,s110,c29,r,clk);
csas cs2_11(s211,c211,sc11,cc11,is211,ic211,s29,s111,c210,r,clk);
csas cs2_12(s212,c212,sc12,cc12,is212,ic212,s210,s112,c211,r,clk);
csas cs2_13(s213,c213,sc13,cc13,is213,ic213,s211,c,c212,r,clk);
Dffp df2(c,cc,r,clk);
endmodule
///////////////////////////////////////////////////////////////////////////////////////////////////////////
module test_design1();
  wire [10:0]s,c;
  reg [9:0]w1,w2,w;
  reg r,r_,clk;
  reg [7:0]x1;
  wire [9:0]y;
  d1 dafck(s,c,x1,w,w1,w2,r_,r,clk);
  initial 
  begin
  r<=1'd0;
  r_<=1'd0;
  clk<=1'd0;
  x1<=8'b11111101;
  w<=10'b1111111111;
  
  w1<=10'b0000000000;
  w2<=10'b1111111111;
  #10;
  r<=1'd1;
  #90;
  clk=1'd1;
  #50;
  r_=1'd1;
  w1<=10'b1111111111; 
  w2<=10'b1111111111;
  clk<=1'd0;
  #50;
  clk=1'd1;
  #50;
  w1<=10'b1111111111; 
  w2<=10'b1111111111;
  clk<=1'd0;
  #50;
  clk=1'd1;
  #50;
  w1<=10'b1111111111; 
  w2<=10'b1111111111;
  clk<=1'd0;
  #50;
  clk=1'd1;
  #50;
  w1<=10'b0000000000; 
  w2<=10'b0000000000;
  clk<=1'd0;
  #50;
  clk=1'd1;
  #50;
  w1<=10'b0000000000; 
  w2<=10'b0000000000;
  clk<=1'd0;
  #50;
  clk<=1'd1;
  end
endmodule
  
  
  
  
  
  
  
  
  
  
  
  /*
  initial 
  begin
  r=1'b0;
  #10;
  x1<=8'd0;
  r_<=1'b0;
  #10;
  clk=1'b0;
  #10;
  r=1'b1;
  #10;
  r_=1'b1;
  #60;
  ////////////////////////////////////////////////////////////////
  w1=10'b0000001011;
  #10;
  w2=10'b0000010111;
  #10;
  clk=1'b1;
  #50;
  clk=1'b0;
  #30
  //////////////////////////////////////////////////////////////
  //a=4'b1011;
  w1=10'b1000010001;
  #10;
  //b=4'b1101;
  w2=10'b1001010101;
  #10;
  clk=1'b1;
  #50;
  clk=1'b0;
  #30
  //////////////////////////////////////////////////////////////
  w1=10'b0000010001;
  #10;
  w2=10'b0000100011;
  #10;
  clk=1'b1;
  #50;
  clk=1'b0;
  #30
  //////////////////////////////////////////////////////////////
  w1=10'b0000100101;
  #10;
  w2=10'b1110100101;
  #10;
  clk=1'b1;
  #50;
  clk=1'b0;
  #30
  //////////////////////////////////////////////////////////////
  w1=10'b0000000000;
  #10;
  w2=10'b0000000000;
  #10;
  clk=1'b1;
  #50;
  clk=1'b0;
  #30;
  //////////////////////////////////////////////////////////////
 /* w1=10'b0000000000;
  #10;
  w2=10'b0000000000;
  #10;
  clk=1'b1;
  #50;
  clk=1'b0;
  #30;
end
  */
  
  