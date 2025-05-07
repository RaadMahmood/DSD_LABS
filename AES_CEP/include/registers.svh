// Common Registers design for RTL
`ifndef REGISTERS
`define REGISTERS

// Flip-Flop with load-enable and asynchronous active-low reset (implicit clock and reset)
// __q: Q output of FF
// __d: D input of FF
// __load: load d value into FF
// __reset_value: value assigned upon reset
// Implicit:
// clk_i: clock input
// rst_ni: reset input (asynchronous, active low)
`define FFL(__q, __d, __load, __reset_value)         \
  always_ff @(posedge clk_i or negedge rst_ni) begin \
    if (!rst_ni) begin                               \
      __q <= (__reset_value);                        \
    end else begin                                   \
      __q <= (__load) ? (__d) : (__q);               \
    end                                              \
  end

`endif