pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = 'docker-hub'
        DOCKERHUB_CREDENTIALS = credentials('docker-hub')
        SONARQUBE_CREDENTIALS = 'your-sonarqube-credentials-id'
        DOCKER_IMAGE_NAME = '10103040/test-nodejs '
    }

    stages {
 
        stage('Build and Push Docker Image') {
           steps {
              sh"""
              echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin
              docker build -t nodeapp_test:latest .
              docker tag  nodeapp_test:latest 10103040/test-nodejs:latest
              docker push 10103040/test-nodejs:latest
              """  
                
            }
        }

    }    
    
   
}


