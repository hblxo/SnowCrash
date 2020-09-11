## Démarche

- Pas d'indice.
- Vérifier le fichier /etc/passwd
    ```
  $> cat /etc/passwd
    ```
    > flag01:42hDRfypTqqnw:3001:3001::/home/flag/flag01:/bin/bash

?????
- Le fichier du level00 se nommant `John`, installer John pour décrypter le password trouvé :
    ```
    $> cd /tmp
    $> curl https://www.openwall.com/john/k/john-1.9.0-jumbo-1.tar.xz
    $> md john && tar -xzvf john-1.9.0-jumbo-1.tar.xz -C john/
    $> cd john/src/
    $> ./configure && make 
    ```

- Lancer John sur la chaine `42hDRfypTqqnw` :
  ```$> 
  ```



## Ressources

- https://www.openwall.com/john/
- https://www.blackmoreops.com/2015/11/10/cracking-password-in-kali-linux-using-john-the-ripper/
- http://www.linuxcertif.com/man/8/john/
- https://linuxhint.com/john_ripper_ubuntu/