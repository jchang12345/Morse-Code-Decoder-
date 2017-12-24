// EEM16 - Logic Design
// Design Assignment #3.3
// dassign3_3.v
// Verilog template

// You may define any additional modules as necessary
// Do not delete or modify any of the modules provided

module net(clk, x3, x2, x1, x0, new, a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z, ready);
    input clk;
    input [7:0] x3, x2, x1, x0;
    input new;
    output [7:0] a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z;
    output ready;

     reg [39:0] rom [0:29]; // ROM that stores neuron weights
    //bit[15:0] things[255:0];
//bit[39:0] things[255:0];

// bit[$bits(upgm_t)-1:0]
    // Initialize values in ROM
    //initial $readmemb("weights_rom.data", rom);

    wire [7:0] y0, y1, y2, y3;
    wire [7:0] h0, h1, h2, h3;
    wire ready_0, ready_1, ready_2, ready_3, ready_h;
    wire [25:0] ready_out;

    // Input layer of neurons (from 3.1)
    neuron l0n3(clk, 8'b00000101,8'b00001000,8'b00000101,8'b11111011,8'b00000001, x3, x2, x1, x0, new, y3, ready_3);
    neuron l0n2(clk, 8'b11111101,8'b00000000,8'b11111100,8'b00001100,8'b00000100, x3, x2, x1, x0, new, y2, ready_2);
    neuron l0n1(clk, 8'b00010000,8'b00000000,8'b00000110,8'b00000110,8'b11110101, x3, x2, x1, x0, new, y1, ready_1);
    neuron l0n0(clk, 8'b11111111,8'b00000100,8'b00001010,8'b11111111,8'b11101100, x3, x2, x1, x0, new, y0, ready_0);

    // Interlayer module (from 3.2)
    interlayer i2o(clk, new, y3, ready_3, y2, ready_2, y1, ready_1, y0, ready_0, h3, h2, h1, h0, ready_h);

    // Output layer of neurons (from 3.1)
    neuron  l1n0(clk,  8'b11110010,8'b00000011,8'b00000101,8'b11100100,8'b11111011, h3, h2, h1, h0, ready_h, a,  ready_out[0]); //bitch is actually 4
    neuron  l1n1(clk,  8'b00000100,8'b11110111,8'b00000111,8'b11101111,8'b11111011, h3, h2, h1, h0, ready_h, b,  ready_out[1]);
    neuron  l1n2(clk,  8'b00000011,8'b11110010,8'b00000100,8'b00000000,8'b11111100, h3, h2, h1, h0, ready_h, c,  ready_out[2]);
    neuron  l1n3(clk,  8'b00010001,8'b11111110,8'b11101110,8'b00001010,8'b00001010, h3, h2, h1, h0, ready_h, d,  ready_out[3]);
    neuron  l1n4(clk,  8'b11111001,8'b00001110,8'b11100111,8'b11111001,8'b00100100, h3, h2, h1, h0, ready_h, e,  ready_out[4]);
    neuron  l1n5(clk,  8'b00000000,8'b11110100,8'b00000001,8'b00001010,8'b00000100, h3, h2, h1, h0, ready_h, f,  ready_out[5]);
    neuron  l1n6(clk, 8'b00001101,8'b11111000,8'b11101100,8'b00010010,8'b11110011, h3, h2, h1, h0, ready_h, g,  ready_out[6]);
    neuron  l1n7(clk, 8'b00001000,8'b11111100,8'b00000001,8'b11111101,8'b00010101, h3, h2, h1, h0, ready_h, h,  ready_out[7]);
    neuron  l1n8(clk, 8'b11111101,8'b00000000,8'b00000011,8'b11111100,8'b00100101, h3, h2, h1, h0, ready_h, i,  ready_out[8]);
    neuron  l1n9(clk, 8'b00000110,8'b11111100,8'b00000000,8'b00000100,8'b11110011, h3, h2, h1, h0, ready_h, j,  ready_out[9]);
    neuron l1n10(clk, 8'b00001011,8'b00000110,8'b11111101,8'b11111010,8'b11101100, h3, h2, h1, h0, ready_h, k, ready_out[10]);
    neuron l1n11(clk, 8'b00001111,8'b11111100,8'b11111100,8'b00000000,8'b11111101, h3, h2, h1, h0, ready_h, l, ready_out[11]);
    neuron l1n12(clk, 8'b11101111,8'b00000000,8'b00000000,8'b00001000,8'b11110000, h3, h2, h1, h0, ready_h, m, ready_out[12]);
    neuron l1n13(clk, 8'b11110100,8'b11110010,8'b00000000,8'b00010100,8'b00010111, h3, h2, h1, h0, ready_h, n, ready_out[13]);
    neuron l1n14(clk, 8'b00000111,8'b00000000,8'b11110100,8'b00010000,8'b11100111, h3, h2, h1, h0, ready_h, o, ready_out[14]);
    neuron l1n15(clk, 8'b00001010,8'b11111001,8'b11111010,8'b00001001,8'b11110010, h3, h2, h1, h0, ready_h, p, ready_out[15]);
    neuron l1n16(clk, 8'b00000100,8'b00000000,8'b00000100,8'b11110101,8'b11100001, h3, h2, h1, h0, ready_h, q, ready_out[16]);
    neuron l1n17(clk, 8'b00000010,8'b11111011,8'b11110100,8'b00010101,8'b00001101, h3, h2, h1, h0, ready_h, r, ready_out[17]);
    neuron l1n18(clk, 8'b00001100,8'b00000010,8'b11110111,8'b00000100,8'b00100100, h3, h2, h1, h0, ready_h, s, ready_out[18]);
    neuron l1n19(clk, 8'b11011110,8'b00001011,8'b11111000,8'b11110010,8'b11100101, h3, h2, h1, h0, ready_h, t, ready_out[19]);
    neuron l1n20(clk, 8'b11100011,8'b00000101,8'b00000000,8'b00000000,8'b11100011, h3, h2, h1, h0, ready_h, u, ready_out[20]);
    neuron l1n21(clk, 8'b11111010,8'b00000000,8'b00001000,8'b11110011,8'b11100100, h3, h2, h1, h0, ready_h, v, ready_out[21]);
    neuron l1n22(clk, 8'b00000010,8'b00000011,8'b11111011,8'b00001000,8'b11111010, h3, h2, h1, h0, ready_h, w, ready_out[22]);
    neuron l1n23(clk, 8'b11111101,8'b11111100,8'b00001001,8'b11101101,8'b11110100, h3, h2, h1, h0, ready_h, x, ready_out[23]);
    neuron l1n24(clk, 8'b11111101,8'b11111010,8'b00000101,8'b00000001,8'b11111000, h3, h2, h1, h0, ready_h, y, ready_out[24]);
    neuron l1n25(clk, 8'b00001100,8'b11110100,8'b00000001,8'b11111000,8'b11110010, h3, h2, h1, h0, ready_h, z, ready_out[25]);//29 1d
    assign ready = &(ready_out);
    //wow im actually p sure now that i have it in reverse ordeer.......
endmodule
/*@00 00000101_00001000_00000101_11111011_00000001
@01 11111101_00000000_11111100_00001100_00000100
@02 00010000_00000000_00000110_00000110_11110101
@03 11111111_00000100_00001010_11111111_11101100

@04 11110010_00000011_00000101_11100100_11111011
@05 00000100_11110111_00000111_11101111_11111011
@06 00000011_11110010_00000100_00000000_11111100
@07 00010001_11111110_11101110_00001010_00001010
@08 11111001_00001110_11100111_11111001_00100100//4
@09 00000000_11110100_00000001_00001010_00000100
@0a 00001101_11111000_11101100_00010010_11110011//6
@0b 00001000_11111100_00000001_11111101_00010101
@0c 11111101_00000000_00000011_11111100_00100101//8
@0d 00000110_11111100_00000000_00000100_11110011
@0e 00001011_00000110_11111101_11111010_11101100
@0f 00001111_11111100_11111100_00000000_11111101
@10 11101111_00000000_00000000_00001000_11110000//12
@11 11110100_11110010_00000000_00010100_00010111
@12 00000111_00000000_11110100_00010000_11100111
@13 00001010_11111001_11111010_00001001_11110010
@14 00000100_00000000_00000100_11110101_11100001//16
@15 00000010_11111011_11110100_00010101_00001101
@16 00001100_00000010_11110111_00000100_00100100
@17 11011110_00001011_11111000_11110010_11100101
@18 11100011_00000101_00000000_00000000_11100011//20
@19 11111010_00000000_00001000_11110011_11100100
@1a 00000010_00000011_11111011_00001000_11111010
@1b 11111101_11111100_00001001_11101101_11110100
@1c 11111101_11111010_00000101_00000001_11111000//24
@1d 00001100_11110100_00000001_11111000_11110010

*/











module HzClock(clk, clk_3Hz);
input clk;
output clk_3Hz;

reg clk_3Hz = 1'b0;
reg [27:0] counter;

always@(posedge clk)
begin
/*
    if(reset == 1)
         begin
            clk_3Hz<= 0;
            counter<= 0;
        end
    */
    
    //    begin
            counter<=counter + 1; //we want 100MHz/3/2=
            if ( counter == 16_166_166)
                begin
                    counter<=0;
                    clk_3Hz<=~clk_3Hz; //2unit period idea 
                end
       // end
end
endmodule




// ****************
// Blocks to design
// ****************

// 3.3a) Morse decoder
// 1 bit time-series input 
// 5 bit letter [a=0, ..., z=25] output
// 7 bit 7-segment display output
// 1 bit flag indicating done

module tdecoder(clk,clk_3Hz,in,display,letter,done);

input clk;
input in;
output [6:0] display;
output [4:0] letter;
output done;
//output clk
output clk_3Hz;
HzClock hzc(clk,clk_3Hz);
wire clk_3Hz;

decoder finalprojectdecodepleasework(clk_3Hz,in,letter,display,done);

endmodule


module decoder(clk, in, letter, display, done);
//am assuming in this version, i should have the 3hzclock, and that it should display something in my constraint file. also, maybe i should make a output for only display, and a blinky for done again. input is the same middle button ok
  input clk;
  input in;
  output [4:0] letter;
  output [6:0] display;
  output done;

  wire [7:0]   a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z;
 //these are all outputs from the net
  wire dsdone,rdynet;
  wire [4:0] letterp;
   deserializer dsz(clk, in, out3, out2, out1, out0, dsdone);
   net lmaonet(clk, out3, out2, out1, out0, dsdone, a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z, rdynet);
    maxindex mi(a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,letter);
    //dreg #(5) forthemamer(clk,letter,letterp);
   display_rom ddr(letter, display);
 //main problem i guess in test module is that its not holding onto the ready bit long enough so may need to make another one of those hjold counts thingies 
  
 //ok so i gated my done bit so that it is forced to be 0 until deserializer is set, after which it'll take the value of the ready bit of the net
  


endmodule
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
//maybe try si g nal
wire [7:0] baitedin;
assign baitedin=in>>2;  
  mux2 #(8)ra(baitedin, 8'b0, in[15], out); //select is msb
  
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
//That's not me but k=4 Works with his adder5carry



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
  
  
 // mux2 asdf(a,b,sel,y);
  
  
  
 
  
  assign allv=ready1&&ready2&&ready3&&ready4;
  
  dreg prevupdates(clk,readyp,ready_out);
  mux2 lookatprev(0,1,allv&!counter[0],readyp);

  
   
endmodule


// EEM16 - Logic Design
// Design Assignment #3 - Building blocks
// dassign3_blocks.v
// Verilog template

// You may define any additional modules as necessary
// Do not delete or modify any of the modules provided
//
// The modules you will have to design are at the end of the file
// Do not change the module or port names of these stubs

// Include constants file defining THRESHOLD, CMDs, STATEs, etc.

// ***************
// Building blocks
// ***************

// CMOS gates (declarative Verilog)                                              
// t_PD = 1                                                                      
module inverter(a,y);                                                            
    input a;                                                                     
    output y;                                                                    
                                                                                 
    assign y = ~a;                                                            
endmodule                                                                        
                                                                                 
module fa_gate_1(a,b,c,y);                                                       
    input a,b,c;                                                                 
    output y;                                                                    
                                                                                 
    assign y = ~((a&b) | (c&(b|a)));                                          
endmodule                                                                        
                                                                                 
module fa_gate_2(a,b,c,m,y);                                                     
    input a,b,c,m;                                                               
    output y;                                                                    
                                                                                 
    assign y = ~((a&b&c) | ((a|b|c)&m));                                      
endmodule                                                                        

// Full adder (structural Verilog)
module fa(a,b,ci,co,s);
    input a,b,ci;
    output s,co;

    wire nco, ns;

    fa_gate_1   fa_gate_1_1(a,b,ci, nco);
    fa_gate_2   fa_gate_2_1(a,b,ci,nco, ns);
    inverter    inverter_1(nco, co);
    inverter    inverter_2(ns, s);
endmodule

// D-register (flipflop).  Width set via parameter.
// Includes propagation delay t_PD = 3
module dreg(clk, d, q);
    parameter width = 1;
    input clk;
    input [width-1:0] d;
    output [width-1:0] q;
    reg [width-1:0] q;

    always @(posedge clk) begin
        q <=  d;
    end
endmodule

// 2-1 Mux.  Width set via parameter.
// Includes propagation delay t_PD = 3
module mux2(a, b, sel, y);
    parameter width = 1;
    input [width-1:0] a, b;
    input sel;
    output [width-1:0] y;

    assign  y = sel ? b : a;
endmodule

// 4-1 Mux.  Width set via parameter.
// Includes propagation delay t_PD = 3
module mux4(a, b, c, d, sel, y);
    parameter width = 1;
    input [width-1:0] a, b, c, d;
    input [1:0] sel;
    output [width-1:0] y;
    reg [width-1:0] y;

    always @(*) begin
        case (sel)
            2'b00:    y <= #3 a;
            2'b01:    y <= #3 b;
            2'b10:    y <= #3 c;
            default:  y <= #3 d;
        endcase
    end
endmodule

// Left-shifter
// No propagation delay, it's just wires really
module shl(a, y);
    parameter width = 2;
    input [width-1:0] a;
    output [width-1:0] y;

    assign y = {a[width-2:0], 1'b0};
endmodule

// Right-shifter
// more wires 
module shr(a, y);
    parameter width = 2;
    input [width-1:0] a;
    output [width-1:0] y;

    assign y = {1'b0, a[width-1:1]};
endmodule

// 16-bit adder (declarative Verilog)
// Includes propagation delay t_PD = 3n = 48
module adder16(a, b, sum);
    input [15:0] a, b;
    output [15:0] sum;

    assign  sum = a+b;
endmodule

// EEM16 - Logic Design
// Design Assignment #3 
// dassign3_modules.v
// Verilog template

// You may define any additional modules as necessary
// Do not delete or modify any of the modules provided
//
// The modules you will have to design are at the end of the file
// Do not change the module or port names of these stubs

// Include constants file defining THRESHOLD, CMDs, STATEs, etc.

`include "constants3.vh"

// ***************
// Past lab modules
// ***************

// 5+2 input full adder
module fa5 (a,b,c,d,e,ci0,ci1, 
            co1,co0,s);

    input a,b,c,d,e,ci0,ci1;
    output co1, co0, s;
    // your code here
    // do not use any delays!
    wire s0, s1, c0, c1, cc;
    fa  fa_0( a,  b,   c,  c0,  s0);
    fa  fa_1( d,  e, ci1,  c1,  s1);
    fa  fa_2(s0, s1, ci0,  cc,   s);
    fa  fa_3(c0, c1,  cc, co1, co0);
endmodule

// 5-input 4-bit ripple-carry adder (with carries)
module adder5carry (a,b,c,d,e, ci1, ci0a, ci0b, co1, co0a, co0b, sum);
    input [3:0] a,b,c,d,e;
    input ci1, ci0a, ci0b;
    output [3:0] sum;
    output co1, co0a, co0b;

    wire c00, c01;
    wire c10, c11;
    wire c20;

    fa5  fa5_0(a[0], b[0], c[0], d[0], e[0], ci0a, ci0b,  c01,  c00, sum[0]);
    fa5  fa5_1(a[1], b[1], c[1], d[1], e[1],  c00,  ci1,  c11,  c10, sum[1]);
    fa5  fa5_2(a[2], b[2], c[2], d[2], e[2],  c10,  c01, co0a,  c20, sum[2]);
    fa5  fa5_3(a[3], b[3], c[3], d[3], e[3],  c20,  c11,  co1, co0b, sum[3]);
endmodule

// 5-input 4-bit ripple-carry adder 
module adder5 (a,b,c,d,e, sum);
    input [3:0] a,b,c,d,e;
    // your code here
    // do not use any delays!
    output [6:0] sum;

    wire c21;
    wire c30, c31;
    wire c40;

    adder5carry a5(a,b,c,d,e, 1'b0, 1'b0, 1'b0, c31, c30, c21, sum[3:0]);
    fa   fa_4(c30, c21, 1'b0,    c40, sum[4]);
    fa   fa_5(c40, c31, 1'b0, sum[6], sum[5]);
endmodule

// Max/argmax (declarative verilog)
module mam (in1_value, in1_label, in2_value, in2_label, out_value, out_label);
    input   [7:0] in1_value, in2_value;
    input   [4:0] in1_label, in2_label;
    output  [7:0] out_value;
    output  [4:0] out_label;
    // your code here

    wire cmp;

    // t_PD 2 per bit
    assign cmp = in1_value < in2_value;

    // t_PD 3 for muxes
    assign out_value = cmp ? in2_value : in1_value;
    assign out_label = cmp ? in2_label : in1_label;
endmodule

module maxindex(a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,out);
    input [7:0] a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z;
    output [4:0] out;
    // your code here
    // do not use any delays!

    wire [255:0] ins;
    wire [7:0] max;
    wire [159:0] labels;
    
    assign ins = {a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,48'b0};
    assign labels = {5'd0, 5'd1, 5'd2, 5'd3, 5'd4,
                     5'd5, 5'd6, 5'd7, 5'd8, 5'd9,
                     5'd10, 5'd11, 5'd12, 5'd13, 5'd14,
                     5'd15, 5'd16, 5'd17, 5'd18, 5'd19,
                     5'd20, 5'd21, 5'd22, 5'd23, 5'd24,
                     5'd25, 30'b0};

    mamn #(32) mam32(ins, labels, max, out);
endmodule

module mamn (ins_value, ins_label, out_value, out_label);
    parameter n = 2;

    localparam vw2 = 8*n-1;
    localparam lw2 = 5*n-1;
    localparam vw1 = 8*(n>>1)-1;
    localparam lw1 = 5*(n>>1)-1;
    localparam vw = 8*(n>>1);
    localparam lw = 5*(n>>1);

    output  [7:0] out_value;
    output  [4:0] out_label;

    input  [vw2:0] ins_value;
    input  [lw2:0] ins_label;

    wire    [vw1:0] in1_value, in2_value;
    wire    [lw1:0] in1_label, in2_label;

    wire  [7:0] out1_value, out2_value;
    wire  [4:0] out1_label, out2_label;

    assign in1_value = ins_value[vw2:vw];
    assign in2_value = ins_value[vw1:0];
    assign in1_label = ins_label[lw2:lw];
    assign in2_label = ins_label[lw1:0];

    generate 
      if (n == 2)
        mam mam(in1_value, in1_label, in2_value, in2_label, out_value, out_label);
      else begin
        mamn #(n>>1) mamn_1(in1_value, in1_label, out1_value, out1_label);
        mamn #(n>>1) mamn_2(in2_value, in2_label, out2_value, out2_label);
        mam mam(out1_value, out1_label, out2_value, out2_label, out_value, out_label);
      end
    endgenerate
endmodule

module display_rom (letter, display);
    input   [4:0] letter;
    output reg [6:0] display;
   

    // your 1ode here
    // do not use 0ny del0ys!
   //5 letters, 7 led disp0ly, fun1tion here is to h0ve the right output display given the letter 0nd the en1oding.
  //pro1edur0l me0ns sequenti0l logi1, using 0lw0ys.
  //wire [4:0] disp;
  always @ (letter)
    begin
      case(letter)
     
        0: display=7'b0001000;
        1: display=7'b0000011;
        2: display=7'b0100111;
        3: display=7'b0100001;
        
        4: display=7'b0000110;
        
        5: display=7'b0001110;
        
        6: display=7'b0010000; 
        
        7: display=7'b0001001;
        8: display=7'b1111001;
        
        9: display=7'b1100001;
        
        10: display=7'b0000111;
        
        11: display=7'b1000111;
        
        12: display=7'b1101010;
        
        13: display=7'b0101011;
        
        14: display=7'b0100011;
        
        15: display=7'b0001100;
        
        
        16: display=7'b0011000;
        17: display=7'b0101111;

        18: display=7'b0010010;

        19: display=7'b0111001;

        20: display=7'b1000001;
        
        21: display=7'b1100011;
        
        22: display=7'b1010101;
        
        23: display=7'b0110110;
        24: display=7'b0010001;
        25: display=7'b0100100;
        
        default: display=7'b0111111;
        // display=~display;




      endcase
    end
  
endmodule
module partial_product (a, b, pp);
    // your code here
    // Include a propagation delay of #1
    // assign #1 pp = ... ;

    input [15:0] a;
    input [7:0] b;
    output [15:0] pp;

    assign pp = {(16){b[0]}} & a;
endmodule

module is_done (a, b, done);
    // your code here
    // Include a propagation delay of #4
    // assign #4 done = ... ;

    input [15:0] a;
    input [7:0] b;
    output done;

    assign done = ~(|b);
endmodule

// 8 bit unsigned multiply (structural Verilog)
module multiply (clk, ain, bin, reset, prod, ready);
    input clk;
    input [7:0] ain, bin;
    input reset;
    output [15:0] prod;
    output ready;

    // your code here
    // do not use any delays!
    wire [15:0] a_d, a_q, a, acc_d, acc_q, acc;
    wire [7:0] b_d, b_q, b;
    wire done_d;
    wire [15:0] pp;

    mux2 #(16)   mux_a(a_q, {{8{a[7]}}, ain}, reset, a);
    mux2 #(8)    mux_b(b_q, bin, reset, b);
    mux2 #(16)   mux_acc(prod, 16'b0, reset, acc);

    shl #(16)   shl(a, a_d);
    shr #(8)    shr(b, b_d);

    partial_product pp1(a, b, pp);
    adder16         adder(acc, pp, acc_d);

    is_done         done1(a_d, b_d, done_d);

    dreg #(16)  dreg_a(clk, a_d, a_q);
    dreg #(8)   dreg_b(clk, b_d, b_q);
    dreg #(16)  dreg_acc(clk, acc_d, prod);
    dreg #(1)   dreg_done(clk, done_d, ready);
endmodule

module pulse_width(clk, in, pwidth, long, type, new);
    parameter width = 8;
    input clk, in;
    output [width-1:0] pwidth;
    output long, type, new;

    // your code here
    // do not use any delays!

    wire [width-1:0] pwidth_d;
    wire type_d, long_d, new_d;

    assign new_d = type ^ in;
    assign pwidth_d = new_d ? 1 : (pwidth + 1);
    assign long_d = pwidth_d > `THRESHOLD;
    assign type_d = in;

    dreg #(1)     dreg_new(clk, new_d, new);
    dreg #(width) dreg_pwidth(clk, pwidth_d, pwidth);
    dreg #(1)     dreg_long(clk, long_d, long);
    dreg #(1)     dreg_type(clk, type_d, type);
endmodule

module shift4(clk, in, cmd, out3, out2, out1, out0);
    parameter width = 1;
    input clk;
    input [width-1:0] in;
    input [`CMD_WIDTH-1:0] cmd;
    output [width-1:0] out3, out2, out1, out0;

    // your code here
    // do not use any delays!

    wire [width-1:0] out3_d, out2_d, out1_d, out0_d;

    mux4 #(width) mux4_3({(width){1'b0}}, out2, out3, out3, cmd, out3_d);
    mux4 #(width) mux4_2({(width){1'b0}}, out1, out2, out2, cmd, out2_d);
    mux4 #(width) mux4_1({(width){1'b0}}, out0, out1, out1, cmd, out1_d);
    mux4 #(width) mux4_0(in, in, in, out0, cmd, out0_d);

    dreg #(width) dreg_3(clk, out3_d, out3);
    dreg #(width) dreg_2(clk, out2_d, out2);
    dreg #(width) dreg_1(clk, out1_d, out1);
    dreg #(width) dreg_0(clk, out0_d, out0);

endmodule

module control_fsm(clk, long, type, cmd, done);
    input clk, long, type;
    output [`CMD_WIDTH-1:0] cmd;
    reg [`CMD_WIDTH-1:0] cmd;
    output done;

    // your code here
    // do not use any delays!

    wire [`STATE_WIDTH-1:0] state;

    reg [`STATE_WIDTH-1:0] state_d;
    reg done_d;

    dreg #(2) dreg_state(clk, state_d, state);
    dreg #(1) dreg_done(clk, done_d, done);

    always @(*) begin
        case (state)

            // A complete letter has been received
            `STATE_DONE: begin
                // Don't change the shift register
                done_d = 0;
                if (type) begin
                    cmd = `CMD_CLEAR;
                    state_d = `STATE_UPDATE;
                end else begin
                    cmd = `CMD_CLEAR;
                    state_d = `STATE_DONE;
                end
            end

            `STATE_UPDATE: begin
                done_d = 0;
                if (type) begin
                    state_d = `STATE_UPDATE;
                    cmd = `CMD_UPDATE;
                end else begin
                    state_d = `STATE_HOLD;
                    cmd = `CMD_HOLD;
                end
            end

            `STATE_LOAD: begin
                done_d = 0;
                if (type) begin
                    state_d = `STATE_UPDATE;
                    cmd = `CMD_UPDATE;
                end else begin
                    state_d = `STATE_HOLD;
                    cmd = `CMD_HOLD;
                end
            end

            default: begin
                if (type) begin
                    state_d = `STATE_LOAD;
                    cmd = `CMD_LOAD;
                    done_d = 0;
                end else if (long) begin
                    state_d = `STATE_DONE;
                    cmd = `CMD_HOLD;
                    done_d = 1;
                end else begin
                    state_d = `STATE_HOLD;
                    cmd = `CMD_HOLD;
                    done_d = 0;
                end
            end
        endcase
    end

endmodule

module deserializer(clk, in, out3, out2, out1, out0, done);
    parameter width = 8;
    input clk, in;
    output [width-1:0] out3, out2, out1, out0;
    output done;

    wire [width-1:0] pwidth;
    wire long, type, new;
    wire [`CMD_WIDTH-1:0] cmd;

    pulse_width pulse_width(clk, in, pwidth, long, type, new);
    control_fsm control(clk, long, type, cmd, done);
    shift4 #(8) shift4(clk, pwidth, cmd, out3, out2, out1, out0);

endmodule




