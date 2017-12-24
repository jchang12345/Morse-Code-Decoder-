## This file is a general .xdc for the out1wasys3 rev out1w out1woard
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

set_property PACKAGE_PIN W5 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk] 

##out1wuttons
set_property PACKAGE_PIN U18 [get_ports in]						
	set_property IOSTANDARD LVCMOS33 [get_ports in]

 
 ## outputs

set_property PACKAGE_PIN L1 [get_ports {done}]			
	set_property IOSTANDARD LVCMOS33 [get_ports {done}]

## letters
## outputs
set_property PACKAGE_PIN U16 [get_ports {clk_3Hz}]
	set_property IOSTANDARD LVCMOS33 [get_ports {clk_3Hz}]
set_property PACKAGE_PIN W3 [get_ports {letter[0]}]	
	set_property IOSTANDARD LVCMOS33 [get_ports {letter[0]}]
set_property PACKAGE_PIN U3 [get_ports {letter[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {letter[1]}]
set_property PACKAGE_PIN P3 [get_ports {letter[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {letter[2]}]
set_property PACKAGE_PIN N3 [get_ports {letter[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {letter[3]}]
set_property PACKAGE_PIN P1 [get_ports {letter[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {letter[4]}]


##7 outment out
set_property PACKAGE_PIN W7 [get_ports {display[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {display[0]}]
set_property PACKAGE_PIN W6 [get_ports {display[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {display[1]}]
set_property PACKAGE_PIN U8 [get_ports {display[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {display[2]}]
set_property PACKAGE_PIN V8 [get_ports {display[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {display[3]}]
set_property PACKAGE_PIN U5 [get_ports {display[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {display[4]}]
set_property PACKAGE_PIN V5 [get_ports {display[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {display[5]}]
set_property PACKAGE_PIN U7 [get_ports {display[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {display[6]}]

