class axi_driver extends uvm_driver #(axi_txn);

  virtual axi_if vif;

  `uvm_component_utils(axi_driver)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    if (!uvm_config_db #(virtual axi_if)::get(this, "", "vif", vif))
      `uvm_fatal("DRV", "Virtual interface not set")
  endfunction

 task run_phase(uvm_phase phase);
  axi_txn tr;

  forever begin
    seq_item_port.get_next_item(tr);

    // wait for clock edge
    @(posedge vif.clk);

    // drive one signal
    vif.awvalid <= tr.write;

    seq_item_port.item_done();
  end
endtask

endclass
