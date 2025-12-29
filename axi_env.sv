class axi_env extends uvm_env;

  axi_driver     drv;
  axi_monitor    mon;
  axi_scoreboard scb;

  `uvm_component_utils(axi_env)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    drv = axi_driver    ::type_id::create("drv", this);
    mon = axi_monitor   ::type_id::create("mon", this);
    scb = axi_scoreboard::type_id::create("scb", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);

    // connect monitor to scoreboard
    mon.ap.connect(scb.analysis_export);
  endfunction

endclass
