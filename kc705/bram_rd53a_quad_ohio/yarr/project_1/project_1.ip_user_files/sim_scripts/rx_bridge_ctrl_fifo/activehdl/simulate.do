onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+rx_bridge_ctrl_fifo -L unisims_ver -L unimacro_ver -L secureip -L xil_defaultlib -L xpm -O5 xil_defaultlib.rx_bridge_ctrl_fifo xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {rx_bridge_ctrl_fifo.udo}

run -all

endsim

quit -force
