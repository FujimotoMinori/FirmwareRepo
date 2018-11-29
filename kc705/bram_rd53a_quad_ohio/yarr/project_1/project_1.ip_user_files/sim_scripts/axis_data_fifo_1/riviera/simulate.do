onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+axis_data_fifo_1 -L unisims_ver -L unimacro_ver -L secureip -L xil_defaultlib -L xpm -O5 xil_defaultlib.axis_data_fifo_1 xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {axis_data_fifo_1.udo}

run -all

endsim

quit -force
