// EEM16 - Logic Design
// Design Assignment #3.2
// dassign3_2.v
// Verilog template

// You may define any additional modules as necessary
// Do not delete or modify any of the modules provided

// ****************
// Blocks to design
// ****************

// 3.2a) Inter-layer module
// four sets of inputs: 8 bit value, 1 bit input ready
// one 1 bit input new (from input layer of neurons)
// four sets of 8 bits output
// one 1 bit output ready
module interlayer(clk, new, in1, ready1, in2, ready2, in3, ready3, in4, ready4,
                  out1, out2, out3, out4, ready_out);
    input clk;
    input new;
  input [7:0] in1, in2, in3, in4;
    input ready1, ready2, ready3, ready4;
    output [7:0] out1, out2, out3, out4;
    output ready_out;
  
  //wire [7:0] w1,w2,w3,w4,b,x1,x2,x3,x4,y1,y2,y3,y4;
  //neuron n1(clk, w1, w2, w3, w4, b, x1, x2, x3, x4, new, y1, ready1);
  //neuron n2(clk, w1, w2, w3, w4, b, x1, x2, x3, x4, new, y2, ready2);
  //neuron n3(clk, w1, w2, w3, w4, b, x1, x2, x3, x4, new, y3, ready3);
  //neuron n4(clk, w1, w2, w3, w4, b, x1, x2, x3, x4, new, y4, ready4);
  //if ready1, then hold until everything else rdy
  /*3.2 3.1 are pretty damn similar in that the main idea of both is to have a counter
  */
  //wire [3:0] count;
  //    assign pwidth_d = new_d ? 1 : (pwidth + 1);
  //wire [3:0]check,checkout;
 // dreg #(3) couunter(clk,count,checkout);
 // wire long,type,n;
  //pulse_width pwd(clk,checkout,count,long,type,new); //cout is incremented value.
  /*
  dreg #(8) hold1(clk,in1,in1p);  
  dreg #(8) hold2(clk,in2,in2p);
  dreg #(8) hold3(clk,in3,in3p);
  dreg #(8) hold4(clk,in4,in4p);
  dreg #(8) hold1a(clk,in1p,in1pp);  
  dreg #(8) hold2a(clk,in2p,in2pp);
  dreg #(8) hold3a(clk,in3p,in3pp);
  dreg #(8) hold4a(clk,in4p,in4pp);
  dreg #(8) hold1b(clk,in1pp,in1ppp);  
  dreg #(8) hold2b(clk,in2pp,in2ppp);
  dreg #(8) hold3b(clk,in3pp,in3ppp);
  dreg #(8) hold4b(clk,in4pp,in4ppp);
  dreg #(8) hold1c(clk,in1ppp,in1pppp);  
  dreg #(8) hold2c(clk,in2ppp,in2pppp);
  dreg #(8) hold3c(clk,in3ppp,in3pppp);
  dreg #(8) hold4c(clk,in4ppp,in4pppp);
  */
//  assign cmd=(clk&&type)?`CMD_LOAD:(((clk&&!type)&&long) ?`CMD_CLEAR:`CMD_HOLD); //load if clock high, else when type is 1
    // your code here
  //if rdy, then place inputs to outputs//
  //do i use regs to hold onto 
  /*reg [7:0] in1p,in2p,in3p,in4p;
  always @(ready1 or ready2 or ready3 or ready4)
    begin
    if(ready1)
      in1p<=in1;
    if(ready2)
      in2p<=in2;
    if(ready3)
      in3p<=in3;
    if(ready4)
      in4p<=in4;
    end
  */
  wire [2:0] counter;
  dreg #(8) dreg1(ready1,in1,out1);
  dreg #(8) dreg2(ready2,in2,out2);
  dreg #(8) dreg3(ready3,in3,out3);
  dreg #(8) dreg4(ready4,in4,out4);
  //fuckin eda playground bmed me soooooo tilted rn but fkit gota push thru, already getting alotta help :/ mans not smart
  
  wire allv,readyp;
  
  dreg counterupdate1(clk,counter[2],counter[0]);
  mux2 lookatnew(counter[0],0,new,counter[1]);
  mux2 lookatnextc(counter[1],1, allv,counter[2]);
  
  //assign allv=ready1
  
 // mux2 asdf(a,b,sel,y);
  
  
  
  /*
  assign out1=(in1p);
  assign out2=(in2p);
  assign out3=(in3p);
  assign out4=(in4p);
  */
  
  assign allv=ready1&&ready2&&ready3&&ready4;
  
  dreg prevupdates(clk,readyp,ready_out);
  mux2 lookatprev(0,1,allv&!counter[0],readyp);

  /*). Build an inter-layer module connecting the outputs of the input layer of neurons to the inputs of the output
layer of neurons. This should hold the outputs of the input neurons until they have all been generated, then
set the new signal for the output neurons high for one clock cycle.

so basically he wants us to place the inputs into the outputs
and then pulse ready once and exactly once
when all 4 are reayd
so maybe have 4 registers to hold the inputs when each is ready
and then place those in respective outputs, and pulse high exactly once.


module neuron(clk, w1, w2, w3, w4, b, x1, x2, x3, x4, new, y, ready);

Our neural net will consist of an input layer of 4 neurons and an output layer of 26 neurons (a hidden layer won’t be use)
  */
  
    // your code here
endmodule
