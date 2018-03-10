/******************************************************************************
*                                                                             *
* Copyright 2016 myStorm Copyright and related                                *
* rights are licensed under the Solderpad Hardware License, Version 0.51      *
* (the “License”); you may not use this file except in compliance with        *
* the License. You may obtain a copy of the License at                        *
* http://solderpad.org/licenses/SHL-0.51. Unless required by applicable       *
* law or agreed to in writing, software, hardware and materials               *
* distributed under this License is distributed on an “AS IS” BASIS,          *
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or             *
* implied. See the License for the specific language governing                *
* permissions and limitations under the License.                              *
*                                                                             *
******************************************************************************/
module chip (
    // 100MHz clock input
    input  clk,
    // LED output
    output [55:52] PMOD
  );

  wire reset_;
  wire reset;

  sync_reset u_global_reset(
	.clk(clk),
	.reset_in_(1'b1), 
	.reset_out_(reset_)
	);
  assign reset = !reset_;

  wire led;

  blink my_blink (
    .clk(clk),
    .rst(reset),
    .led(led)
  );

  assign PMOD[55:52] = {4{led}};

endmodule
