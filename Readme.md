# Clock-divider
# The clock divider can reduce the clock in iteration of half based on user selection

The program is compiled in Intel Quartus Prime and run under the testbench to perform the functional computation.
The clock divider takes a clock signal and a clock select signal to output the divided clock signal that may be useful for certain component within circuit that utilizes slower clock.
Slower clock signal can be useful in lowering power consumption for low frequency components as power is consumed during transition state hence dividing clock according to application can reduce the over power consumption.

<br />
<p align="center">
  <img src="Sources/Circuit design.jpg" width="400"><br />
  Circuit design
</p>
D flip-flop cascaded with synchronous reset pin<br />

<br />
1. Clock follower
<br />
<p align="center">
  <img src="Sources/1. Clock follower (100MHz).jpg" width="400"><br />
  Clock follower
</p>
CLK          : 100MHz<br />
CLK_out      : 100MHz <br />
Duty_cycle   : 10ns <br />

<br />
2. Clock with one division
<br />
<p align="center">
  <img src="Sources/2. Clock (50MHz).jpg" width="400"><br />
  Clock with one division
</p>
CLK          : 100MHz<br />
CLK_out      : 50MHz <br />
Duty_cycle   : 20ns <br />

<br />
3. Clock with four division
<br />
<p align="center">
  <img src="Sources/3. Clock (6.25MHz).jpg" width="400"><br />
  Clock with four division
</p>
CLK          : 100MHz<br />
CLK_out      : 6.25MHz <br />
Duty_cycle   : 160ns <br />
