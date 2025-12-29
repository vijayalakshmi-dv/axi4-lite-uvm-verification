class axi_test extends uvm_test;

  axi_env env;

  `uvm_component_utils(axi_test)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

endclass
