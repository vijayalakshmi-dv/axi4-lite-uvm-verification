class axi_driver extends uvm_driver #(axi_txn);

  `uvm_component_utils(axi_driver)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

endclass
