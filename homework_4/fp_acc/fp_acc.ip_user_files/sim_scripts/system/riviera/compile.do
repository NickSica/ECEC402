vlib work
vlib riviera

vlib riviera/xilinx_vip
vlib riviera/xpm
vlib riviera/axi_infrastructure_v1_1_0
vlib riviera/axi_vip_v1_1_8
vlib riviera/processing_system7_vip_v1_0_10
vlib riviera/xil_defaultlib
vlib riviera/lib_pkg_v1_0_2
vlib riviera/fifo_generator_v13_2_5
vlib riviera/lib_fifo_v1_0_14
vlib riviera/lib_srl_fifo_v1_0_2
vlib riviera/lib_cdc_v1_0_2
vlib riviera/axi_datamover_v5_1_24
vlib riviera/axi_sg_v4_1_13
vlib riviera/axi_dma_v7_1_23
vlib riviera/xbip_utils_v3_0_10
vlib riviera/axi_utils_v2_0_6
vlib riviera/xbip_pipe_v3_0_6
vlib riviera/xbip_dsp48_wrapper_v3_0_4
vlib riviera/xbip_dsp48_addsub_v3_0_6
vlib riviera/xbip_dsp48_multadd_v3_0_6
vlib riviera/xbip_bram18k_v3_0_6
vlib riviera/mult_gen_v12_0_16
vlib riviera/floating_point_v7_1_11
vlib riviera/proc_sys_reset_v5_0_13
vlib riviera/xlconstant_v1_1_7
vlib riviera/smartconnect_v1_0
vlib riviera/axi_register_slice_v2_1_22
vlib riviera/xlconcat_v2_1_4
vlib riviera/generic_baseblocks_v2_1_0
vlib riviera/axi_data_fifo_v2_1_21
vlib riviera/axi_protocol_converter_v2_1_22

vmap xilinx_vip riviera/xilinx_vip
vmap xpm riviera/xpm
vmap axi_infrastructure_v1_1_0 riviera/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_8 riviera/axi_vip_v1_1_8
vmap processing_system7_vip_v1_0_10 riviera/processing_system7_vip_v1_0_10
vmap xil_defaultlib riviera/xil_defaultlib
vmap lib_pkg_v1_0_2 riviera/lib_pkg_v1_0_2
vmap fifo_generator_v13_2_5 riviera/fifo_generator_v13_2_5
vmap lib_fifo_v1_0_14 riviera/lib_fifo_v1_0_14
vmap lib_srl_fifo_v1_0_2 riviera/lib_srl_fifo_v1_0_2
vmap lib_cdc_v1_0_2 riviera/lib_cdc_v1_0_2
vmap axi_datamover_v5_1_24 riviera/axi_datamover_v5_1_24
vmap axi_sg_v4_1_13 riviera/axi_sg_v4_1_13
vmap axi_dma_v7_1_23 riviera/axi_dma_v7_1_23
vmap xbip_utils_v3_0_10 riviera/xbip_utils_v3_0_10
vmap axi_utils_v2_0_6 riviera/axi_utils_v2_0_6
vmap xbip_pipe_v3_0_6 riviera/xbip_pipe_v3_0_6
vmap xbip_dsp48_wrapper_v3_0_4 riviera/xbip_dsp48_wrapper_v3_0_4
vmap xbip_dsp48_addsub_v3_0_6 riviera/xbip_dsp48_addsub_v3_0_6
vmap xbip_dsp48_multadd_v3_0_6 riviera/xbip_dsp48_multadd_v3_0_6
vmap xbip_bram18k_v3_0_6 riviera/xbip_bram18k_v3_0_6
vmap mult_gen_v12_0_16 riviera/mult_gen_v12_0_16
vmap floating_point_v7_1_11 riviera/floating_point_v7_1_11
vmap proc_sys_reset_v5_0_13 riviera/proc_sys_reset_v5_0_13
vmap xlconstant_v1_1_7 riviera/xlconstant_v1_1_7
vmap smartconnect_v1_0 riviera/smartconnect_v1_0
vmap axi_register_slice_v2_1_22 riviera/axi_register_slice_v2_1_22
vmap xlconcat_v2_1_4 riviera/xlconcat_v2_1_4
vmap generic_baseblocks_v2_1_0 riviera/generic_baseblocks_v2_1_0
vmap axi_data_fifo_v2_1_21 riviera/axi_data_fifo_v2_1_21
vmap axi_protocol_converter_v2_1_22 riviera/axi_protocol_converter_v2_1_22

vlog -work xilinx_vip  -sv2k12 "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -sv2k12 "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"/opt/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/opt/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"/opt/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"/opt/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../fp_acc.gen/sources_1/bd/system/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_8  -sv2k12 "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../fp_acc.gen/sources_1/bd/system/ipshared/94c3/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_10  -sv2k12 "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../fp_acc.gen/sources_1/bd/system/ipshared/34f8/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_processing_system7_0_0/sim/system_processing_system7_0_0.v" \

vcom -work lib_pkg_v1_0_2 -93 \
"../../../../fp_acc.gen/sources_1/bd/system/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \

vlog -work fifo_generator_v13_2_5  -v2k5 "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../fp_acc.gen/sources_1/bd/system/ipshared/276e/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_5 -93 \
"../../../../fp_acc.gen/sources_1/bd/system/ipshared/276e/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_5  -v2k5 "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../fp_acc.gen/sources_1/bd/system/ipshared/276e/hdl/fifo_generator_v13_2_rfs.v" \

vcom -work lib_fifo_v1_0_14 -93 \
"../../../../fp_acc.gen/sources_1/bd/system/ipshared/a5cb/hdl/lib_fifo_v1_0_rfs.vhd" \

vcom -work lib_srl_fifo_v1_0_2 -93 \
"../../../../fp_acc.gen/sources_1/bd/system/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../../fp_acc.gen/sources_1/bd/system/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work axi_datamover_v5_1_24 -93 \
"../../../../fp_acc.gen/sources_1/bd/system/ipshared/4ab6/hdl/axi_datamover_v5_1_vh_rfs.vhd" \

vcom -work axi_sg_v4_1_13 -93 \
"../../../../fp_acc.gen/sources_1/bd/system/ipshared/4919/hdl/axi_sg_v4_1_rfs.vhd" \

vcom -work axi_dma_v7_1_23 -93 \
"../../../../fp_acc.gen/sources_1/bd/system/ipshared/89d8/hdl/axi_dma_v7_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/system/ip/system_axi_dma_0_0/sim/system_axi_dma_0_0.vhd" \

vcom -work xbip_utils_v3_0_10 -93 \
"../../../../fp_acc.gen/sources_1/bd/system/ipshared/d117/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work axi_utils_v2_0_6 -93 \
"../../../../fp_acc.gen/sources_1/bd/system/ipshared/1971/hdl/axi_utils_v2_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_6 -93 \
"../../../../fp_acc.gen/sources_1/bd/system/ipshared/7468/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_wrapper_v3_0_4 -93 \
"../../../../fp_acc.gen/sources_1/bd/system/ipshared/cdbf/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_addsub_v3_0_6 -93 \
"../../../../fp_acc.gen/sources_1/bd/system/ipshared/910d/hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_multadd_v3_0_6 -93 \
"../../../../fp_acc.gen/sources_1/bd/system/ipshared/b0ac/hdl/xbip_dsp48_multadd_v3_0_vh_rfs.vhd" \

vcom -work xbip_bram18k_v3_0_6 -93 \
"../../../../fp_acc.gen/sources_1/bd/system/ipshared/d367/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \

vcom -work mult_gen_v12_0_16 -93 \
"../../../../fp_acc.gen/sources_1/bd/system/ipshared/ce84/hdl/mult_gen_v12_0_vh_rfs.vhd" \

vcom -work floating_point_v7_1_11 -93 \
"../../../../fp_acc.gen/sources_1/bd/system/ipshared/b0c0/hdl/floating_point_v7_1_rfs.vhd" \

vlog -work floating_point_v7_1_11  -v2k5 "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../fp_acc.gen/sources_1/bd/system/ipshared/b0c0/hdl/floating_point_v7_1_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_floating_point_0_0/sim/system_floating_point_0_0.v" \

vcom -work proc_sys_reset_v5_0_13 -93 \
"../../../../fp_acc.gen/sources_1/bd/system/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/system/ip/system_rst_ps7_0_50M_0/sim/system_rst_ps7_0_50M_0.vhd" \

vlog -work xlconstant_v1_1_7  -v2k5 "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../fp_acc.gen/sources_1/bd/system/ipshared/fcfc/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/ip/ip_0/sim/bd_919a_one_0.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/ip/ip_1/sim/bd_919a_psr_aclk_0.vhd" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../fp_acc.gen/sources_1/bd/system/ipshared/25b7/hdl/sc_util_v1_0_vl_rfs.sv" \
"../../../../fp_acc.gen/sources_1/bd/system/ipshared/c012/hdl/sc_switchboard_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/ip/ip_2/sim/bd_919a_arsw_0.sv" \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/ip/ip_3/sim/bd_919a_rsw_0.sv" \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/ip/ip_4/sim/bd_919a_awsw_0.sv" \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/ip/ip_5/sim/bd_919a_wsw_0.sv" \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/ip/ip_6/sim/bd_919a_bsw_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../fp_acc.gen/sources_1/bd/system/ipshared/ea34/hdl/sc_mmu_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/ip/ip_7/sim/bd_919a_s00mmu_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../fp_acc.gen/sources_1/bd/system/ipshared/4fd2/hdl/sc_transaction_regulator_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/ip/ip_8/sim/bd_919a_s00tr_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../fp_acc.gen/sources_1/bd/system/ipshared/8047/hdl/sc_si_converter_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/ip/ip_9/sim/bd_919a_s00sic_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../fp_acc.gen/sources_1/bd/system/ipshared/b89e/hdl/sc_axi2sc_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/ip/ip_10/sim/bd_919a_s00a2s_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../fp_acc.gen/sources_1/bd/system/ipshared/896c/hdl/sc_node_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/ip/ip_11/sim/bd_919a_sarn_0.sv" \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/ip/ip_12/sim/bd_919a_srn_0.sv" \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/ip/ip_13/sim/bd_919a_sawn_0.sv" \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/ip/ip_14/sim/bd_919a_swn_0.sv" \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/ip/ip_15/sim/bd_919a_sbn_0.sv" \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/ip/ip_16/sim/bd_919a_s01mmu_0.sv" \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/ip/ip_17/sim/bd_919a_s01tr_0.sv" \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/ip/ip_18/sim/bd_919a_s01sic_0.sv" \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/ip/ip_19/sim/bd_919a_s01a2s_0.sv" \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/ip/ip_20/sim/bd_919a_sarn_1.sv" \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/ip/ip_21/sim/bd_919a_srn_1.sv" \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/ip/ip_22/sim/bd_919a_s02mmu_0.sv" \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/ip/ip_23/sim/bd_919a_s02tr_0.sv" \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/ip/ip_24/sim/bd_919a_s02sic_0.sv" \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/ip/ip_25/sim/bd_919a_s02a2s_0.sv" \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/ip/ip_26/sim/bd_919a_sawn_1.sv" \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/ip/ip_27/sim/bd_919a_swn_1.sv" \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/ip/ip_28/sim/bd_919a_sbn_1.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../fp_acc.gen/sources_1/bd/system/ipshared/7005/hdl/sc_sc2axi_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/ip/ip_29/sim/bd_919a_m00s2a_0.sv" \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/ip/ip_30/sim/bd_919a_m00arn_0.sv" \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/ip/ip_31/sim/bd_919a_m00rn_0.sv" \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/ip/ip_32/sim/bd_919a_m00awn_0.sv" \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/ip/ip_33/sim/bd_919a_m00wn_0.sv" \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/ip/ip_34/sim/bd_919a_m00bn_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../fp_acc.gen/sources_1/bd/system/ipshared/7bd7/hdl/sc_exit_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/ip/ip_35/sim/bd_919a_m00e_0.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/sim/bd_919a.v" \

vlog -work axi_register_slice_v2_1_22  -v2k5 "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../fp_acc.gen/sources_1/bd/system/ipshared/af2c/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_smartconnect_0_0/sim/system_smartconnect_0_0.v" \

vlog -work xlconcat_v2_1_4  -v2k5 "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../fp_acc.gen/sources_1/bd/system/ipshared/4b67/hdl/xlconcat_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_xlconcat_0_0/sim/system_xlconcat_0_0.v" \

vlog -work generic_baseblocks_v2_1_0  -v2k5 "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../fp_acc.gen/sources_1/bd/system/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_data_fifo_v2_1_21  -v2k5 "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../fp_acc.gen/sources_1/bd/system/ipshared/54c0/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_protocol_converter_v2_1_22  -v2k5 "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../fp_acc.gen/sources_1/bd/system/ipshared/5cee/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../fp_acc.gen/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_auto_pc_0/sim/system_auto_pc_0.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/system/sim/system.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

