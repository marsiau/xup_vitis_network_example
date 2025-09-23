# Copyright (C) 2021-2022 Xilinx, Inc
# Copyright (C) 2023-2025 Advanced Micro Devices, Inc.
#
# SPDX-License-Identifier: BSD-3-Clause

set words [split ${device} "_"]

if {[llength ${words}] > 1} {
    set board [lindex ${words} 1]
} else {
    set board ${device}
}

if {[string first "v80" ${words}] != -1} {
    set board "v80"
}

puts "INFO: words-> ${words}\n      board-> ${board}"

if {[string first "u55n" ${board}] != -1} {
    set proj_part "xcu55n-fsvh2892-2L-e"
} elseif {[string first "u50" ${board}] != -1} {
    set proj_part "xcu50-fsvh2104-2-e"
} elseif {[string first "u55c" ${board}] != -1} {
    set proj_part "xcu55c-fsvh2892-2L-e"
} elseif {[string first "u200" ${board}] != -1} {
    set proj_part "xcu200-fsgd2104-2-e"
} elseif {[string first "u250" ${board}] != -1} {
    set proj_part "xcu250-figd2104-2L-e"
} elseif {[string first "u280" ${board}] != -1} {
    set proj_part "xcu280-fsvh2892-2L-e"
} elseif {[string first "vck5000" ${board}] != -1} {
    set proj_part "xcvc1902-vsva2197-2MP-e-S"
} elseif {[string first "v80" ${board}] != -1} {
    set proj_part "xcv80-lsva4737-2MHP-e-S"
} elseif {[string first "xczu48dr" ${board}] != -1} {
    set proj_part "xczu48dr-ffvg1517-2-e"
} else {
    catch {common::send_gid_msg -ssname BD::TCL -id 2041 -severity "ERROR" "unsupported device: ${device}"}
    return 1
}
