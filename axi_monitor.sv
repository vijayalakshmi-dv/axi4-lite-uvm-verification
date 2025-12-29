class axi_monitor extends uvm_monitor;

  // virtual interface handle
  virtual axi_if vif;

  `uvm_component_utils(axi_monitor)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    if (!uvm_config_db #(virtual axi_if)::get(this, "", "vif", vif))
      `uvm_fatal("MON", "Virtual interface not set")
  endfunction

  task run_phase(uvm_phase phase);
  axi_txn tr;

  // wait for reset deassertion
  wait (vif.reset_n == 1);

  forever begin
    @(posedge vif.clk);

    // detect write transaction
    if (vif.awvalid && vif.wvalid) begin
      tr = axi_txn::type_id::create("tr", this);

      tr.addr  = vif.awaddr;
      tr.data  = vif.wdata;
      tr.write = 1'b1;

      `uvm_info("MON",
        $sformatf("WRITE observed: ADDR=0x%0h DATA=0x%0h",
                  tr.addr, tr.data),
        UVM_LOW)
    end
  end
endtask


endclass
