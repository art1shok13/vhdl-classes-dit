set f=%1
set tb=%2

ghdl -a %1.vhdl
ghdl -a %2.vhdl
ghdl -e %2
ghdl -r %2
ghdl -r %2 --vcd=%1.vcd

gtkwave %1.vcd