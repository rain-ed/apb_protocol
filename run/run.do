vlog -work work -vopt -sv -stats=none E:/uvm_apb/run/top.svh
vsim -voptargs=+acc work.apb_tb_top -debugDB -fsmdebug -l apb_output.log -sv_seed 123
add wave -position insertpoint sim:/apb_tb_top/intf/*
run -all
