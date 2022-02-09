C:\intelFPGA\20.1\modelsim_ase\win32aloem\vdel -lib LIB/lib_aes -all
C:\intelFPGA\20.1\modelsim_ase\win32aloem\vdel -lib LIB/lib_aes -all
C:\intelFPGA\20.1\modelsim_ase\win32aloem\vdel -lib LIB/lib_aes -all 


C:\intelFPGA\20.1\modelsim_ase\win32aloem\vlib ./LIB/lib_aes
C:\intelFPGA\20.1\modelsim_ase\win32aloem\vmap lib_aes ./LIB/lib_aes
C:\intelFPGA\20.1\modelsim_ase\win32aloem\vlib ./LIB/lib_rtl
C:\intelFPGA\20.1\modelsim_ase\win32aloem\vmap lib_rtl ./LIB/lib_rtl
C:\intelFPGA\20.1\modelsim_ase\win32aloem\vlib ./LIB/lib_bench
C:\intelFPGA\20.1\modelsim_ase\win32aloem\vmap lib_bench ./LIB/lib_bench

C:\intelFPGA\20.1\modelsim_ase\win32aloem\vcom -work lib_aes ./SRC/PACKAGE/state_definition_package.vhd

C:\intelFPGA\20.1\modelsim_ase\win32aloem\vcom -work lib_rtl ./SRC/RTL/Sbox.vhd
C:\intelFPGA\20.1\modelsim_ase\win32aloem\vcom -work lib_rtl ./SRC/RTL/SubBytes.vhd
C:\intelFPGA\20.1\modelsim_ase\win32aloem\vcom -work lib_rtl ./SRC/RTL/ShiftRow.vhd
C:\intelFPGA\20.1\modelsim_ase\win32aloem\vcom -work lib_rtl ./SRC/RTL/MixColumn.vhd
C:\intelFPGA\20.1\modelsim_ase\win32aloem\vcom -work lib_rtl ./SRC/RTL/addRoundKey.vhd
C:\intelFPGA\20.1\modelsim_ase\win32aloem\vcom -work lib_rtl ./SRC/RTL/KeyExpansion_table.vhd
C:\intelFPGA\20.1\modelsim_ase\win32aloem\vcom -work lib_rtl ./SRC/RTL/MUX.vhd
C:\intelFPGA\20.1\modelsim_ase\win32aloem\vcom -work lib_rtl ./SRC/RTL/Counter.vhd
C:\intelFPGA\20.1\modelsim_ase\win32aloem\vcom -work lib_rtl ./SRC/RTL/AES_Round.vhd
C:\intelFPGA\20.1\modelsim_ase\win32aloem\vcom -work lib_rtl ./SRC/RTL/AES_FSM.vhd
C:\intelFPGA\20.1\modelsim_ase\win32aloem\vcom -work lib_rtl ./SRC/RTL/AES.vhd


C:\intelFPGA\20.1\modelsim_ase\win32aloem\vcom -work lib_bench ./SRC/BENCH/Counter_tb.vhd
C:\intelFPGA\20.1\modelsim_ase\win32aloem\vcom -work lib_bench ./SRC/BENCH/Sbox_tb.vhd
C:\intelFPGA\20.1\modelsim_ase\win32aloem\vcom -work lib_bench ./SRC/BENCH/SubBytes_tb.vhd
C:\intelFPGA\20.1\modelsim_ase\win32aloem\vcom -work lib_bench ./SRC/BENCH/ShiftRows_tb.vhd
C:\intelFPGA\20.1\modelsim_ase\win32aloem\vcom -work lib_bench ./SRC/BENCH/addRoundKey_tb.vhd
C:\intelFPGA\20.1\modelsim_ase\win32aloem\vcom -work lib_bench ./SRC/BENCH/MixColumn_tb.vhd
C:\intelFPGA\20.1\modelsim_ase\win32aloem\vcom -work lib_bench ./SRC/BENCH/KeyExpansion_table_tb.vhd
C:\intelFPGA\20.1\modelsim_ase\win32aloem\vcom -work lib_bench ./SRC/BENCH/AES_Round_tb.vhd
C:\intelFPGA\20.1\modelsim_ase\win32aloem\vcom -work lib_bench ./SRC/BENCH/AES_tb.vhd