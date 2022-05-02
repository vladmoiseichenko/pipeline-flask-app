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
        stage('ECR') {
            steps {
                script {
                    docker.withRegistry("748376254287.dkr.ecr.us-east-1.amazonaws.com", "jenkins-aws-beanstalk",
                    "ecr:us-east-1:jenkins-aws-beanstalk") {
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