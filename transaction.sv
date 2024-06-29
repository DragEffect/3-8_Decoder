class transaction;
  rand bit [2:0] ip;
  bit [7:0] out;
   
  constraint ip_limit {ip < 10;}
 
endclass
