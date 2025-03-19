FROM maven as build
WORKDIR /app
COPY . .
RUN mvn install

FROM OpenJDK:17.0
WORKDIR /app
COPY --from=build /app/target/maven-web-app.war /app/
EXPOSE 8080
CMD ["java","-jar","maven-web-app.war"]