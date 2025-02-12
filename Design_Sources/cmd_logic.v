`define NADDR 3
`define WIDTH 8

module cmd_logic(clk, reset, push, pop, incpw, incpr, full, empty);
    input wire clk;
    input wire reset;
    input wire push;
    input wire pop;
    output reg incpw;
    output reg incpr;
    output reg full;
    output reg empty;

    reg [`NADDR:0] wptr_ext;  // Write pointer
    reg [`NADDR:0] rptr_ext;  // Read pointer

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            wptr_ext <= 0;
            rptr_ext <= 0;
            incpw <= 0;
            incpr <= 0;
            full <= 0;
            empty <= 1; // FIFO is empty after reset
        end else begin
        // FIFO is full when read and write addresses match (NADDR-1:0), but wptr_ext and rptr_ext have different overflow bits
        // If wptr and rptr are equal after a wrap-around, FIFO might mistakenly interpret it as either full or empty
            
            full <= (wptr_ext[`NADDR-1:0] == rptr_ext[`NADDR-1:0]) &&
                    (wptr_ext[`NADDR] != rptr_ext[`NADDR]);
            empty <= (wptr_ext == rptr_ext);

            // Push control and increment write pointer
            if (push && !full) begin
                incpw <= 1;
                wptr_ext <= wptr_ext + 1;
            end else begin
                incpw <= 0;
            end

            // Pop control and increment read pointer
            if (pop && !empty) begin
                incpr <= 1;
                rptr_ext <= rptr_ext + 1;
            end else begin
                incpr <= 0;
            end
        end
    end
endmodule
