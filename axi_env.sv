class axi_env extends uvm_env;

  axi_driver     drv;
  axi_monitor    mon;
  axi_scoreboard scb;

  `uvm_component_utils(axi_env)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

endclass
