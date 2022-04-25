module edgeDetector(
    input clk,
    input level,
    input rst,
    output reg mealy_tick,
    output reg moore_tick
    );

    localparam zeroMealy = 1'b0, oneMealy = 1'b1;

    localparam [1:0]
        zeroMoore = 2'b00,
        edgeMoore = 2'b01,
        oneMoore = 2'b11;

    reg stateMealy_reg, stateMealy_next;
    reg [1:0] stateMoore_reg, stateMoore_next ;
    //Reset State
    always@(posedge clk, posedge rst) begin
        if (rst) begin
            stateMealy_reg <= zeroMealy;
            stateMoore_reg <= zeroMoore;
        end
        else begin
            stateMealy_reg <= stateMealy_next;
            stateMoore_reg <= stateMoore_next;
        end
    end
        
    //mealy Design
        always @(stateMealy_reg, level) begin
            //store current state
            stateMealy_next = stateMealy_next;

            mealy_tick <= 1'b0;
            case (stateMealy_reg)
                zeroMealy:
                    if(level) begin   //when level=1
                        stateMealy_next <= oneMealy;
                        mealy_tick <= 1'b1;
                    end
                oneMealy:
                    if (~level) begin     //when level=0
                        stateMealy_next <= zeroMealy;
                    end   
            endcase
        end

    //Moore Design
        always @(stateMoore_reg, level) begin
            //Store the current state
            stateMoore_next = stateMoore_reg;

            moore_tick <= 1'b0;// set moore_tick to 0
            case (stateMoore_reg)
                zeroMoore:
                if (level) begin
                    stateMoore_next <= edgeMoore;
                end
                edgeMoore: begin
                    moore_tick <= 1'b1;
                    if(level)
                    stateMoore_next <= oneMoore;
                    else //level=0
                        stateMoore_next <= zeroMoore;
                end
                oneMoore:
                if (~level) begin
                    stateMoore_reg <= zeroMoore;
                end
            endcase
        end
endmodule