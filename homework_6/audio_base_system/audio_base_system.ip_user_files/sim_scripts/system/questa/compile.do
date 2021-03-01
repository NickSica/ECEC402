vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xilinx_vip
vlib questa_lib/msim/xpm
vlib questa_lib/msim/axi_i2s_adi_v1_00_a
vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/adi_common_v1_00_a
vlib questa_lib/msim/axi_infrastructure_v1_1_0
vlib questa_lib/msim/axi_vip_v1_1_8
vlib questa_lib/msim/processing_system7_vip_v1_0_10
vlib questa_lib/msim/axi_lite_ipif_v3_0_4
vlib questa_lib/msim/lib_cdc_v1_0_2
vlib questa_lib/msim/interrupt_control_v3_1_4
vlib questa_lib/msim/axi_gpio_v2_0_24
vlib questa_lib/msim/generic_baseblocks_v2_1_0
vlib questa_lib/msim/axi_register_slice_v2_1_22
vlib questa_lib/msim/fifo_generator_v13_2_5
vlib questa_lib/msim/axi_data_fifo_v2_1_21
vlib questa_lib/msim/axi_crossbar_v2_1_23
vlib questa_lib/msim/proc_sys_reset_v5_0_13
vlib questa_lib/msim/axi_protocol_converter_v2_1_22

vmap xilinx_vip questa_lib/msim/xilinx_vip
vmap xpm questa_lib/msim/xpm
vmap axi_i2s_adi_v1_00_a questa_lib/msim/axi_i2s_adi_v1_00_a
vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap adi_common_v1_00_a questa_lib/msim/adi_common_v1_00_a
vmap axi_infrastructure_v1_1_0 questa_lib/msim/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_8 questa_lib/msim/axi_vip_v1_1_8
vmap processing_system7_vip_v1_0_10 questa_lib/msim/processing_system7_vip_v1_0_10
vmap axi_lite_ipif_v3_0_4 questa_lib/msim/axi_lite_ipif_v3_0_4
vmap lib_cdc_v1_0_2 questa_lib/msim/lib_cdc_v1_0_2
vmap interrupt_control_v3_1_4 questa_lib/msim/interrupt_control_v3_1_4
vmap axi_gpio_v2_0_24 questa_lib/msim/axi_gpio_v2_0_24
vmap generic_baseblocks_v2_1_0 questa_lib/msim/generic_baseblocks_v2_1_0
vmap axi_register_slice_v2_1_22 questa_lib/msim/axi_register_slice_v2_1_22
vmap fifo_generator_v13_2_5 questa_lib/msim/fifo_generator_v13_2_5
vmap axi_data_fifo_v2_1_21 questa_lib/msim/axi_data_fifo_v2_1_21
vmap axi_crossbar_v2_1_23 questa_lib/msim/axi_crossbar_v2_1_23
vmap proc_sys_reset_v5_0_13 questa_lib/msim/proc_sys_reset_v5_0_13
vmap axi_protocol_converter_v2_1_22 questa_lib/msim/axi_protocol_converter_v2_1_22

vlog -work xilinx_vip -64 -sv -L axi_vip_v1_1_8 -L processing_system7_vip_v1_0_10 -L xilinx_vip "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm -64 -sv -L axi_vip_v1_1_8 -L processing_system7_vip_v1_0_10 -L xilinx_vip "+incdir+../../../../audio_base_system.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../audio_base_system.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"/opt/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/opt/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"/opt/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work axi_i2s_adi_v1_00_a -64 -93 \
"../../../bd/system/ipshared/922f/hdl/i2s_tx.vhd" \
"../../../bd/system/ipshared/922f/hdl/i2s_controller.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/system/ipshared/922f/hdl/axi_i2s_adi.vhd" \

vcom -work axi_i2s_adi_v1_00_a -64 -93 \
"../../../bd/system/ipshared/922f/hdl/fifo_synchronizer.vhd" \
"../../../bd/system/ipshared/922f/hdl/i2s_rx.vhd" \
"../../../bd/system/ipshared/922f/hdl/i2s_clkgen.vhd" \

vcom -work adi_common_v1_00_a -64 -93 \
"../../../bd/system/ipshared/922f/hdl/adi_common/axi_streaming_dma_rx_fifo.vhd" \
"../../../bd/system/ipshared/922f/hdl/adi_common/axi_ctrlif.vhd" \
"../../../bd/system/ipshared/922f/hdl/adi_common/pl330_dma_fifo.vhd" \
"../../../bd/system/ipshared/922f/hdl/adi_common/axi_streaming_dma_tx_fifo.vhd" \
"../../../bd/system/ipshared/922f/hdl/adi_common/dma_fifo.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/system/ip/system_axi_i2s_adi_0_0/sim/system_axi_i2s_adi_0_0.vhd" \

vlog -work axi_infrastructure_v1_1_0 -64 "+incdir+../../../../audio_base_system.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../audio_base_system.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../audio_base_system.gen/sources_1/bd/system/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_8 -64 -sv -L axi_vip_v1_1_8 -L processing_system7_vip_v1_0_10 -L xilinx_vip "+incdir+../../../../audio_base_system.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../audio_base_system.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../audio_base_system.gen/sources_1/bd/system/ipshared/94c3/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_10 -64 -sv -L axi_vip_v1_1_8 -L processing_system7_vip_v1_0_10 -L xilinx_vip "+incdir+../../../../audio_base_system.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../audio_base_system.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../audio_base_system.gen/sources_1/bd/system/ipshared/34f8/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 "+incdir+../../../../audio_base_system.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../audio_base_system.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_processing_system7_0_0/sim/system_processing_system7_0_0.v" \

vcom -work axi_lite_ipif_v3_0_4 -64 -93 \
"../../../../audio_base_system.gen/sources_1/bd/system/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work lib_cdc_v1_0_2 -64 -93 \
"../../../../audio_base_system.gen/sources_1/bd/system/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work interrupt_control_v3_1_4 -64 -93 \
"../../../../audio_base_system.gen/sources_1/bd/system/ipshared/a040/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_gpio_v2_0_24 -64 -93 \
"../../../../audio_base_system.gen/sources_1/bd/system/ipshared/4318/hdl/axi_gpio_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/system/ip/system_axi_gpio_0_0/sim/system_axi_gpio_0_0.vhd" \
"../../../bd/system/ip/system_axi_gpio_1_0/sim/system_axi_gpio_1_0.vhd" \
"../../../bd/system/ip/system_axi_gpio_2_0/sim/system_axi_gpio_2_0.vhd" \

vlog -work generic_baseblocks_v2_1_0 -64 "+incdir+../../../../audio_base_system.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../audio_base_system.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../audio_base_system.gen/sources_1/bd/system/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_22 -64 "+incdir+../../../../audio_base_system.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../audio_base_system.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../audio_base_system.gen/sources_1/bd/system/ipshared/af2c/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_5 -64 "+incdir+../../../../audio_base_system.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../audio_base_system.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../audio_base_system.gen/sources_1/bd/system/ipshared/276e/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_5 -64 -93 \
"../../../../audio_base_system.gen/sources_1/bd/system/ipshared/276e/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_5 -64 "+incdir+../../../../audio_base_system.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../audio_base_system.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../audio_base_system.gen/sources_1/bd/system/ipshared/276e/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_21 -64 "+incdir+../../../../audio_base_system.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../audio_base_system.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../audio_base_system.gen/sources_1/bd/system/ipshared/54c0/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_23 -64 "+incdir+../../../../audio_base_system.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../audio_base_system.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../audio_base_system.gen/sources_1/bd/system/ipshared/bc0a/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 "+incdir+../../../../audio_base_system.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../audio_base_system.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_xbar_0/sim/system_xbar_0.v" \

vcom -work proc_sys_reset_v5_0_13 -64 -93 \
"../../../../audio_base_system.gen/sources_1/bd/system/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/system/ip/system_rst_ps7_0_50M_0/sim/system_rst_ps7_0_50M_0.vhd" \

vlog -work axi_protocol_converter_v2_1_22 -64 "+incdir+../../../../audio_base_system.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../audio_base_system.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../audio_base_system.gen/sources_1/bd/system/ipshared/5cee/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 "+incdir+../../../../audio_base_system.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../audio_base_system.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_auto_pc_0/sim/system_auto_pc_0.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/system/sim/system.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

