onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib rx_bridge_ctrl_fifo_opt

do {wave.do}

view wave
view structure
view signals

do {rx_bridge_ctrl_fifo.udo}

run -all

quit -force
