module tb_vending_machine;
    reg clk, reset;
    reg [1:0] coin;
    wire dispense;

    vending_machine dut(.clk(clk), .reset(reset), .coin(coin), .dispense(dispense));

    initial begin
        clk=0; forever #5 clk=~clk;
    end

    initial begin
        reset=1; coin=0; #10;
        reset=0;
        coin=2'b01; #10;
        coin=2'b10; #10;
        coin=2'b01; #10;
        coin=2'b10; #10;
        $stop;
    end
endmodule
