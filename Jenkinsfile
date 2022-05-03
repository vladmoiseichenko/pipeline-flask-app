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
        stage('Test') {
            steps {
                echo 'asd'
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
    }
}


// Your Jenkins credential ID - "jenkins-aws-beanstalk"
// repo_url = "748376254287.dkr.ecr.us-east-1.amazonaws.com/repo"
// 

// docker tag dockerImage "${repo_url}" + ":$BUILD_NUMBER"