//`include "../sim/pkg.f"
import rtl_pkg::*;
module top (
    input   logic [DW-1:0] a,
    input   logic  [DW-1:0] b,
    input   logic [DW-1:0]  c,
    output  logic [DW-1:0]  y 
);

    assign y = a & (b | c);

endmodule
