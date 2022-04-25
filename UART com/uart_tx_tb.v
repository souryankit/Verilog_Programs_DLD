module uart_tb;
    reg clk;			
	reg rst;			

	reg uart_en;			
	wire uart_tx;			
	wire uart_busy;			
	reg[7:0] data;

	// Instantiate Unit Under Test (UUT)
	uart_transmit uut(
		.clk(clk),		
		.rst(rst),		
		.uart_en(uart_en),			
		.uart_tx(uart_tx),		
		.uart_busy(uart_busy)
	);

	// 16x 115200 BAUD clock
	always begin
		#271.27 
		clk = 1'b0;
		#271.27 
		clk = 1'b1;
	end

	initial begin
		// initialize inputs
		clk = 1;
		rst = 1;
		uart_en = 0;
		#100 
		rst = 0;
		#100
		uart_en = 1;
        // send a character
		send(8'h75);
	end

	// send data
	task send;
		input [7:0] char;
		begin
			wait(!clk);
			wait(clk); 
			#1 
			data = {char};
			// write to transmitter
			wait(!clk);
			wait(clk); 
			#1 uart_en = 1;
			wait(!clk);
			wait(clk); #1 uart_en = 0;
			// release bus
			wait(!clk);
			wait(clk); 
			#1
			 data = 8'hx;
		end
	endtask

endmodule