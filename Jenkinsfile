pipeline {
    environment {
    registry = "748376254287.dkr.ecr.us-east-1.amazonaws.com/repo"
    registryCredential = ‘jenkins-aws-beanstalk’
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
                    "ecr:us-east-1:jenkins-aws-beanstalk") {
                        docker.withRegistry( '', registryCredential ) {
                        dockerImage.push(":$BUILD_NUMBER")
                    }
                }                
            }
        }
    }
}