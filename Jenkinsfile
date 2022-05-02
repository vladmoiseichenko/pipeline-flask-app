pipeline {
    agent any

    stages {
        stage('Create docker image') {
            steps {
                echo 'Creating..'
                dir . {
                    sh 'docker build -t hello-app .'
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