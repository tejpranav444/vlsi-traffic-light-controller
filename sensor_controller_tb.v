`timescale 1ns / 1ps

module testbench;

    reg clk = 0;
    reg clr = 1;
    reg SNS1 = 0;
    reg SNS2 = 0;

    wire [1:0] TL1;
    wire [1:0] TL2;

    Traffic_Light_Sensor dut (
        .clk(clk),
        .clr(clr),
        .SNS1(SNS1),
        .SNS2(SNS2),
        .TL1(TL1),
        .TL2(TL2)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, testbench);

        clr = 1;
        #13 clr = 0;

        SNS1 = 0; SNS2 = 0; #10;
        SNS1 = 0; SNS2 = 1; #40;
        SNS1 = 0; SNS2 = 0; #40;
        SNS1 = 1; SNS2 = 0; #30;
        SNS1 = 0; SNS2 = 0; #20;
        SNS1 = 0; SNS2 = 1;

        #30 $finish;
    end

endmodule
