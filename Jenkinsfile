pipeline {
    agent any

    stages {
        stage('Create docker image') {
            steps {
                echo 'Creating..'
                script {
                    dockerImage = docker.build -t hello + ":$BUILD_NUMBER"
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