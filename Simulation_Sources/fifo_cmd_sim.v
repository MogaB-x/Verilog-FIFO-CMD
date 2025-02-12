`timescale 1ns / 1ps
`define NADDR 3
`define WIDTH 8

module fifo_cmd_sim;
    reg clk;
    reg reset;
    reg push;
    reg pop;
    reg [`WIDTH-1:0] di;
    wire [`WIDTH-1:0] do;
    wire full;
    wire empty;

    // fifo_top init
    fifo_top uut (
        .clk(clk),
        .reset(reset),
        .push(push),
        .pop(pop),
        .di(di),
        .do(do),
        .full(full),
        .empty(empty)
    );

    // clock
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 0;
        push = 0;
        pop = 0;
        di = 0;

        // Reset
        reset = 1; #10; reset = 0; #10;

        //push 3, push 5
        di = 8'h03; push = 1; #10; push = 0; #10;
        di = 8'h05; push = 1; #10; push = 0; #10;

        //pop 3
        pop = 1; #10; pop = 0; #10;
        
        //push 7, push 9
        di = 8'h07; push = 1; #10; push = 0; #10;
        di = 8'h09; push = 1; #10; push = 0; #10;

        //pop 5, pop 7
        pop = 1; #10; pop = 0; #10; 
        pop = 1; #10; pop = 0; #10;
        
        di = 8'h10; push = 1; #10; push = 0; #10;
        di = 8'h11; push = 1; #10; push = 0; #10;
        di = 8'h12; push = 1; #10; push = 0; #10;
        di = 8'h13; push = 1; #10; push = 0; #10;
        
        //pop 9, pop 10
        pop = 1; #10; pop = 0; #10; 
        pop = 1; #10; pop = 0; #10;
        
        //push
        di = 8'h17; push = 1; #10; push = 0; #10;
        di = 8'h18; push = 1; #10; push = 0; #10;
        di = 8'h19; push = 1; #10; push = 0; #10;
        di = 8'h20; push = 1; #10; push = 0; #10;
        
        //reset
        reset = 1;#10;reset = 0;#10;
        pop = 1; #10; pop = 0; #10;
        
        //overflow
        di = 8'h22; push = 1; #10; push = 0; #10;
        di = 8'h23; push = 1; #10; push = 0; #10;
        di = 8'h24; push = 1; #10; push = 0; #10;
        di = 8'h25; push = 1; #10; push = 0; #10;
        di = 8'h26; push = 1; #10; push = 0; #10;
        di = 8'h27; push = 1; #10; push = 0; #10;
        di = 8'h28; push = 1; #10; push = 0; #10;
        di = 8'h29; push = 1; #10; push = 0; #10;
        di = 8'h30; push = 1; #10; push = 0; #10;
        di = 8'h31; push = 1; #10; push = 0; #10;
        di = 8'h32; push = 1; #10; push = 0; #10;
        
        pop = 1; #10; pop = 0; #10;
        pop = 1; #10; pop = 0; #10;
        pop = 1; #10; pop = 0; #10;
        
        //reset
        reset = 1;#10;reset = 0;#10;
        
        $stop;

    end
   
endmodule
