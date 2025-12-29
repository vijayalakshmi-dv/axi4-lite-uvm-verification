class axi_seq extends uvm_sequence #(axi_txn);

  `uvm_object_utils(axi_seq)

  function new(string name = "axi_seq");
    super.new(name);
  endfunction

  task body();
    axi_txn tr;

    tr = axi_txn::type_id::create("tr");

    // simple write transaction
    tr.addr  = 32'h0000_0010;
    tr.data  = 32'hDEAD_BEEF;
    tr.write = 1'b1;

    start_item(tr);
    finish_item(tr);
  endtask

endclass
