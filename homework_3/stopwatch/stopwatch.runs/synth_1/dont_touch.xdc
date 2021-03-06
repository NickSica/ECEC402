# This file is automatically generated.
# It contains project source information necessary for synthesis and implementation.

# Block Designs: bd/system/system.bd
set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==system || ORIG_REF_NAME==system} -quiet] -quiet

# IP: bd/system/ip/system_processing_system7_0_0/system_processing_system7_0_0.xci
set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==system_processing_system7_0_0 || ORIG_REF_NAME==system_processing_system7_0_0} -quiet] -quiet

# IP: bd/system/ip/system_xbar_0/system_xbar_0.xci
set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==system_xbar_0 || ORIG_REF_NAME==system_xbar_0} -quiet] -quiet

# IP: bd/system/ip/system_axi_interconnect_0_0/system_axi_interconnect_0_0.xci
set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==system_axi_interconnect_0_0 || ORIG_REF_NAME==system_axi_interconnect_0_0} -quiet] -quiet

# IP: bd/system/ip/system_axi_gpio_0_0/system_axi_gpio_0_0.xci
set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==system_axi_gpio_0_0 || ORIG_REF_NAME==system_axi_gpio_0_0} -quiet] -quiet

# IP: bd/system/ip/system_axi_timer_0_0/system_axi_timer_0_0.xci
set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==system_axi_timer_0_0 || ORIG_REF_NAME==system_axi_timer_0_0} -quiet] -quiet

# IP: bd/system/ip/system_rst_ps7_0_50M_0/system_rst_ps7_0_50M_0.xci
set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==system_rst_ps7_0_50M_0 || ORIG_REF_NAME==system_rst_ps7_0_50M_0} -quiet] -quiet

# IP: bd/system/ip/system_xlconcat_0_0/system_xlconcat_0_0.xci
set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==system_xlconcat_0_0 || ORIG_REF_NAME==system_xlconcat_0_0} -quiet] -quiet

# IP: bd/system/ip/system_auto_pc_0/system_auto_pc_0.xci
set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==system_auto_pc_0 || ORIG_REF_NAME==system_auto_pc_0} -quiet] -quiet

# XDC: /home/nick/ECEC402/homework_3/stopwatch/project_1.gen/sources_1/bd/system/ip/system_processing_system7_0_0/system_processing_system7_0_0.xdc
set_property KEEP_HIERARCHY SOFT [get_cells [split [join [get_cells -hier -filter {REF_NAME==system_processing_system7_0_0 || ORIG_REF_NAME==system_processing_system7_0_0} -quiet] {/inst } ]/inst ] -quiet] -quiet

# XDC: /home/nick/ECEC402/homework_3/stopwatch/project_1.gen/sources_1/bd/system/ip/system_axi_gpio_0_0/system_axi_gpio_0_0_board.xdc
set_property KEEP_HIERARCHY SOFT [get_cells [split [join [get_cells -hier -filter {REF_NAME==system_axi_gpio_0_0 || ORIG_REF_NAME==system_axi_gpio_0_0} -quiet] {/U0 } ]/U0 ] -quiet] -quiet

# XDC: /home/nick/ECEC402/homework_3/stopwatch/project_1.gen/sources_1/bd/system/ip/system_axi_gpio_0_0/system_axi_gpio_0_0_ooc.xdc

# XDC: /home/nick/ECEC402/homework_3/stopwatch/project_1.gen/sources_1/bd/system/ip/system_axi_gpio_0_0/system_axi_gpio_0_0.xdc
#dup# set_property KEEP_HIERARCHY SOFT [get_cells [split [join [get_cells -hier -filter {REF_NAME==system_axi_gpio_0_0 || ORIG_REF_NAME==system_axi_gpio_0_0} -quiet] {/U0 } ]/U0 ] -quiet] -quiet

# XDC: /home/nick/ECEC402/homework_3/stopwatch/project_1.gen/sources_1/bd/system/ip/system_axi_timer_0_0/system_axi_timer_0_0.xdc
set_property KEEP_HIERARCHY SOFT [get_cells [split [join [get_cells -hier -filter {REF_NAME==system_axi_timer_0_0 || ORIG_REF_NAME==system_axi_timer_0_0} -quiet] {/U0 } ]/U0 ] -quiet] -quiet

# XDC: /home/nick/ECEC402/homework_3/stopwatch/project_1.gen/sources_1/bd/system/ip/system_axi_timer_0_0/system_axi_timer_0_0_ooc.xdc

# XDC: /home/nick/ECEC402/homework_3/stopwatch/project_1.gen/sources_1/bd/system/ip/system_rst_ps7_0_50M_0/system_rst_ps7_0_50M_0_board.xdc
set_property KEEP_HIERARCHY SOFT [get_cells [split [join [get_cells -hier -filter {REF_NAME==system_rst_ps7_0_50M_0 || ORIG_REF_NAME==system_rst_ps7_0_50M_0} -quiet] {/U0 } ]/U0 ] -quiet] -quiet

# XDC: /home/nick/ECEC402/homework_3/stopwatch/project_1.gen/sources_1/bd/system/ip/system_rst_ps7_0_50M_0/system_rst_ps7_0_50M_0.xdc
#dup# set_property KEEP_HIERARCHY SOFT [get_cells [split [join [get_cells -hier -filter {REF_NAME==system_rst_ps7_0_50M_0 || ORIG_REF_NAME==system_rst_ps7_0_50M_0} -quiet] {/U0 } ]/U0 ] -quiet] -quiet

# XDC: /home/nick/ECEC402/homework_3/stopwatch/project_1.gen/sources_1/bd/system/ip/system_auto_pc_0/system_auto_pc_0_ooc.xdc

# XDC: /home/nick/ECEC402/homework_3/stopwatch/project_1.gen/sources_1/bd/system/system_ooc.xdc
