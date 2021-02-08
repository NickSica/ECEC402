# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct /home/nick/ECEC402/workspace/system_wrapper/platform.tcl
# 
# OR launch xsct and run below command.
# source /home/nick/ECEC402/workspace/system_wrapper/platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {system_wrapper}\
-hw {/home/nick/ECEC402/homework_1/system_wrapper.xsa}\
-fsbl-target {psu_cortexa53_0} -out {/home/nick/ECEC402/workspace}

platform write
domain create -name {standalone_ps7_cortexa9_0} -display-name {standalone_ps7_cortexa9_0} -os {standalone} -proc {ps7_cortexa9_0} -runtime {cpp} -arch {32-bit} -support-app {hello_world}
platform generate -domains 
platform active {system_wrapper}
domain active {zynq_fsbl}
domain active {standalone_ps7_cortexa9_0}
platform generate -quick
platform generate
platform generate
platform clean
platform generate
platform clean
platform active {system_wrapper}
platform config -updatehw {/home/nick/ECEC402/homework_2/led_drv_tb/system_wrapper.xsa}
platform generate
platform clean
platform generate
platform clean
platform active {system_wrapper}
platform config -updatehw {/home/nick/ECEC402/homework_2/led_drv_tb/system_wrapper.xsa}
platform generate
platform clean
platform clean
platform generate
platform clean
platform active {system_wrapper}
platform config -updatehw {/home/nick/ECEC402/homework_3/project_1/system_wrapper.xsa}
platform clean
platform config -updatehw {/home/nick/ECEC402/homework_3/project_1/system_wrapper.xsa}
platform write
platform generate
platform clean
platform generate
platform clean
platform generate
platform clean
platform generate
platform clean
platform generate
platform active {system_wrapper}
platform config -updatehw {/home/nick/ECEC402/homework_3/led_blink/system_wrapper.xsa}
platform generate -domains 
platform clean
platform generate
platform config -updatehw {/home/nick/ECEC402/homework_3/led_blink/system_wrapper.xsa}
platform generate -domains 
platform clean
platform config -updatehw {/home/nick/ECEC402/homework_3/stopwatch/system_wrapper.xsa}
platform generate
platform generate
platform clean
platform generate
platform clean
platform clean
platform clean
platform active {system_wrapper}
platform config -updatehw {/home/nick/ECEC402/homework_3/led_blink/system_wrapper.xsa}
platform generate
platform clean
platform generate
platform generate
platform clean
platform clean
