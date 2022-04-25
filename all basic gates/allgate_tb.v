/* testbench for AND gate
File: and_tb.v */

module allgate_tb;

reg t_a, t_b;
wire not_out1,not_out2,or_out,and_out,xor_out,nor_out,nand_out,xnor_out;

all_gate  my_gate( .a(t_a), .b(t_b), .not_out1(not_out1),.not_out2(not_out2),.or_out(or_out),
.and_out(and_out),.xor_out(xor_out),.nor_out(nor_out),.nand_out(nand_out),.xnor_out(xnor_out) );

initial
begin
$monitor(t_a, t_b, not_out1, not_out2, or_out, and_out, xor_out, nor_out, nand_out, xnor_out);

#150
t_a = 1'b0;
t_b = 1'b0;

#150
t_a = 1'b0;
t_b = 1'b1;

#150
t_a = 1'b1;
t_b = 1'b0;

#150
t_a = 1'b1;
t_b = 1'b1;

end
endmodule