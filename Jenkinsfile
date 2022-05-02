pipeline {
    environment {
        repo_url = "https://748376254287.dkr.ecr.us-east-1.amazonaws.com/repo"
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
        stage('Deploy') {
            steps {
                script {
                    docker.withRegistry("${repo_url}", 'ecr:us-east-1:jenkins-aws-beanstalk') {
                        dockerImage.push(":$BUILD_NUMBER")
                    }
                }
            }
        }
    }
}


// Your Jenkins credential ID - "jenkins-aws-beanstalk"
// repo_url = "748376254287.dkr.ecr.us-east-1.amazonaws.com/repo"
// 

// docker tag dockerImage "${repo_url}" + ":$BUILD_NUMBER"