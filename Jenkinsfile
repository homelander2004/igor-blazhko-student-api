pipeline {
    agent any

    environment {
        IMAGE_NAME = 'igor-blazhko-student-api'
        IMAGE_TAG  = 'v1.0-igor-blazhko'
    }

    stages {
        stage('Checkout') {
            steps {
                echo "=== Student: Igor Blazhko — pipeline started ==="
                checkout scm
            }
        }

        stage('Build') {
            steps {
                echo "=== Build: Igor Blazhko ==="
                // Собираем JAR без тестов (тесты — в следующей стадии)
                sh './gradlew clean build -x test --no-daemon'
            }
        }

        stage('Test') {
            steps {
                echo "=== Test: Igor Blazhko ==="
                // Если тесты падают — sh вернёт ненулевой код, и пайплайн остановится
                sh './gradlew test --no-daemon'
            }
        }

        stage('Docker Build') {
            steps {
                echo "=== Docker Build: ${IMAGE_NAME}:${IMAGE_TAG} (Igor Blazhko) ==="
                sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
            }
        }

        stage('Verify') {
            steps {
                echo "=== Verify: Igor Blazhko ==="
                sh "docker image inspect ${IMAGE_NAME}:${IMAGE_TAG}"
                echo "SUCCESS: Image ${IMAGE_NAME}:${IMAGE_TAG} exists."
            }
        }
    }

    post {
        always {
            echo "Pipeline for Igor Blazhko finished with status: ${currentBuild.currentResult}"
        }
    }
}
