class axi_test extends uvm_test;

  axi_env env;

  `uvm_component_utils(axi_test)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    env = axi_env::type_id::create("env", this);
  endfunction

endclass
