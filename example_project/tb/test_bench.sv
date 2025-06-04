//`include "../sim/pkg.f"
import rtl_pkg::*;
module test_bench;

    reg [DW-1:0] a,b,c;
    wire [DW-1:0] y;

    top u_dut(.*);

    initial begin
        a = 1;
        b = 1;
        c = 0;

        #100;

        //Write you test here
	a = 0;
	b = 0;
	c = 1;
	#10;
	if(y == 1'b1) $display("PASSED");
	else $display("a=%b, b=%b, c=%b, y is not 1, y is: %b",a,b,c,y);
       a = 1;
	b = 0;
	c = 0;
	#10;
	if(y == 1'b0) $display("PASSED");
	else $display("a=%b, b=%b, c=%b, y is not 1, y is: %b",a,b,c,y);
	a = 1;
	b = 0;
	c = 1;
//	#10;
//	if(y == 1'b1) $display("PASSED");
//	else $display("a=%b, b=%b, c=%b, y is not 1, y is: %b",a,b,c,y);
//	a = 0;
//	b = 0;
//	c = 1;
//	#10;
//	if(y == 1'b0) $display("PASSED");
//	else $display("a=%b, b=%b, c=%b, y is not 1, y is: %b",a,b,c,y);
//	a = 1;
//	b = 0;
//	c = 1;
//	#10;
//	if(y == 1'b1) $display("PASSED");
//	else $display("a=%b, b=%b, c=%b, y is not 1, y is: %b",a,b,c,y);
//
	#100
        $finish;

    end

endmodule
