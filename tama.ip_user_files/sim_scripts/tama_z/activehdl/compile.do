vlib work
vlib activehdl

vlib activehdl/xil_defaultlib

vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 \
"../../../bd/tama_z/ipshared/ed96/src/czujniki.v" \
"../../../bd/tama_z/ip/tama_z_czujniki_0_0/sim/tama_z_czujniki_0_0.v" \
"../../../bd/tama_z/ipshared/0f53/src/pBlazeZH.v" \
"../../../bd/tama_z/ip/tama_z_PBlazeZH_0_0/sim/tama_z_PBlazeZH_0_0.v" \
"../../../bd/tama_z/ipshared/37b3/src/multiplexer.v" \
"../../../bd/tama_z/ip/tama_z_multiplexer_0_0/sim/tama_z_multiplexer_0_0.v" \
"../../../bd/tama_z/ipshared/e07d/src/dekoder.v" \
"../../../bd/tama_z/ip/tama_z_dekoder_0_0/sim/tama_z_dekoder_0_0.v" \
"../../../bd/tama_z/ipshared/a06e/src/pamiec_pro.PICO3.v" \
"../../../bd/tama_z/ip/tama_z_pamiec_pro_0_0/sim/tama_z_pamiec_pro_0_0.v" \
"../../../bd/tama_z/ipshared/fda8/src/otwory.v" \
"../../../bd/tama_z/ip/tama_z_otwory_0_0/sim/tama_z_otwory_0_0.v" \
"../../../bd/tama_z/sim/tama_z.v" \


vlog -work xil_defaultlib \
"glbl.v"

