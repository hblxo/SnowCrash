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
    $> scp -P 4242 level02@192.168.0.17:/home/user/level02/level02.pcap .
    ```
- Wireshark permet de voir le contenu de chaque paquet. Le 43ème affiche `password`.
- En suivant le flux TCP, on voit les caractères suivants :
    >    Password: ft_wandr...NDRel.L0L
    
    *les `.`désignent des caractères non-imprimables*  
- En affichant la sortie en hexa à la place d'UTF-8, on obtient le résultat suivant :

```
    000000B9  66                                                 f 
    000000BA  74                                                 t
    000000BB  5f                                                 _
    000000BC  77                                                 w
    000000BD  61                                                 a
    000000BE  6e                                                 n
    000000BF  64                                                 d
    000000C0  72                                                 r
    000000C1  7f                                                 .
    000000C2  7f                                                 .
    000000C3  7f                                                 .
    000000C4  4e                                                 N
    000000C5  44                                                 D
    000000C6  52                                                 R
    000000C7  65                                                 e
    000000C8  6c                                                 l
    000000C9  7f                                                 .
    000000CA  4c                                                 L
    000000CB  30                                                 0
    000000CC  4c                                                 L
    000000CD  0d                                                 .
```

- Remplacer les points par le caractère non imprimable `7f` (qui correspond à la fonction `delete`) et le dernier `0d` (correspondant à la touche `return`) :
  `ft_waNDReL0L`

- `getflag`
  > kooda2puivaav1idi4f57q8iq  


## Ressources
- https://www.wireshark.org/#download
- https://fr.wikibooks.org/wiki/Les_ASCII_de_0_%C3%A0_127/La_table_ASCII