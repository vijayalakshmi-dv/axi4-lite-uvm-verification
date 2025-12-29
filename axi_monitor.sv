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

endclass
