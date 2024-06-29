class monitor;
  virtual add_if vif;
  mailbox mon_to_sb;
  int i=1;
  
  function new(mailbox mon_to_sb, virtual add_if vif);
    this.vif = vif;
    this.mon_to_sb = mon_to_sb;
  endfunction
  
  task run;
    forever begin
      transaction mon_tr;
      wait(!vif.reset);
      
      @(posedge vif.clk);
      mon_tr = new();
      mon_tr.ip = vif.ip;
      
      @(posedge vif.clk);
      mon_tr.out = vif.out;
      mon_to_sb.put(mon_tr);
    end
  endtask
endclass
