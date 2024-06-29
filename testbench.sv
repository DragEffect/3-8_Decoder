`include "interface.sv"
`include "base_test.sv"
module tb_top;
  bit clk;
  bit reset;
  always #2 clk = ~clk;
  
  add_if vif(clk, reset);
  binary_decoder DUT(.clk(vif.clk),.reset(vif.reset),.in(vif.ip),.out(vif.out));
  base_test t1(vif);
  initial begin
    clk = 0;
    reset = 1;
    #5; 
    reset = 0;
  end
  initial begin
    // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars(0);
  end
endmodule
