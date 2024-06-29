class scoreboard;
  int compare_cnt;
  mailbox mon_to_sb;
  int i,j;
  
  function new(mailbox mon_to_sb);
    this.mon_to_sb = mon_to_sb;
  endfunction
  
  task run;
    forever begin
      transaction tr;
      tr = new();
      mon_to_sb.get(tr);      
      j = tr.ip;
      i = $pow(2,j);
      if(i==tr.out)begin
        $display("Matched: ip1 = %0d, out = %8b, expected out = %8b", tr.ip, tr.out, i);
      end
      else begin
        $display("NOT matched: ip1 = %0d, out = %8b, expected out = %8b", tr.ip,  tr.out, i);
      end
      compare_cnt++;
    end
  endtask
endclass
