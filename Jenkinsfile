pipeline {
    environment {
        AWS_ACCOUNT_ID="748376254287"
        AWS_DEFAULT_REGION="us-east-1" 748376254287.dkr.ecr.us-east-1.amazonaws.com/repo
        IMAGE_REPO_NAME="repo"
        REPOSITORY_URI = "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}"
  }
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
        stage('ECR') {
            steps {
                script {
                    docker.withRegistry("748376254287.dkr.ecr.us-east-1.amazonaws.com", "jenkins-aws-beanstalk",
                    ecr:us-east-1:"jenkins-aws-beanstalk") {
                        def myImage = docker.build(repo)
                        myImage.push(":$BUILD_NUMBER")
                    }
                }
                 
            }
        }
        stage('Upload Image to ECR') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}