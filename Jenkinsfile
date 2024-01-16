pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('docker-hub')
        SONARQUBE_CREDENTIALS = 'your-sonarqube-credentials-id'
        DOCKER_IMAGE_NAME = '10103040/test-nodejs '
    }

    stages {
        stage('Authenticate with Docker Hub') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
               
            }
        }

        stage('Build and Push Docker Image') {
            steps {
                script {
                    docker.build(env.DOCKER_IMAGE_NAME, '-f Dockerfile .')
                    docker.withRegistry('https://registry-1.docker.io', 'dockerhub-credentials') {
                        docker.image(env.DOCKER_IMAGE_NAME).push()
                    }
                }
            }
        }

    //     stage('Run SonarQube Analysis') {
    //         steps {
    //             withCredentials([string(credentialsId: env.SONARQUBE_CREDENTIALS, variable: 'SONARQUBE_TOKEN')]) {
    //                 script {
    //                     docker.image('sonarsource/sonar-scanner-cli:latest').inside {
    //                         sh """
    //                             sonar-scanner \
    //                             -Dsonar.projectKey=my-node-app \
    //                             -Dsonar.sources=. \
    //                             -Dsonar.host.url=https://your-sonarqube-url \
    //                             -Dsonar.login=\$SONARQUBE_TOKEN
    //                         """
    //                     }
    //                 }
    //             }
    //         }
    //     }
    }

    post {
        success {
            script {
                // Additional actions on success
                echo 'Pipeline completed successfully!'
            }
        }
        failure {
            script {
                // Additional actions on failure
                echo 'Pipeline failed!'
            }
        }
    }
}

