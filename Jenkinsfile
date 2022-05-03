pipeline {
    environment {
        repo_url = "748376254287.dkr.ecr.us-east-1.amazonaws.com"
        repo_name = "demo"
        app_name = "flask"
    }
    
    agent any

    stages {
        stage('Create docker image') {
            steps {
                echo 'Creating..'
                script {
                    dockerImage = docker.build "$app_name" + ":$BUILD_NUMBER"
                }
            }
        }
        stage('Some tests') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Push to ECR') {
            steps {
                script {
                    sh 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin ${repo_url}'
                    sh 'docker tag "$app_name"":$BUILD_NUMBER" ${repo_url}/${repo_name}:$BUILD_NUMBER'
                    sh 'docker push ${repo_url}/"$repo_name":${BUILD_NUMBER}'
                }
            }
        }
        stage('Docker run') {
            steps {
                script {
                    sh 'docker run -d -p 5000:5000 --rm --name flask ${repo_url}/"$repo_name":${BUILD_NUMBER}'
                }
            }
        }
    }
}