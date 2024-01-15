FROM schoolofdevops/maven:spring as build

WORKDIR /app

COPY . . 

RUN mvn spring-javaformat:apply && \ 
    mvn package -DskipTests && \ 
    mv target/spring-petclinic-2.3.1.BUILD-SNAPSHOT.jar /run/petclinic.jar

EXPOSE 8080

CMD java -jar /run/petclinic.jar