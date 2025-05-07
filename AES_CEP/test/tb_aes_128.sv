module tb_aes_128 #(
    parameter DATA_WIDTH = 128
);

logic clk, n_rst;
logic [DATA_WIDTH-1:0]  plain_text_data;
logic [DATA_WIDTH-1:0]  cipher_key;
logic [DATA_WIDTH-1:0]  cipherPlainText;
logic                   valid_out;
logic                   valid_in;

aes_128_top DUT (
    .clk_i              (clk),
    .rst_ni             (n_rst),
    .plain_text_data    (plain_text_data),
    .cipher_key         (cipher_key),
    .valid_in           (valid_in),
    .cipherPlainText    (cipherPlainText),
    .valid_out          (valid_out)
);

initial begin
    clk = 0;
    forever clk = #5 ~clk;
end

initial begin
    plain_text_data = '0;
    cipher_key      = '0;
    valid_in        = '0;
    n_rst           = '0;
    @(posedge clk);

    plain_text_data = 128'h1;
    cipher_key = 128'h1;
    valid_in    = 1'b1;
    n_rst       = 1'b1;
    @(posedge clk);

    valid_in    = 1'b0;
    while (!valid_out) begin
        @(posedge clk);
    end
    repeat(2) @(posedge clk);
    $stop;
end

endmodule