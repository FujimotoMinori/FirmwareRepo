onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib rx_channel_fifo_opt

do {wave.do}

view wave
view structure
view signals

do {rx_channel_fifo.udo}

run -all

quit -force