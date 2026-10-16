// Akash B Kolur - AI Chip - Single MAC Unit - Basic building block of AI chip
module ai_mac (
    input clk, rst,
    input [7:0] a, // weight
    input [7:0] b, // input activation
    input [15:0] c_in, // partial sum from top
    output reg [15:0] c_out // result to bottom
);
    always @(posedge clk) begin
        if (rst)
            c_out <= 0;
        else
            c_out <= c_in + (a * b); // MAC: Multiply + Add - Core AI operation
    end
endmodule
