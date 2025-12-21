class axi_txn extends uvm_sequence_item;

  rand logic [31:0] addr;
  rand logic [31:0] data;
  rand logic        write;

  `uvm_object_utils(axi_txn)

  function new(string name = "axi_txn");
    super.new(name);
  endfunction

endclass
