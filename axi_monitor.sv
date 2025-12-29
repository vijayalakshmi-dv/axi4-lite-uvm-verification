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
    // wait for reset deassertion
    wait (vif.reset_n == 1);

    forever begin
      @(posedge vif.clk);

      // observe ONE signal
      if (vif.awvalid)
        `uvm_info("MON", "AWVALID observed HIGH", UVM_LOW)
    end
  endtask

endclass
