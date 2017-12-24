// EEM16 - Logic Design
// Design Assignment #3.1
// dassign3_1.v
// Verilog template

// You may define any additional modules as necessary
// Do not delete or modify any of the modules provided

// ****************
// Blocks to design
// **************** 
module bitFlipAdd1(a,b);
	parameter width=16;	
  input [width-1:0] a;
  output [width-1:0] b;
  assign b=~a+1;
endmodule

// Right-shifter
// more wires 


// 3.1a) Rectified linear unit
// out = max(0, in/4)
// 16 bit signed input
// 8 bit unsigned output truncated 
module relu(in, out);
    input [15:0] in;
    output [7:0] out;
	
    // your code here
  //it can't be a input that is worth 15 bits if its output bit is only 8 bits, how can we do stuff w/ a 15 bit input and turn int o an 8 bit output unsigned? 
  //check if sign bit is a 1, and gives out a 0. if unsigned (sign bit is a 0), then we gotta return the unsigned value/4 which is shift right by 2?
  //need unsigned version of in 
  wire [15:0] uin,uins,uins2;
  // bitFlipAdd1 bfa(in,uin); dont actually bitflipadd1 b/c if its sign bit is a0, we just shiftright it twice and its what we want?
  //shr #(16) rsh1(uin,uins);
  //shr #(16) rsh2(uin,uins2);
  //wire [7:0] uins22;
  //assign uins22=uins2[7:0];
  mux2 #(8)ra(in/4, 8'b0, in[15], out); //select is msb
  
endmodule

// 3.1b) Pipelined 5 input ripple-carry adder
// 16 bit signed inputs
// 1 bit input: valid (when the other inputs are useful numbers)
// 16 bit signed output (truncated)
// 1 bit output: ready (when the output is the sum of valid inputs)
/*Create a five-input 16-bit pipelined ripple carry adder using the five-input 4-bit ripple carry adders from lab
1 and any necessary d-registers.
*/
module piped_adder(clk, a, b, c, d, e, valid, sum, ready);
  input clk, valid;
    input [15:0] a, b, c, d, e;
    output [15:0] sum;
    output ready;
  wire [3:0] rca1sumt,rca2sumt,rca3sumt,rca4sumt;
  //wire [3:0] rca1sumbot4,rca2sumbot4,rca3sumbot4,rca4sumbot4,rca5sumbot4,rca6sumbot4,rca7sumbot4,rca8sumbot4;
  //wire [2:0] rca1sumtop3,rca2sumtop3,rca3sumtop3,rca4sumtop3,rca5sumtop3,rca6sumtop3,rca7sumtop3;
  //and now its time to pipeline this shit with a shitload of dregs wtf
    // your code here
  //  module adder5 (a,b,c,d,e, sum); //sum is 7 bit output, top 3 go to nxt
  //module adder5carry (a,b,c,d,e, ci1, ci0a, ci0b, co1, co0a, co0b, sum);
  wire corca1a,corca1b,corca1c;
  wire corca1ap,corca1bp,corca1cp;
  wire corca2a,corca2b,corca2c;
  wire corca2ap,corca2bp,corca2cp;
    wire corca3a,corca3b,corca3c;
  wire corca3ap,corca3bp,corca3cp;
  wire corca4a,corca4b,corca4c;
 // wire corca4ap,corca4bp,corca4cp;
//do i need to wire valid to ready in some way or like, dont start until valid?
  adder5carry rca1(a[3:0],b[3:0],c[3:0],d[3:0],e[3:0],0,0,0,corca1a,corca1b,corca1c,rca1sumt);
  //gotta pipe it
  dreg pipedp1a(clk,corca1a,corca1ap);
  dreg pipedp1b(clk,corca1b,corca1bp);
  dreg pipedp1c(clk,corca1c,corca1cp);
//do i also got to pipe in the inputs to the next rcas? seems like it...
  //1 dreg to piped inputs
  wire [3:0] a1p,b1p,c1p,d1p,e1p,a2p,b2p,c2p,d2p,e2p,a2pp,b2pp,c2pp,d2pp,e2pp,a3p,b3p,c3p,d3p,e3p,a3pp,b3pp,c3pp,d3pp,e3pp,a3ppp,b3ppp,c3ppp,d3ppp,e3ppp;
  
  dreg #(4) pipeinputs1a(clk,a[7:4],a1p);
  dreg #(4) pipeinputs1b(clk,b[7:4],b1p);
  dreg #(4) pipeinputs1c(clk,c[7:4],c1p);
  dreg #(4) pipeinputs1d(clk,d[7:4],d1p);
  dreg #(4) pipeinputs1e(clk,e[7:4],e1p);

  adder5carry rca2(a1p,b1p,c1p,d1p,e1p,corca1ap,corca1bp,corca1cp,corca2a,corca2b,corca2c,rca2sumt);
  
  dreg pipedp2a(clk,corca2a,corca2ap);
  dreg pipedp2b(clk,corca2b,corca2bp);
  dreg pipedp2c(clk,corca2c,corca2cp);
  
    //2 dreg to piped inputs
  dreg #(4) pipeinputs2a(clk,a[11:8],a2p);
  dreg #(4) pipeinputs2b(clk,b[11:8],b2p);
  dreg #(4) pipeinputs2c(clk,c[11:8],c2p);
  dreg #(4) pipeinputs2d(clk,d[11:8],d2p);
  dreg #(4) pipeinputs2e(clk,e[11:8],e2p);
  
  dreg #(4) pipeinputs2aa(clk,a2p,a2pp);
  dreg #(4) pipeinputs2bb(clk,b2p,b2pp);
  dreg #(4) pipeinputs2cc(clk,c2p,c2pp);
  dreg #(4) pipeinputs2dd(clk,d2p,d2pp);
  dreg #(4) pipeinputs2ee(clk,e2p,e2pp);
  
  
  
  adder5carry rca3(a2pp,b2pp,c2pp,d2pp,e2pp,corca2ap,corca2bp,corca2cp,corca3a,corca3b,corca3c,rca3sumt);
  
  dreg pipedp3a(clk,corca3a,corca3ap);
  dreg pipedp3b(clk,corca3b,corca3bp);
  dreg pipedp3c(clk,corca3c,corca3cp);
  
  
  //3   //1 dreg to piped inputs
  dreg #(4) pipeinputs3a(clk,a[15:12],a3p);
  dreg #(4) pipeinputs3b(clk,b[15:12],b3p);
  dreg #(4) pipeinputs3c(clk,c[15:12],c3p);
  dreg #(4) pipeinputs3d(clk,d[15:12],d3p);
  dreg #(4) pipeinputs3e(clk,e[15:12],e3p);
  
  dreg #(4) pipeinputs3aa(clk,a3p,a3pp);
  dreg #(4) pipeinputs3bb(clk,b3p,b3pp);
  dreg #(4) pipeinputs3cc(clk,c3p,c3pp);
  dreg #(4) pipeinputs3dd(clk,d3p,d3pp);
  dreg #(4) pipeinputs3ee(clk,e3p,e3pp);
  
  dreg #(4) pipeinputs3aaa(clk,a3pp,a3ppp);
  dreg #(4) pipeinputs3bbb(clk,b3pp,b3ppp);
  dreg #(4) pipeinputs3ccc(clk,c3pp,c3ppp);
  dreg #(4) pipeinputs3ddd(clk,d3pp,d3ppp);
  dreg #(4) pipeinputs3eee(clk,e3pp,e3ppp);
  
  
  adder5carry rca4(a3ppp,b3ppp,c3ppp,d3ppp,e3ppp,corca3ap,corca3bp,corca3cp,corca4a,corca4b,corca4c,rca4sumt);

  
  //the continued rca5s are just going to be having a lot of empty void in them in the case of drawing
  //{8'b00000000,ain}
  // assign sum[3:0]=rca1sumbot4; das end goal
  /*
    assign rca1sumtop3=rca1sumt[6:4];
  assign rca1sumbot4=rca1sumt[3:0];
  assign rca2sumbot4=rca2sumt[3:0];
  assign rca2sumtop3=rca2sumt[6:4];
    assign rca1sumtop3=rca1sumt[6:4];
  assign rca1sumbot4=rca1sumt[3:0];
  assign rca2sumbot4=rca2sumt[3:0];
  assign rca2sumtop3=rca2sumt[6:4];
  */
  //also need that padding syntax...
 // adder5 rca5({1'b0,rca1sumtop3},rca2sumbot4,0,0,0,rca5sumt);

 // assign sum[7:4]=rca5sumbot4;
  
  //wire [3:0] rca2sumtop3p;
  //fuck i need to pipe the top guys tooo LOL 
//only the top 3 of rca2  
 // adder5 rca6({1'b0,rca2sumtop3p}, {1'b0,rca5sumtop3},rca3sumbot4,0,0,rca6sumt);
  //ass//ign rca6sumtop3=rca6sumt[6:4];
  //assign rca6sumbot4=rca6sumt[3:0];
//  assign sum[11:8]=rca6sumbot4;
  

  
  //adder5 rca7({1'b0,rca6sumtop3},{1'b0,rca3sumtop3pp},rca4sumbot4,0,0,rca7sumt);

//assign sum[15:12]=rca7sumbot4;
  
  
  //adder5 rca8({1'b0,rca4sumtop3ppp},{1'b0,rca7sumtop3},0,0,0,rca8sumt);
  //but arent all these guys trucnated lol
  //  
//now its time to dreg this shit 
  wire [3:0] d2,d3,d4,d52,d53,d662,d72;
 // wire [6:0] d61,d62,d63,d64,d65,d66,d67;
  //dreg #(4) dreg1a(clk,rca1sumt ,d61 ); //output for s[3:0] //actually does this guy get pipelined as a 7 first?
  //dreg #(4) dreg1b(clk,rca2sumt,d62);
  //dreg #(4) dreg1c(clk,rca3sumt,d63);
  //dreg #(4) dreg1d(clk,rca4sumt,d64);
 // dreg #(7) dreg5d(clk,rca5sumt,d65);
 // dreg #(7) dreg6d(clk,rca6sumt,d66);
 // dreg #(7) dreg7d(clk,rca7sumt,d67);



/*  
  assign rca1sumtop3=d61[6:4]; //after piped first instance rca1sumt
  assign rca1sumbot4=d61[3:0];
  assign rca2sumbot4=d62[3:0];
  assign rca2sumtop3=d62[6:4];
  assign rca3sumtop3=d63[6:4];
  assign rca3sumbot4=d63[3:0];
  assign rca4sumbot4=d64[3:0];
  assign rca4sumtop3=d64[6:4];
  
  assign rca5sumtop3=d65[6:4];
  assign rca5sumbot4=d65[3:0];
  
  assign rca6sumtop3=d66[6:4];
  assign rca6sumbot4=d66[3:0];
  
  assign rca7sumtop3=d67[6:4];
  assign rca7sumbot4=d67[3:0];
  */
  
  
  dreg #(4)   dreg2(clk,rca1sumt ,d2 ); //output for s[3:0]
  dreg #(4)   dreg3(clk,d2 ,d3 ); //output for s[3:0]
  dreg #(4)   dreg4(clk,d3 ,d4 ); //output for s[3:0]
  dreg #(4)   dreg5(clk,d4 ,sum[3:0] ); //output for s[3:0]
  
  dreg #(4)   dreg52(clk,rca2sumt ,d52 ); //output for s[7:4]
  dreg #(4)   dreg53(clk,d52 ,d53 ); //output for s[3:0]
  dreg #(4)   dreg54(clk,d53 ,sum[7:4] ); //output for s[3:0]
  
  dreg #(4)   dreg62(clk,rca3sumt ,d662 ); //output for s[11:8]
  dreg #(4)   dreg63(clk,d662 ,sum[11:8]); //output for s[11:8]
  
  dreg #(4)   dreg73(clk,rca4sumt ,sum[15:12]); //output for s[11:8]
  
	//gotta pipe my ready also by 4 stages
  wire r2,r3,r4;
  
  dreg dready1(clk,valid,r2);
  dreg dready2(clk,r2,r3);
  dreg dready3(clk,r3,r4);
  dreg dready4(clk,r4,ready);

  
  
  /*dreg #(4) dregtop2(clk,rca2sumtop3,rca2sumtop3p);
  
  dreg #(4) dregtop3(clk,rca3sumtop3,rca3sumtop3p);
  dreg #(4) dregtop3b(clk,rca3sumtop3p,rca3sumtop3pp);

  dreg #(4) dregtop4a(clk,rca4sumtop3,rca4sumtop3p);
  dreg #(4) dregtop4b(clk,rca4sumtop3p,rca4sumtop3pp);
  dreg #(4) dregtop4c(clk,rca4sumtop3pp,rca4sumtop3ppp);
  wire [3:0] rca3sumtop3p, rca3sumtop3pp, rca4sumtop3pp, rca4sumtop3ppp;
	
  dreg #(4)   dreg730(clk,rca8sumbot4 ,rdy); //output for s[11:8]
  //actually takes 4 adder, 5 dreg delays. how do i time that
  //dreg is 3x5=15
  //4 adder5, which means 4 fa5+2+fa per, each fa5 has 4 fa, each fa=4tpd
  //(4*4*4+8)*4=576
  
  //so basically ready is just whether valid was true 5 clock cycles ago
  */
  
 // assign #591 ready= 1;
endmodule
//That’s not me but k=4 Works with his adder5carry



// 3.1c) Pipelined neuron
// 8 bit signed weights, bias (constant)
// 8 bit unsigned inputs 
// 1 bit input: new (when a set of inputs are available)
// 8 bit unsigned output 
// 1 bit output: ready (when the output is valid)
module neuron(clk, w1, w2, w3, w4, b, x1, x2, x3, x4, new, y, ready);
    input clk;
    input [7:0] w1, w2, w3, w4, b;  // signed 2s complement
    input [7:0] x1, x2, x3, x4;     // unsigned
    input new;
    output [7:0] y;                 // unsigned
    output ready;
  
   
/* Using the sequential multiplier module from lab 2, the pipelined ripple-carry adder from above, and the
ReLU from above, implement the neuron module according to the rules for single-clock sequential logic.
Ensure that the outputs are directly generated by a d-register as specified by our pipelining rules.
y = max(0,1/4(w1x1 + w2x2 + w3x3 + w4x4 + b) 
*/
  
  //when new is high, ready is low. 
  //when ready is high, new is allowed to pulse high, else new waits.
  
  //actually need to pipeline this bitch too
  //But make sure u sign extend the B before u pipeline it
  
  //module multiply (clk, ain, bin, reset, prod, ready);
  wire [15:0]p1,p2,p3,p4,sumpipe,p1p,p2p,p3p,p4p,sumpipep;
  wire [7:0]yp;
  wire multiplier1rdy,multiplier2rdy,multiplier3rdy,multiplier4rdy;
  multiply mer1(clk,w1,x1,new,p1,multiplier1rdy);
  multiply mer2(clk,w2,x2,new,p2,multiplier2rdy);
  multiply mer3(clk,w3,x3,new,p3,multiplier3rdy);
  multiply mer4(clk,w4,x4,new,p4,multiplier4rdy);
  /*dreg delayforadder(multiplier1rdy,m1);
  dreg delayforadder(m1,m2);
  dreg delayforadder(m2,m3);
  dreg delayforadder(m3,m4);
  */
  //dreg #(16) mul1(clk,p1,p1p);
  //dreg #(16) mul2(clk,p2,p2p);
  //dreg #(16) mul3(clk,p3,p3p);
  //dreg #(16) mul4(clk,p4,p4p);
  
  //then you can check when theyre all done
  //and use that as reset for the pipeline add
  
  
//make sure the adder and multiplier are working together
	//module piped_adder(clk, a, b, c, d, e, valid, sum, ready);
  //if(multiplier1rdy,multiplier2rdy,multiplier3rdy,multiplier4rdy) then pa is ready to start.
 /* wire out1,out2,out3,out4,donemult;
  mux2 already1(0,1,multiplier1rdy,out1);
  mux2 already2(0,1,multiplier2rdy,out2);
  mux2 already3(0,1,multiplier3rdy,out3);
  mux2 already4(0,1,multiplier4rdy,out4);
  assign donemult=(out1&out2&out3&out4);
  */
//  wire [2:0]counter;
 // wire actualrdy;
  //dreg dm1r(clk,counter,counter+1);
  //make afucking counter using pulsewidth and dreg
  //module pulse_width(clk, in, pwidth, long, type, new);
  //wire [3:0] count;
  //    assign pwidth_d = new_d ? 1 : (pwidth + 1);
  //wire [3:0]check,checkout;
 // dreg #(3) couunter(clk,count,checkout);
 // wire long,type,n;
  //pulse_width pwd(clk,checkout,count,long,type,n); //cout is incremented value.
  
  //adder actually,pwdith is going to update by adding 1.
 /*thats where valid comes in, so when valid is set, thats when u wanna process stuff

  */
  //assign actualrdy=(count==5)&&multiplier1rdy&&multiplier2rdy&&multiplier3rdy&&multiplier4rdy;
  //assign n=(count==5);
  //wire rdy,pipeaddready,pipev;
  
  //what is the reset for piped_adder?
  wire pipeready;
  //apparently, also, need to pipeline the b and sign extend the b bias. 
  
  wire valid,validall;
  assign validall=multiplier1rdy&&multiplier2rdy&&multiplier3rdy&&multiplier4rdy;
    /*
module signextender(
  input [7:0] unextended,//the msb bit is the sign bit
  input clk,
  output reg [7:0] extended 
);*/
  wire [7:0] bp,bpp;
  wire valid2,validprev;
  wire [2:0] counter;
  dreg asdfasdfasdf(clk,counter[2],counter[0]);
  mux2 otsready(counter[0],1,validall,counter[1]);
  mux2 notttt(counter[1],0,new,counter[2]);
  
  mux2 asdvalid(0,1,validall&!counter[0],validprev);
  
  
  dreg asdfasdfasdfasdfasdfasdf(clk, validprev,valid);
  /////signextender sxb(bp,clk,bpp);
  //dreg #(8) processb(clk,b,bp);
  //{{8{b[7]}},b}
  piped_adder pa(clk,p1,p2,p3,p4,{{8{b[7]}},b},valid,sumpipe,valid2);
  
 //dreg #(16) pa1(clk,sumpipe,sumpipep);
  //module relu(in, out);
  relu r(sumpipe,yp);
  dreg #(8) relur(clk,yp,y);
  
  /*then you feed those outputs directly into the pipedAdder with the and of all the ready bits from each multiplier
  */
  
  
  //so the ready stuff is gucci, but everything else isnt.
  
  //wire d1,d2,d3,d4;
  dreg dead1(clk,valid2,ready);
  //dreg dead4(clk,d3,ready);
  

  /*
  wire [2:0] counter;
  //dreg #(8) dreg1(ready1,in1,out1);
  //dreg #(8) dreg2(ready2,in2,out2);
  //dreg #(8) dreg3(ready3,in3,out3);
  //dreg #(8) dreg4(ready4,in4,out4);
  //fuckin eda playground bmed me soooooo tilted rn but fkit gota push thru, already getting alotta help :/ mans not smart
  
  wire allv,readyp;
  
  dreg counterupdate1(clk,counter[2],counter[0]);
  mux2 lookatnew(counter[0],0,new,counter[1]);
  mux2 lookatnextc(counter[1],1, valid2,counter[2]);
  
  //assign allv=ready1
  
 // mux2 asdf(a,b,sel,y);
  
  
  

  
  ///assign allv=ready1&&ready2&&ready3&&ready4;
  
  dreg prevupdates(clk,readyp,ready);
  mux2 lookatprev(0,1,d3&&valid2&!counter[0],readyp);

  
  */
  
  
  /*We know the adder takes a fixed amount of time, say 5 cycles, and the multiply takes variable time. We can have a counter to keep track of how long since new inputs were put to the multiply. If the multiply is done, and it has been at least 5 cycles, we know the adder is ready to accept the output of the multiply.
  done either procedurally or structurally. 
  */
  
  
              //you get errno 66 if you dont sign extend b
    // your code here
  
endmodule

module signextender(
  input [7:0] unextended,//the msb bit is the sign bit
  input clk,
  output reg [7:0] extended 
);

always@(posedge clk)
  begin 
    extended <= $signed(unextended);
  end
endmodule
