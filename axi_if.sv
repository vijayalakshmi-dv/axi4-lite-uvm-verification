interface axi_if;

  // clock and reset
  logic clk;
  logic reset_n;

  // AXI write address channel
  logic        awvalid;
  logic        awready;
  logic [31:0] awaddr;

  // AXI write data channel
  logic        wvalid;
  logic        wready;
  logic [31:0] wdata;

  // AXI write response channel
  logic        bvalid;
  logic        bready;

endinterface