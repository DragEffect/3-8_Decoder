`include "package.sv"
program base_test(add_if vif);
  env env_o;
  
  initial begin
    env_o = new(vif);
    env_o.agt.gen.count = 25;
    env_o.run();
  end
endprogram
