set_property PACKAGE_PIN K18 [get_ports {AC_BCLK[0]}]
set_property PACKAGE_PIN T19 [get_ports {AC_MCLK}]
set_property PACKAGE_PIN P18 [get_ports {AC_MUTE_N}]
set_property PACKAGE_PIN L17 [get_ports {AC_PBLRC[0]}]
set_property PACKAGE_PIN M18 [get_ports {AC_RECLRC[0]}]
set_property PACKAGE_PIN M17 [get_ports {AC_SDATA[0]}]
set_property PACKAGE_PIN K17 [get_ports {AC_SDATA_I}]
set_property IOSTANDARD LVCMOS33 [get_ports AC*]

set_property PACKAGE_PIN N18 [get_ports ac_scl_io]
set_property IOSTANDARD LVCMOS33 [get_ports ac_scl_io]
set_property PACKAGE_PIN N17 [get_ports ac_sda_io]
set_property IOSTANDARD LVCMOS33 [get_ports ac_sda_io]



#False path constraints for crossing clock domains in the Audio and Display cores.
#Synchronization between the clock domains is handled properly in logic.
#TODO: The following constraints should be changed to identify the proper pins
#      of the cores by their hierarchical pin names. Currently the global clock names are
#      used. Ultimately, it would be nice to have the cores automatically generate them.
#adi_i2s constaints:
set_false_path -from [get_clocks clk_fpga_0] -to [get_clocks clk_fpga_2]
set_false_path -from [get_clocks clk_fpga_2] -to [get_clocks clk_fpga_0]