onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+tx_fifo -L unisims_ver -L unimacro_ver -L secureip -L xil_defaultlib -L xpm -O5 xil_defaultlib.tx_fifo xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {tx_fifo.udo}

run -all

endsim

quit -force
