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

  // wait for reset deassertion
  wait (vif.reset_n == 1);

  forever begin
    seq_item_port.get_next_item(tr);

    // --------------------
    // WRITE ADDRESS PHASE
    // --------------------
    @(posedge vif.clk);
    vif.awvalid <= tr.write;
    vif.awaddr  <= tr.addr;

    wait (vif.awready == 1);

    // --------------------
    // WRITE DATA PHASE
    // --------------------
    @(posedge vif.clk);
    vif.wvalid <= tr.write;
    vif.wdata  <= tr.data;

    wait (vif.wready == 1);

    // deassert address & data valids
    @(posedge vif.clk);
    vif.awvalid <= 0;
    vif.wvalid  <= 0;

    // --------------------
    // WRITE RESPONSE PHASE
    // --------------------
    vif.bready <= 1;
    wait (vif.bvalid == 1);

    @(posedge vif.clk);
    vif.bready <= 0;

    seq_item_port.item_done();
  end
endtask



endclass
