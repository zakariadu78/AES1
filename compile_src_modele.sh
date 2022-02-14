#!/bin/bash

export PROJECTNAME="."

# TO DO : test $PROJECTNAME
echo "the project location is : $PROJECTNAME"
echo "removing libs"
vdel -lib LIB/lib_aes -all
vdel -lib LIB/lib_rtl -all
vdel -lib LIB/lib_bench -all 

echo "creating library "
vlib $PROJECTNAME/LIB/lib_aes
vmap lib_aes $PROJECTNAME/LIB/lib_aes
vlib $PROJECTNAME/LIB/lib_rtl
vmap lib_rtl $PROJECTNAME/LIB/lib_rtl
vlib $PROJECTNAME/LIB/lib_bench
vmap lib_bench $PROJECTNAME/LIB/lib_bench

echo "compile third party library"
vcom -work lib_aes $PROJECTNAME/SRC/PACKAGE/state_definition_package.vhd

echo "compile vhdl sources"
vcom -work lib_rtl $PROJECTNAME/SRC/RTL/Sbox.vhd
vcom -work lib_rtl $PROJECTNAME/SRC/RTL/SubBytes.vhd
vcom -work lib_rtl $PROJECTNAME/SRC/RTL/ShiftRow.vhd
vcom -work lib_rtl $PROJECTNAME/SRC/RTL/MixColumn.vhd
vcom -work lib_rtl $PROJECTNAME/SRC/RTL/addRoundKey.vhd
vcom -work lib_rtl $PROJECTNAME/SRC/RTL/KeyExpansion_table.vhd
vcom -work lib_rtl $PROJECTNAME/SRC/RTL/MUX.vhd
vcom -work lib_rtl $PROJECTNAME/SRC/RTL/Counter.vhd
vcom -work lib_rtl $PROJECTNAME/SRC/RTL/AES_Round.vhd
vcom -work lib_rtl $PROJECTNAME/SRC/RTL/AES_FSM.vhd
vcom -work lib_rtl $PROJECTNAME/SRC/RTL/stateToBit128.vhd
vcom -work lib_rtl $PROJECTNAME/SRC/RTL/AES.vhd

echo "compile vhdl test bench"

vcom -work lib_bench $PROJECTNAME/SRC/BENCH/Counter_tb.vhd
vcom -work lib_bench $PROJECTNAME/SRC/BENCH/Sbox_tb.vhd
vcom -work lib_bench $PROJECTNAME/SRC/BENCH/SubBytes_tb.vhd
vcom -work lib_bench $PROJECTNAME/SRC/BENCH/ShiftRows_tb.vhd
vcom -work lib_bench $PROJECTNAME/SRC/BENCH/addRoundKey_tb.vhd
vcom -work lib_bench $PROJECTNAME/SRC/BENCH/MixColumn_tb.vhd
vcom -work lib_bench $PROJECTNAME/SRC/BENCH/KeyExpansion_table_tb.vhd
vcom -work lib_bench $PROJECTNAME/SRC/BENCH/AES_Round_tb.vhd
vcom -work lib_bench $PROJECTNAME/SRC/BENCH/AES_tb.vhd



echo "compilation finished"

echo "start simulation..."
# ATTENTION un seul VSIM decommenté à la fois!
vsim .


