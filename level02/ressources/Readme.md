## Démarche

- Dans le home se situe un fichier `level02.pcap`
- La commande `tcpdump` permet de lire les fichiers *.pcap*
  *Depuis la VM SnowCrash* :
  ```
  $> tcpdump -r level02.pcap | less
  ```
  > reading from file level02.pcap, link-type EN10MB (Ethernet)
  
 - Le format du fichier ne permet pas une rapide compréhension.
  Pour analyse approfondie, transférer le fichier via scp et installer Wireshark.
    ```
    $> brew cask install wireshark
    ```
    $> scp -P 4242 level02@192.168.0.17:/home/user/level02/level02.pcap .
    ```

>    Password: ft_wandr...NDRel.L0L


## Ressources
- https://www.wireshark.org/#download