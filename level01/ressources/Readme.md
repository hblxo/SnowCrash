## Démarche

- Pas d'indice.
- Vérifier le fichier /etc/passwd
    ```
  $> cat /etc/passwd
    ```
    > flag01:42hDRfypTqqnw:3001:3001::/home/flag/flag01:/bin/bash

?????
- Le fichier du level00 se nommant `John`, installer John pour décrypter le password trouvé :
  *sur MacOs*
    ```
    $> cd /tmp
    $> curl -L --output john.zip https://download.openwall.net/pub/projects/john/contrib/macosx/john-1.8.0.9-jumbo-macosx_sse4.zip
    $> unzip -q john.zip ; mv john-1.8.0.9-jumbo-macosx_sse4 john
    $> cd john/run/
    $> ./john --help
    ```

- Lancer John sur la chaine `42hDRfypTqqnw` :
  ```$> echo "42hDRfypTqqnw" > password
    $> ./john password --show
  ```
  > ?:abcdefg
  > 1 password hash cracked, 0 left

- getflag
  > f2av5il02puano7naaf6adaaf



## Ressources

- https://www.openwall.com/john/
- https://www.blackmoreops.com/2015/11/10/cracking-password-in-kali-linux-using-john-the-ripper/
- http://www.linuxcertif.com/man/8/john/
- https://linuxhint.com/john_ripper_ubuntu/