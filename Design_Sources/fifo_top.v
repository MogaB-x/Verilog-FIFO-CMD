`define NADDR 3
`define WIDTH 8

module fifo_top(clk, reset, push, pop, di, do, full, empty);
    input wire clk;
    input wire reset;
    input wire push;
    input wire pop;
    input wire [`WIDTH-1:0] di;
    output wire [`WIDTH-1:0] do;
    output wire full;
    output wire empty;

    wire [`NADDR:0] wptr_ext; // Write pointer 
    wire [`NADDR:0] rptr_ext; // Read pointer 
    wire incpw, incpr;        

    // DPRAM init
    dpramv dpram_inst (
        .clk(clk),
        .we(push && !full),    // Write if FIFO is not full
        .waddr(wptr_ext[`NADDR-1:0]), 
        .raddr(rptr_ext[`NADDR-1:0]), 
        .di(di),
        .do(do)
    );

    // CMD Logic init
    cmd_logic cmd_logic_inst (
        .clk(clk),
        .reset(reset),
        .push(push),
        .pop(pop),
        .full(full),
        .empty(empty),
        .incpw(incpw),
        .incpr(incpr)
    );

    // The extended pointers are updated in CMD Logic
    assign wptr_ext = cmd_logic_inst.wptr_ext;
    assign rptr_ext = cmd_logic_inst.rptr_ext;
endmodule
