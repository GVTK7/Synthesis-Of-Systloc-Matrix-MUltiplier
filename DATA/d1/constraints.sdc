set sdc_version 2.0


set_units -time 1000ps

# Set the current design
current_design MATRIX_MUL

create_clock -name "clk" -period 2.0 -waveform {0.0 1.0} [get_ports clk]
set_clock_transition 0.1 [get_clocks clk]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports rst]
set_input_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports k]
set_input_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {A[1]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {A[0]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {B[1]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {B[0]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {Product[3]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {Product[2]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {Product[1]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {Product[0]}]
set_wire_load_mode "enclosed"
set_clock_uncertainty -setup 0.01 [get_ports clk]
set_clock_uncertainty -hold 0.01 [get_ports clk]
