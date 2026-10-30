# Этап 1: Сборка
FROM eclipse-temurin:21-jdk-alpine AS build
WORKDIR /app

# Копируем файлы Gradle wrapper и конфигурации
COPY gradlew .
COPY gradle gradle
COPY build.gradle .
COPY settings.gradle .  
COPY src src

# Даём права на выполнение и собираем JAR 
RUN chmod +x gradlew && ./gradlew build -x test

# Этап 2: Запуск 
FROM eclipse-temurin:21-jre-alpine
WORKDIR /app

# Копируем только собранный JAR из предыдущего этапа
COPY --from=build /app/build/libs/*.jar app.jar

# Открываем порт
EXPOSE 8080

# Запускаем приложение
ENTRYPOINT ["java", "-jar", "app.jar"]
