module Counter_fsm (
    input rst,
    input clk,
    input en,
    output reg [3:0] count
    );
    parameter [2:0]
        RESET = 0,
        IDLE = 1,
        UP = 2,
        DOWN = 3;
    integer max = 15;
    reg [1:0] state, next_state;
    reg clk_div;
    reg [27:0] clk_counter;
    parameter div = 28'd100000000 ;
    //clock divider
    always @(posedge clk) begin
        clk_counter <= clk_counter + 28'd1;
        if (clk_counter >= (div - 1)) begin
            clk_counter <= 28'd0;
            clk_div <= (clk_counter < div/2) ? 1'b1 : 1'b0;
        end  
    end
    //reset state
    always @(posedge clk) begin
        if (rst) 
            state <= RESET;
        else 
            state <= next_state;   
    end

    //main Loop
    always @(negedge clk_div) begin
        if (state == RESET)begin
        count <= 0;
        next_state <= UP;    
    end
    else if (en) begin
        case (state)
            UP:
               if (count == max) begin
                   next_state <= DOWN;
                   count <= count - 1'b1;
               end else begin
                   count <= count + 1'b1;
               end
            DOWN:
                if (count == 0) begin
                    next_state <= UP;
                    count <= count + 1'b1;
                end else begin
                    count <= count - 1'b1;
                end
            IDLE:
                next_state <= UP;
        endcase
        
    end else begin
        next_state <= IDLE;
    end 
    end
endmodule
