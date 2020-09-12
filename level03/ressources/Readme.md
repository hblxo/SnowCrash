## Démarche

- Dans le home, se trouve le fichier suivant
    > -rwsr-sr-x 1 flag03  level03 8627 Mar  5  2016    level03  

    ```
    ./level03
    ```
    > Exploit me

parametres ? nm ?
gdb ?
   - man gcb
ghidra ? peda ?

 ```
 $> git clone https://github.com/longld/peda.git ~/peda
 $> scp -P 4242 -r ~/peda/ level03@10.11.200.185:/tmp
 ```

*Dans la VM :*
```
$> gdb ~/level03
gdb$> source /tmp/peda/peda.py
gdb-peda$>        
```

## Ressources
- https://medium.com/@rickharris_dev/reverse-engineering-using-linux-gdb-a99611ab2d32
- https://ghidra-sre.org/InstallationGuide.html#Install




export PATH=