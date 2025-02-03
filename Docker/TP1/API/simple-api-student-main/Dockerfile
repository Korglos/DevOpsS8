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