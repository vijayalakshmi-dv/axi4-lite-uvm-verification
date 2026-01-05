AXI4-Lite UVM Verification

This repository contains a UVM-based verification environment
for the AXI4-Lite protocol implemented using SystemVerilog.

Verification Components:
- AXI Driver, Monitor, Sequencer, Scoreboard
- Transaction-level modeling using sequence items
- Interface-based signal driving and sampling

Verified Features:
- AXI write and read transactions
- VALID–READY handshake mechanism
- Address alignment constraints
- Write response handling
- Reset behavior

Simulation:
The verification environment was simulated locally using
QuestaSim/ModelSim. GitHub is used only for code versioning
and sharing; execution requires licensed EDA tools.

Debugging:
RTL and protocol issues were debugged using waveform and
log-based analysis.

Author: Vijaya Lakshmi Puligedda
