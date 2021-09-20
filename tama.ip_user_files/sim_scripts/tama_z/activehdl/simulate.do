onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+tama_z -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.tama_z xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {tama_z.udo}

run -all

endsim

quit -force
