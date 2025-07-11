module gshare_predictor #(parameter GHR_WIDTH = 8, PHT_ENTRIES = 256) (
    input clk,
    input reset,
    input branch_resolved,
    input branch_taken,
    input [31:0] pc,
    output predict_taken,
    output [7:0] index,
    output [GHR_WIDTH-1:0] ghr,
    output [31:0] resolved_pc
);

    reg [1:0] PHT [0:PHT_ENTRIES-1];
    reg [GHR_WIDTH-1:0] GHR;
    wire [1:0] counter;

    assign ghr = GHR;
    assign index = GHR ^ pc[7:0];
    assign counter = PHT[index];
    assign predict_taken = counter[1];
    assign resolved_pc = (branch_resolved) ? pc : 32'd0;

    integer i;
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            GHR <= 0;
            for (i = 0; i < PHT_ENTRIES; i = i + 1)
                PHT[i] <= 2'b01; // Weakly not taken
        end else begin
            if (branch_resolved) begin
                if (branch_taken && PHT[index] != 2'b11)
                    PHT[index] <= PHT[index] + 1;
                else if (!branch_taken && PHT[index] != 2'b00)
                    PHT[index] <= PHT[index] - 1;

                GHR <= {GHR[GHR_WIDTH-2:0], branch_taken};
            end
        end
    end

endmodule
