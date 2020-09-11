## Démarche

- Le *README.md* de la vidéo (indisponible dans l'iso) contient :
  > FIND this first file who can run only as flag00

- Afficher les fichiers que seul le user `flag00` peut run :
    ```
    $> man find
    $> find . -user flag00 -perm -000
    ```
- Rediriger les erreurs de find dans le /dev/null :
    ```
    $> find . -user flag00 -perm -000 -print 2>/dev/null
    ```
    >   ./usr/sbin/john
        ./rofs/usr/sbin/john
- Contenu des fichiers trouvés:
    > cdiiddwpgswtgt
- ROT15 :
    > nottoohardhere
- getflag :
    > x24ti5gi3x0ol2eh4esiuxias

## Ressources

- https://linux.die.net/man/1/find
- https://www.cyberciti.biz/faq/bash-find-exclude-all-permission-denied-messages/
- https://www.dcode.fr/chiffre-cesar