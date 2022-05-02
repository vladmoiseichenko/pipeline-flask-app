pipeline {
    
    agent any

    stages {
        stage('Create docker image') {
            steps {
                echo 'Creating..'
                script {
                    dockerImage = docker.build "hello-app" + ":$BUILD_NUMBER"
                }
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}