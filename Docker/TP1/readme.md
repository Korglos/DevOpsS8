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

# Backend API
## Commandes
    docker run --name api-backend --network app-network api-backend
    docker run --name api-spring -p 8080:8080 --network app-network -d api-spring
