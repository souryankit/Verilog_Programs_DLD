
module edge_detect_tb;
 // Inputs
 reg clk, level,reset;
// Outputs
 wire moore_tick, mealy_tick;
 
 edgeDetector uut(.clk(clk), .level(level), .rst(reset), .mealy_tick(mealy_tick), .moore_tick( moore_tick));
 
 initial begin
 clk = 0;
 forever #5 clk = ~clk;
 end 
 initial begin
  // Initialize Inputs
  level = 0;
  reset = 1;
  #30;
      reset = 0;
  #40;
  level = 1;
  #10;
  level = 0;
  #10;
  level = 1;
  reset = 1; 
  #20;
  level = 0; 
  #20;
  level = 1; 
  #20;
  reset = 0;
  level = 0;  

 end
      
endmodule