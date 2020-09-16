## Démarche

- Dans le home :
  
  `ls -la`
    > -rwsr-sr-x 1 flag09  level09 7640 Mar  5  2016 level09
    >
    > ----r--r-- 1 flag09  level09   26 Mar  5  2016 token

- `./level09`
    > You need to provied only one arg.

- `cat token`
  > f4kmm6p|=�p�n��DB�Du{��

- `./level09 token`
    > tpmhr

    `cat ~/token | xargs ~/level09`
    > f5mpq;v�E��{�{��TS�W�����

- `./level09 1`
    > 1

    `./level09 12345`
    > 13579
    
    `./level09 abc`
    > ace

    *On observe qu'un rot est appliqué à chaque caractère en fonction de sa position.*


- Écrire un programme pour inverser l'encryptage :
  ```
    #include <stdio.h>
    #include <string.h>

    int main(int ac, char **av)
    {
        if (ac != 2)
            return 0;
        for (int i = 0; i < strlen(av[1]); i++)
        {
            printf("%c", av[1][i] - i);
        }
        printf("\n");
        return 0;
    }
  ```

- Importer le programme dans la VM et l'exécuter :
    `scp -P 4242 level09/ressources/test.c level09@192.168.0.17:/tmp`
    
    `cd /tmp && gcc -std=c99 test.c ` *(avec le flag -std=c99 pour la boucle for)*

    `cat ~/token | xargs ./a.out`
    > f3iji1ju5yuevaus41q1afiuq

- `su flag00`: f3iji1ju5yuevaus41q1afiuq
- `getflag`
  > Check flag.Here is your token : s5cAJpM8ev6XHw998pRWG728z

## Ressources
