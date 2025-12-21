interface axi_if;

  // clock and reset
  logic clk;
  logic reset_n;

  // AXI write address channel
  logic        awvalid;
  logic        awready;
  logic [31:0] awaddr;

endinterface