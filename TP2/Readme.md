## 2-1 What are testcontainers ?
    C'est est un type de test qui utilise des conteneurs pour simuler l'environnement de production d'une application.

## 2-2 Document your Github Actions configurations.
    Done

## 2-3 For what purpose do we need to push docker images?
    Car cela permet d'avoir un historique des versions de notre application.
    De plus, on pourra pull nos versions depuis n'importe où car elles sont hébergés sur dockerhub.

## 2-4 Document your quality gate configuration.
    J'ai séparé la partie test backend et analyse sonar afin que les 2 soient indépendants et puissent se lancer en même temps.
    La partie des images sur dockerHub ne se lance que si la partie test backend est finit.

### J'ai créé 2 workflow différents :
* main.yml: les 3 jobs sont exécuté (test backend, sonar, docker). C'est la branch de prod, il est donc promordial que tout soit vérifié sur celle-ci.

* develop.ym: seul 2 jobs sont exécuté (test backend, sonar). On exécute pas le job docker car il s'agit d'une branch de dev. Le code qui est push ne correspond pas forcément à une version définitive. On ne veut donc pas créer de version docker. Cepandant il est quand même important de vérifier quand même que les tests passent et de faire une analyse sonar car cela permet de reduire l'accumulation de la dette technique. De ce fait, on s'assure de toujours avoir un code propre