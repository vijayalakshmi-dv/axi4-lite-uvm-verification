class axi_monitor extends uvm_monitor;

  // virtual interface handle
  virtual axi_if vif;

  `uvm_component_utils(axi_monitor)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

endclass
