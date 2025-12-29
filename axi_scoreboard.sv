class axi_scoreboard extends uvm_scoreboard;

  // analysis export to receive transactions
  uvm_analysis_imp #(axi_txn, axi_scoreboard) analysis_export;

  `uvm_component_utils(axi_scoreboard)

  function new(string name, uvm_component parent);
    super.new(name, parent);
    analysis_export = new("analysis_export", this);
  endfunction

  // this function is called when monitor sends a transaction
  function void write(axi_txn tr);
    `uvm_info("SCB",
      $sformatf("Scoreboard received: ADDR=0x%0h DATA=0x%0h",
                tr.addr, tr.data),
      UVM_LOW)
  endfunction

endclass
