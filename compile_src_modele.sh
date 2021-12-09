#!/bin/bash

export PROJECTNAME="."

# TO DO : test $PROJECTNAME
echo "the project location is : $PROJECTNAME"
echo "removing libs"
/home/zakaria/intelFPGA/20.1/modelsim_ase/bin/vdel -lib $PROJECTNAME/LIB/LIB_AES -all
/home/zakaria/intelFPGA/20.1/modelsim_ase/bin/vdel -lib $PROJECTNAME/LIB/LIB_RTL -all
/home/zakaria/intelFPGA/20.1/modelsim_ase/bin/vdel -lib $PROJECTNAME/LIB/LIB_BENCH -all

echo "creating library "
/home/zakaria/intelFPGA/20.1/modelsim_ase/bin/vlib $PROJECTNAME/LIB/LIB_AES
/home/zakaria/intelFPGA/20.1/modelsim_ase/bin/vmap LIB_AES $PROJECTNAME/LIB/LIB_AES
/home/zakaria/intelFPGA/20.1/modelsim_ase/bin/vlib $PROJECTNAME/LIB/LIB_RTL
/home/zakaria/intelFPGA/20.1/modelsim_ase/bin/vmap LIB_RTL $PROJECTNAME/LIB/LIB_RTL
/home/zakaria/intelFPGA/20.1/modelsim_ase/bin/vlib $PROJECTNAME/LIB/LIB_BENCH
/home/zakaria/intelFPGA/20.1/modelsim_ase/bin/vmap LIB_BENCH $PROJECTNAME/LIB/LIB_BENCH

echo "compile third party library"
/home/zakaria/intelFPGA/20.1/modelsim_ase/bin/vcom -work LIB_AES $PROJECTNAME/SRC/PACKAGE/state_definition_package.vhd

echo "compile vhdl sources"
/home/zakaria/intelFPGA/20.1/modelsim_ase/bin/vcom -work LIB_RTL $PROJECTNAME/SRC/RTL/Counter.vhd
/home/zakaria/intelFPGA/20.1/modelsim_ase/bin/vcom -work LIB_RTL $PROJECTNAME/SRC/RTL/KeyExpansion_table.vhd
#A compléter
/home/zakaria/intelFPGA/20.1/modelsim_ase/bin/vcom -work LIB_RTL $PROJECTNAME/SRC/RTL/Sbox.vhd
/home/zakaria/intelFPGA/20.1/modelsim_ase/bin/vcom -work LIB_RTL $PROJECTNAME/SRC/RTL/SubBytes.vhd
/home/zakaria/intelFPGA/20.1/modelsim_ase/bin/vcom -work LIB_RTL $PROJECTNAME/SRC/RTL/ShiftRow.vhd
/home/zakaria/intelFPGA/20.1/modelsim_ase/bin/vcom -work LIB_RTL $PROJECTNAME/SRC/RTL/MixColumn.vhd


echo "compile vhdl test bench"
/home/zakaria/intelFPGA/20.1/modelsim_ase/bin/vcom -work LIB_BENCH $PROJECTNAME/SRC/BENCH/Counter_tb.vhd
/home/zakaria/intelFPGA/20.1/modelsim_ase/bin/vcom -work LIB_BENCH $PROJECTNAME/SRC/BENCH/Sbox_tb.vhd
/home/zakaria/intelFPGA/20.1/modelsim_ase/bin/vcom -work LIB_BENCH $PROJECTNAME/SRC/BENCH/SubBytes_tb.vhd
/home/zakaria/intelFPGA/20.1/modelsim_ase/bin/vcom -work LIB_BENCH $PROJECTNAME/SRC/BENCH/ShiftRows_tb.vhd
/home/zakaria/intelFPGA/20.1/modelsim_ase/bin/vcom -work LIB_BENCH $PROJECTNAME/SRC/BENCH/addRoundKey_tb.vhd
/home/zakaria/intelFPGA/20.1/modelsim_ase/bin/vcom -work LIB_BENCH $PROJECTNAME/SRC/BENCH/MixColumn_tb.vhd


echo "compilation finished"

echo "start simulation..."
# ATTENTION un seul VSIM decommenté à la fois!
#/home/zakaria/intelFPGA/20.1/modelsim_ase/bin/vsim .



