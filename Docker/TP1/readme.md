# Database
### Commandes 
    build Dockerfile -> docker build -t pg-database .
    docker network create app-network
    docker run --name pg-database --network app-network -d pg-database
    docker run -p 8090:8080 --network app-network --name adminer -d adminer

## 1-1 Why should we run the container with a flag -e to give the environment variables ?
    Because ça permet de passer les variables d'environnement au conteneur. Comme ça on peut choisir son user, son mdp,...et ne pas utiliser ceux par défault. Cela améliore la sécurité et permet d'avoir un contenuer plus personaliser.

### Commandes
docker run --name pg-database --network app-network -v C:\Users\mathi\OneDrive\CPE\DevOpsS8\Docker\TP1\DataBase\data:/var/lib/postgresql/data -d pg-database

## 1-2 Why do we need a volume to be attached to our postgres container ?
    Because si on veut conserver nos données après l'arrêt du conteneur on est obligé d'utiliser un volume.

## 1-3 Document your database container essentials: commands and Dockerfile.
    Y'a les commandes au dessus

# Backend Simple API
## Commandes
    docker run --name api-backend --network app-network api-backend
    docker run --name api-spring -p 8080:8080 --network app-network -d api-spring

## 1-4 Why do we need a multistage build? And explain each step of this dockerfile.
    On doit utiliser plusieurs parties afin de séparer le jdk du jre. Le jdk est utile pour le développement mais il est trop lourd. Dans la deuxieme partie, on utilise seulement le jre qui est plus léger est suffisant pour lancer l'app.

```dockerfile
# Build
FROM maven:3.9.9-amazoncorretto-21 AS myapp-build
# On passe la variable d'environnement MYAPP_HOME
ENV MYAPP_HOME=/opt/myapp
# On se place dans le répertoire de travail
WORKDIR $MYAPP_HOME
# On copie le fichier pom.xml dans le workdir
COPY pom.xml .
# On copie le répertoire src dans le workdir
COPY src ./src
# On compile le projet
RUN mvn package -DskipTests

# Run
FROM amazoncorretto:21
# On passe la variable d'environnement MYAPP_HOME
ENV MYAPP_HOME=/opt/myapp 
# On se place dans le répertoire de travail
WORKDIR $MYAPP_HOME
# On copie le fichier jar dans le workdir
COPY --from=myapp-build $MYAPP_HOME/target/*.jar $MYAPP_HOME/myapp.jar

# On run l'application
ENTRYPOINT ["java", "-jar", "myapp.jar"]
```
## Commandes
    docker run --name api-back -p 8080:8080 --network app-network -d api-back

# HTTP Serveur
## Commandes
    docker run --name simple-front -p 83:80 -d simple-front
    docker run --name rproxy-front -p 80:80 --network app-network -d rproxy-front

## 1-5 Why do we need a reverse proxy ?
### Because :
* Ça permet une meilleur sécurité car les clients ne se connecte plus directement à nos serveurs backend. On peut également configurer le SSL/TLS.
* On peut paramétrer le reverse proxy pour faire du load balancing et ainsi repartir la charge entre les serveurs.
* Cela permet également de faire de l'optimisation grâce à de la mise en cache ou à compressant les données pour limiter la consommation de bande passante.

# Docker Compose
## 1-6 Why is docker-compose so important?
    Car ça permet manager et de gérer plusieurs dockerfile en même temps. On peut ainsi facilement gérer leurs réseaux et leurs variables d'env facilement. On peut ainsi déployer et faire interagir en même temps plusieurs conteneurs.

## 1-7 Document docker-compose most important commands.
* docker compose up -> démarre un docker compose. -d pour detach
* docker compose down -> stop un docker compose. -down pour supprimmer les volumes
* docker compose logs -> pour voir les logs. -f pour les afficher en continue

## 1-8 Document your docker-compose file.
    done

# Publish
## 1-9 Document your publication commands and published images in dockerhub.

    Push sur docker hub permet d'historiser les versions de ses images et de pouvoir les pull depuis n'importe où puisqu'elle sont herbergées sur dockerHub

### Database
    docker tag pg-database korglos/pg-database:1.0 -> tag la version
    docker push korglos/pg-database:1.0 -> push la version sur dockerHub

### API
    docker tag api-back korglos/api-back:1.0 -> tag la version
    docker push korglos/api-back:1.0 -> push la version sur dockerHub

### Front
    docker tag rproxy-front korglos/rproxy-front:1.0 -> tag la version
    docker push korglos/rproxy-front:1.0 -> push la version sur dockerHub