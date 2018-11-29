onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib ila_rx_dma_wb_opt

do {wave.do}

view wave
view structure
view signals

do {ila_rx_dma_wb.udo}

run -all

quit -force
