module vending_machine(
    input clk, reset,
    input [1:0] coin,
    output reg dispense
);
    reg [1:0] state, next_state;
    parameter S0=2'b00, S5=2'b01, S10=2'b10, S15=2'b11;

    always @(posedge clk or posedge reset) begin
        if (reset) state <= S0;
        else state <= next_state;
    end

    always @(*) begin
        next_state = state;
        dispense = 0;
        case (state)
            S0: if (coin==2'b01) next_state=S5; else if (coin==2'b10) next_state=S10;
            S5: if (coin==2'b01) next_state=S10; else if (coin==2'b10) next_state=S15;
            S10: if (coin==2'b01) next_state=S15; else if (coin==2'b10) next_state=S15;
            S15: begin dispense=1; next_state=S0; end
        endcase
    end
endmodule
