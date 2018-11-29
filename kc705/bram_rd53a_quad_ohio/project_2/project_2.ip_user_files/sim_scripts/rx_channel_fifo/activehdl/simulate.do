onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+rx_channel_fifo -L unisims_ver -L unimacro_ver -L secureip -L xil_defaultlib -L xpm -O5 xil_defaultlib.rx_channel_fifo xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {rx_channel_fifo.udo}

run -all

endsim

quit -force
