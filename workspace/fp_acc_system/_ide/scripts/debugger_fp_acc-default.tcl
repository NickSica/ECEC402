# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: /home/nick/ECEC402/workspace/fp_acc_system/_ide/scripts/debugger_fp_acc-default.tcl
# 
# 
# Usage with xsct:
# In an external shell use the below command and launch symbol server.
# symbol_server -S -s tcp::1534
# To debug using xsct, launch xsct and run below command
# source /home/nick/ECEC402/workspace/fp_acc_system/_ide/scripts/debugger_fp_acc-default.tcl
# 
connect -path [list tcp::1534 tcp:192.168.1.176:3121]
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent Zybo Z7 210351AB7358A" && level==0 && jtag_device_ctx=="jsn-Zybo Z7-210351AB7358A-13722093-0"}
fpga -file /home/nick/ECEC402/workspace/fp_acc/_ide/bitstream/system_wrapper.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw /home/nick/ECEC402/workspace/system_wrapper/export/system_wrapper/hw/system_wrapper.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source /home/nick/ECEC402/workspace/fp_acc/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow /home/nick/ECEC402/workspace/fp_acc/Debug/fp_acc.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A9*#0"}
con
