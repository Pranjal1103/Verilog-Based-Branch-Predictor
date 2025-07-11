module testbench;

    parameter GHR_WIDTH = 8;
    parameter PHT_ENTRIES = 256;

    reg clk;
    reg reset;
    reg branch_resolved;
    reg branch_taken;
    reg [31:0] pc;
    wire predict_taken;
    wire [7:0] index;
    wire [GHR_WIDTH-1:0] ghr;
    wire [31:0] resolved_pc;

    gshare_predictor #(GHR_WIDTH, PHT_ENTRIES) uut (
        .clk(clk),
        .reset(reset),
        .branch_resolved(branch_resolved),
        .branch_taken(branch_taken),
        .pc(pc),
        .predict_taken(predict_taken),
        .index(index),
        .ghr(ghr),
        .resolved_pc(resolved_pc)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        $dumpfile("gshare.vcd");
        $dumpvars(0, testbench);

        clk = 0;
        reset = 1;
        branch_resolved = 0;
        branch_taken = 0;
        pc = 32'h40;

        #10 reset = 0;

        repeat (20) begin
            @(posedge clk);
            branch_resolved = 1;
            branch_taken = $random % 2;
            pc = 32'h40;
        end

        @(posedge clk);
        $finish;
    end

endmodule
