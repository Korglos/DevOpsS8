## 3-1 Document your inventory and base commands
    Dans notre inventory, j'indique noter user ansible, notre cle rsa ainsi que notre hosts afin que je puisse me connecter et lancer des commandes sur celui-ci sans avoir à préciser ces informations à chaque commandes.
    Les Facts sont préfixés par le mot ansible_ et sont les informations obtenues en parlant avec les systèmes distants

## 3-2 Document your playbook
    Au début du playbook je indique sur quelles machines je veut exécuter les tâches. 
    je lui indique ensuite d'effectuer le rôle docker pour installer docker.
    
    Dans le rôle docker j'effectue une à une les tâches pour installer docker. À la fin, je vérifie que docker est bien lancé.

## 3-3 Document your docker_container tasks configuration.
### J'ai créé 7 rôles, ils se lancent dans cet ordre :
* Le rôle setup copie le fichier d'environnement sur les machines cibles
* Le rôle docker install docker si il n'est pas installé0
* Le rôle network créé les 2 networks que j'ai besoin pour mon app
* Le rôle volumes créé le volume pour assurer la persistance des données de la bdd
* Le rôle bdd créé le conteneur de la bdd
* Le rôle api créé le conteneur de l'api
* Le rôle httdp créé le conteneur de l'httdp