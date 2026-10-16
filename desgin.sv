// Akash B Kolur - AI Chip - Both modules in ONE file for EDA Playground
module ai_mac (
    input clk, rst,
    input [7:0] a, b,
    input [15:0] c_in,
    output reg [15:0] c_out
);
    always @(posedge clk) begin
        if (rst)
            c_out <= 0;
        else
            c_out <= c_in + (a * b);
    end
endmodule

module systolic_4x4 (
    input clk, rst,
    input [7:0] w00, w01, w02, w03,
    input [7:0] w10, w11, w12, w13,
    input [7:0] w20, w21, w22, w23,
    input [7:0] w30, w31, w32, w33,
    input [7:0] x0, x1, x2, x3,
    output [15:0] y0, y1, y2, y3
);
    wire [15:0] s00, s01, s02, s03;
    wire [15:0] s10, s11, s12, s13;
    wire [15:0] s20, s21, s22, s23;
    wire [15:0] s30, s31, s32, s33;

    ai_mac m00 (.clk(clk),.rst(rst),.a(w00),.b(x0),.c_in(16'd0),.c_out(s00));
    ai_mac m01 (.clk(clk),.rst(rst),.a(w01),.b(x1),.c_in(s00),.c_out(s01));
    ai_mac m02 (.clk(clk),.rst(rst),.a(w02),.b(x2),.c_in(s01),.c_out(s02));
    ai_mac m03 (.clk(clk),.rst(rst),.a(w03),.b(x3),.c_in(s02),.c_out(s03));

    ai_mac m10 (.clk(clk),.rst(rst),.a(w10),.b(x0),.c_in(16'd0),.c_out(s10));
    ai_mac m11 (.clk(clk),.rst(rst),.a(w11),.b(x1),.c_in(s10),.c_out(s11));
    ai_mac m12 (.clk(clk),.rst(rst),.a(w12),.b(x2),.c_in(s11),.c_out(s12));
    ai_mac m13 (.clk(clk),.rst(rst),.a(w13),.b(x3),.c_in(s12),.c_out(s13));

    ai_mac m20 (.clk(clk),.rst(rst),.a(w20),.b(x0),.c_in(16'd0),.c_out(s20));
    ai_mac m21 (.clk(clk),.rst(rst),.a(w21),.b(x1),.c_in(s20),.c_out(s21));
    ai_mac m22 (.clk(clk),.rst(rst),.a(w22),.b(x2),.c_in(s21),.c_out(s22));
    ai_mac m23 (.clk(clk),.rst(rst),.a(w23),.b(x3),.c_in(s22),.c_out(s23));

    ai_mac m30 (.clk(clk),.rst(rst),.a(w30),.b(x0),.c_in(16'd0),.c_out(s30));
    ai_mac m31 (.clk(clk),.rst(rst),.a(w31),.b(x1),.c_in(s30),.c_out(s31));
    ai_mac m32 (.clk(clk),.rst(rst),.a(w32),.b(x2),.c_in(s31),.c_out(s32));
    ai_mac m33 (.clk(clk),.rst(rst),.a(w33),.b(x3),.c_in(s32),.c_out(s33));

    assign y0 = s03;
    assign y1 = s13;
    assign y2 = s23;
    assign y3 = s33;
endmodule
