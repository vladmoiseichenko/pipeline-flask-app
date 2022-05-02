pipeline {
    agent any

    stages {
        stage('Create docker image') {
            steps {
                echo 'Creating..'
                app = docker.build("vladmoiseichenko/pipeline-flask-app")
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