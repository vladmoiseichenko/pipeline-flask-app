pipeline {
    environment {
        repo_url = "https://748376254287.dkr.ecr.us-east-1.amazonaws.com"
    }
    
    agent any

    stages {
        stage('Create docker image') {
            steps {
                echo 'Creating..'
                script {
                    dockerImage = docker.build "app" + ":$BUILD_NUMBER"
                }
            }
        }
        stage('Test') {
            steps {
                echo 'asd'
            }
        }
        stage('Push to ECR') {
            steps {
                script {
                    sh 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin ${repo_url}'
                    sh 'docker push ${repo_url}/app:${BUILD_NUMBER}'
                }
            }
        }
    }
}


// Your Jenkins credential ID - "jenkins-aws-beanstalk"
// repo_url = "748376254287.dkr.ecr.us-east-1.amazonaws.com/repo"
// 

// docker tag dockerImage "${repo_url}" + ":$BUILD_NUMBER"