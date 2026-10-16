`timescale 1ns / 1ps

module timer_controller_tb;

    reg clk = 0;
    reg clr = 1;
    wire [5:0] lights;

    Traffic_Light_Time dut (
        .clk(clk),
        .clr(clr),
        .lights(lights)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, timer_controller_tb);

        #12 clr = 0;
        #520 $finish;
    end

endmodule
