`timescale 1ns / 1ps

module Traffic_Light_Sensor(
    input clk,
    input clr,
    input SNS1,
    input SNS2,
    output reg [1:0] TL1,
    output reg [1:0] TL2
);

    reg [1:0] state, nextstate;

    parameter S0 = 2'b00,
              S1 = 2'b01,
              S2 = 2'b10,
              S3 = 2'b11;

    parameter green  = 2'b00,
              yellow = 2'b01,
              red    = 2'b10;

    always @(posedge clk or posedge clr) begin
        if (clr)
            state <= S0;
        else
            state <= nextstate;
    end

    always @(*) begin
        case (state)
            S0: begin
                if (SNS2)
                    nextstate = S1;
                else
                    nextstate = S0;
            end

            S1: nextstate = S2;

            S2: begin
                if (SNS1)
                    nextstate = S3;
                else
                    nextstate = S2;
            end

            S3: nextstate = S0;

            default: nextstate = S0;
        endcase
    end

    always @(*) begin
        case (state)
            S0: begin
                TL1 = green;
                TL2 = red;
            end
            S1: begin
                TL1 = yellow;
                TL2 = red;
            end
            S2: begin
                TL1 = red;
                TL2 = green;
            end
            S3: begin
                TL1 = red;
                TL2 = yellow;
            end
            default: begin
                TL1 = red;
                TL2 = red;
            end
        endcase
    end

endmodule
