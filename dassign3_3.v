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

    // Initialize values in ROM
    initial $readmemb("./weights_rom", rom);

    wire [7:0] y0, y1, y2, y3;
    wire [7:0] h0, h1, h2, h3;
    wire ready_0, ready_1, ready_2, ready_3, ready_h;
    wire [25:0] ready_out;

    // Input layer of neurons (from 3.1)
    neuron l0n3(clk, rom[0][39:32], rom[0][31:24], rom[0][23:16], rom[0][15:8], rom[0][7:0], x3, x2, x1, x0, new, y3, ready_3);
    neuron l0n2(clk, rom[1][39:32], rom[1][31:24], rom[1][23:16], rom[1][15:8], rom[1][7:0], x3, x2, x1, x0, new, y2, ready_2);
    neuron l0n1(clk, rom[2][39:32], rom[2][31:24], rom[2][23:16], rom[2][15:8], rom[2][7:0], x3, x2, x1, x0, new, y1, ready_1);
    neuron l0n0(clk, rom[3][39:32], rom[3][31:24], rom[3][23:16], rom[3][15:8], rom[3][7:0], x3, x2, x1, x0, new, y0, ready_0);

    // Interlayer module (from 3.2)
    interlayer i2o(clk, new, y3, ready_3, y2, ready_2, y1, ready_1, y0, ready_0, h3, h2, h1, h0, ready_h);

    // Output layer of neurons (from 3.1)
    neuron  l1n0(clk,  rom[4][39:32],  rom[4][31:24],  rom[4][23:16],  rom[4][15:8],  rom[4][7:0], h3, h2, h1, h0, ready_h, a,  ready_out[0]);
    neuron  l1n1(clk,  rom[5][39:32],  rom[5][31:24],  rom[5][23:16],  rom[5][15:8],  rom[5][7:0], h3, h2, h1, h0, ready_h, b,  ready_out[1]);
    neuron  l1n2(clk,  rom[6][39:32],  rom[6][31:24],  rom[6][23:16],  rom[6][15:8],  rom[6][7:0], h3, h2, h1, h0, ready_h, c,  ready_out[2]);
    neuron  l1n3(clk,  rom[7][39:32],  rom[7][31:24],  rom[7][23:16],  rom[7][15:8],  rom[7][7:0], h3, h2, h1, h0, ready_h, d,  ready_out[3]);
    neuron  l1n4(clk,  rom[8][39:32],  rom[8][31:24],  rom[8][23:16],  rom[8][15:8],  rom[8][7:0], h3, h2, h1, h0, ready_h, e,  ready_out[4]);
    neuron  l1n5(clk,  rom[9][39:32],  rom[9][31:24],  rom[9][23:16],  rom[9][15:8],  rom[9][7:0], h3, h2, h1, h0, ready_h, f,  ready_out[5]);
    neuron  l1n6(clk, rom[10][39:32], rom[10][31:24], rom[10][23:16], rom[10][15:8], rom[10][7:0], h3, h2, h1, h0, ready_h, g,  ready_out[6]);
    neuron  l1n7(clk, rom[11][39:32], rom[11][31:24], rom[11][23:16], rom[11][15:8], rom[11][7:0], h3, h2, h1, h0, ready_h, h,  ready_out[7]);
    neuron  l1n8(clk, rom[12][39:32], rom[12][31:24], rom[12][23:16], rom[12][15:8], rom[12][7:0], h3, h2, h1, h0, ready_h, i,  ready_out[8]);
    neuron  l1n9(clk, rom[13][39:32], rom[13][31:24], rom[13][23:16], rom[13][15:8], rom[13][7:0], h3, h2, h1, h0, ready_h, j,  ready_out[9]);
    neuron l1n10(clk, rom[14][39:32], rom[14][31:24], rom[14][23:16], rom[14][15:8], rom[14][7:0], h3, h2, h1, h0, ready_h, k, ready_out[10]);
    neuron l1n11(clk, rom[15][39:32], rom[15][31:24], rom[15][23:16], rom[15][15:8], rom[15][7:0], h3, h2, h1, h0, ready_h, l, ready_out[11]);
    neuron l1n12(clk, rom[16][39:32], rom[16][31:24], rom[16][23:16], rom[16][15:8], rom[16][7:0], h3, h2, h1, h0, ready_h, m, ready_out[12]);
    neuron l1n13(clk, rom[17][39:32], rom[17][31:24], rom[17][23:16], rom[17][15:8], rom[17][7:0], h3, h2, h1, h0, ready_h, n, ready_out[13]);
    neuron l1n14(clk, rom[18][39:32], rom[18][31:24], rom[18][23:16], rom[18][15:8], rom[18][7:0], h3, h2, h1, h0, ready_h, o, ready_out[14]);
    neuron l1n15(clk, rom[19][39:32], rom[19][31:24], rom[19][23:16], rom[19][15:8], rom[19][7:0], h3, h2, h1, h0, ready_h, p, ready_out[15]);
    neuron l1n16(clk, rom[20][39:32], rom[20][31:24], rom[20][23:16], rom[20][15:8], rom[20][7:0], h3, h2, h1, h0, ready_h, q, ready_out[16]);
    neuron l1n17(clk, rom[21][39:32], rom[21][31:24], rom[21][23:16], rom[21][15:8], rom[21][7:0], h3, h2, h1, h0, ready_h, r, ready_out[17]);
    neuron l1n18(clk, rom[22][39:32], rom[22][31:24], rom[22][23:16], rom[22][15:8], rom[22][7:0], h3, h2, h1, h0, ready_h, s, ready_out[18]);
    neuron l1n19(clk, rom[23][39:32], rom[23][31:24], rom[23][23:16], rom[23][15:8], rom[23][7:0], h3, h2, h1, h0, ready_h, t, ready_out[19]);
    neuron l1n20(clk, rom[24][39:32], rom[24][31:24], rom[24][23:16], rom[24][15:8], rom[24][7:0], h3, h2, h1, h0, ready_h, u, ready_out[20]);
    neuron l1n21(clk, rom[25][39:32], rom[25][31:24], rom[25][23:16], rom[25][15:8], rom[25][7:0], h3, h2, h1, h0, ready_h, v, ready_out[21]);
    neuron l1n22(clk, rom[26][39:32], rom[26][31:24], rom[26][23:16], rom[26][15:8], rom[26][7:0], h3, h2, h1, h0, ready_h, w, ready_out[22]);
    neuron l1n23(clk, rom[27][39:32], rom[27][31:24], rom[27][23:16], rom[27][15:8], rom[27][7:0], h3, h2, h1, h0, ready_h, x, ready_out[23]);
    neuron l1n24(clk, rom[28][39:32], rom[28][31:24], rom[28][23:16], rom[28][15:8], rom[28][7:0], h3, h2, h1, h0, ready_h, y, ready_out[24]);
    neuron l1n25(clk, rom[29][39:32], rom[29][31:24], rom[29][23:16], rom[29][15:8], rom[29][7:0], h3, h2, h1, h0, ready_h, z, ready_out[25]);
    assign ready = &(ready_out);
endmodule

// ****************
// Blocks to design
// ****************

// 3.3a) Morse decoder
// 1 bit time-series input 
// 5 bit letter [a=0, ..., z=25] output
// 7 bit 7-segment display output
// 1 bit flag indicating done

module decoder(clk, in, letter, display, done);
  input clk;
  input in;
  output [4:0] letter;
  output [6:0] display;
  output done;
/*
3.3(a) For the sake of debugging (as seen in the test-bench), I've added another
  output to the decoder module: the 5 bit letter index as output by the maxindex
  block.
  
  Connect the input de-serializer from lab 2 to the input of the above neural net. Connect output of the neural
net to the maximum index module of lab 1, followed by the display driver of lab 1. Add any necessary registers
/ pipeline stages to ensure that the throughput of the system remains at least one per 8 clock cycles.
3.3(b). Add an output flag indicating when the display driver output is valid.
  
*/ wire [7:0] out3,out2,out1,out0;

  wire [7:0]   a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z;
 //these are all outputs from the net
  wire dsdone,rdynet;
  
   deserializer dsz(clk, in, out3, out2, out1, out0, dsdone);
   net lmaonet(clk, out3, out2, out1, out0, dsdone, a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z, rdynet);
    maxindex mi(a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,letter);
   display_rom ddr(letter, display);
  dreg readytheradnet(clk,rdynet,done);
  //  assign done=rdynet;
  //initial begin
   // $monitor("%b, %b",dsdone,done);
  //end 
  //deserializer dsz(clk,in,outp3,outp2,outp1,outp0,dsdone); //out of deserializer goes into the net
  //amatry piping the outputs see what happens

//    wire [7:0] outp3p,outp2p,outp1p,outp0p;
/*
  
  dreg #(8)disaster1(clk,outp0,outp0p);
  dreg #(8)disaster2(clk,outp1,outp1p);
  dreg #(8)disaster3(clk,outp2,outp2p);
  dreg #(8)disaster4(clk,outp3,outp3p);
  
  
  wire dsdonep;
  //dreg dsdoneeeer(clk,dsdone,dsdonep);
  net lmaoneuralnet(clk,outp3p,outp2p,outp1p,outp0p,dsdone,a1,b1,c1,d1,e1,f1,g1,h1,i1,j1,k1,l1,m1,n1,o1,p1,q1,r1,s1,t1,u1,v1,w1,x1,y1,z1,rdynet);
  //outputs, i have 26 8 bit outputs in here, are connected to the mam in lab 1. 
 // wire [4:0] mamoutputs; //5 bit output from the mam
  
  wire [7:0]   a1p, b1p, c1p,d1p,e1p,f1p,g1p,h1p,i1p,j1p,k1p,l1p,m1p,n1p,o1p,p1p,q1p,r1p,s1p,t1p,u1p,v1p,w1p,x1p,y1p,z1p;
  
  dreg #(8)disaster1a(clk,a1,a1p);
  dreg #(8)disaster2b(clk,b1,b1p);
  dreg #(8)disaster3c(clk,c1,c1p);
  dreg #(8)disaster4d(clk,d1,d1p);
  dreg #(8)disaster1e(clk,e1,e1p);
  dreg #(8)disaster2f(clk,f1,f1p);
  dreg #(8)disaster3g(clk,g1,g1p);
  dreg #(8)disaster4h(clk,h1,h1p);
  dreg #(8)disaster1i(clk,i1,i1p);
  dreg #(8)disaster2j(clk,j1,j1p);
  dreg #(8)disaster3k(clk,k1,k1p);
  dreg #(8)disaster4l(clk,l1,l1p);
  dreg #(8)disaster1m(clk,m1,m1p);
  dreg #(8)disaster2n(clk,n1,n1p);
  dreg #(8)disaster3o(clk,o1,o1p);
  dreg #(8)disaster4p(clk,p1,p1p);
  dreg #(8)disaster1q(clk,q1,q1p);
  dreg #(8)disaster2r(clk,r1,r1p);
  dreg #(8)disaster3s(clk,s1,s1p);
  dreg #(8)disaster4t(clk,t1,t1p);
  dreg #(8)disaster1u(clk,u1,u1p);
  dreg #(8)disaster2v(clk,v1,v1p);
  dreg #(8)disaster3w(clk,w1,w1p);
  dreg #(8)disaster4x(clk,x1,x1p);
  dreg #(8)disaster1y(clk,y1,y1p);
  dreg #(8)disaster2z(clk,z1,z1p);
 
  ////module maxindex(a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,out);

  wire [6:0]displaynotp;
  wire [4:0]letternotp;
  maxindex chillmammer(a1p, b1p, c1p,d1p,e1p,f1p,g1p,h1p,i1p,j1p,k1p,l1p,m1p,n1p,o1p,p1p,q1p,r1p,s1p,t1p,u1p,v1p,w1p,x1p,y1p,z1p,letternotp);
   dreg #(5) letterneedstopepipedtooasdf(clk,letternotp,letter);
  display_rom  myfinalproductplsdontbm(letter,displaynotp);
  dreg #(7) displayerdisplayerdisp(clk,displaynotp,display);

  //assign letter=mamoutputs;
  //need to figure out also how to assign done
  
  //shouldnt it jus also be pass done through 4 dregs
  wire d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14;
  //wire v;
  dreg done1(clk,rdynet,d2);
  dreg done2(clk,d2,d3);
  //dreg done3(clk,d3,d4);
  dreg done33(clk,d4,d5);//dreg done34(clk,d5,d6);
  dreg done333(clk,d5,d6);
  dreg done312(clk,d6,d7);
  dreg doneasdf3as(clk,d7,d8);
  dreg doneasdfdsf3(clk,d8,d9);
  dreg doneasdfce3(clk,d9,d10);
  dreg doneasdfvacv3(clk,d10,d11);
  dreg doneasdfasdf3(clk,d11,d12);
  dreg doneasdfzxcv3(clk,d12,d13);
  dreg doneasdfeaqr3(clk,d13,d14);

  dreg done4(clk,d3,done);
  
 
  
  wire [2:0] counter;
  wire readyp;
  dreg counterupdate1(clk,counter[2],counter[0]);
  mux2 lookatnew(counter[0],0,in,counter[1]);
  mux2 lookatnextc(counter[1],1, rdynet,counter[2]);
  
  //assign allv=ready1
  
 // mux2 asdf(a,b,sel,y);
  
  
  dreg prevupdates(clk,readyp,done);
  mux2 lookatprev(0,1,rdynet&!counter[0],readyp);
  */
  
  //assign v=rdynet&&dsdone;
  
 //ok so i gated my done bit so that it is forced to be 0 until deserializer is set, after which it'll take the value of the ready bit of the net
  
  
  /*dreg counterupdate1(clk,counter[2],counter[0]);
  mux2 lookatnew(counter[0],0,new,counter[1]);
  mux2 lookatnextc(counter[1],1, allv,counter[2]);
  
  //assign allv=ready1
  
 // mux2 asdf(a,b,sel,y);
  
  
  
  assign allv=ready1&&ready2&&ready3&&ready4;
  dreg prevupdates(clk,readyp,ready_out);
  mux2 lookatprev(0,1,allv&!counter[0],readyp);
  */
  // your code here
endmodule