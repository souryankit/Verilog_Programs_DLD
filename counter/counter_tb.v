module counter_tb();
reg rst, clk, en;
wire [3:0] count;

Counter_fsm counter(.rst(rst), .clk(clk),  .en(en), .count(count));

initial
begin 
$monitor(rst, clk, en, count);
clk=1'b0;
forever #5 clk=~clk;
end
initial begin
rst=1'b1;
en = 1'b0;
#20;
rst=1'b0;

#200;
en = 1'b1;
end
endmodule 