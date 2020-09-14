 #!/usr/bin/perl

 sub x { 
   $y = $_[0];
   print `echo $y 2>&1`;
 }
 x(`pwd`);