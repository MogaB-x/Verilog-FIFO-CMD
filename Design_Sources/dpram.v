`define NADDR 3
`define WIDTH 8

module dpramv(clk, we, di, do, waddr, raddr);
    input clk, we; // Clock signal and write enable
    input[`NADDR-1:0] waddr, raddr; // Write and read addresses
    input[`WIDTH-1:0] di; // Data input
    output reg[`WIDTH-1:0] do; // Data output
    reg[`WIDTH-1:0]mem[0:(1<<`NADDR)-1]; // Memory array
    
    always@(posedge clk)
        begin
        if (we)
            mem[waddr] <= di;
        do <= mem[raddr];
        end    
    
endmodule  