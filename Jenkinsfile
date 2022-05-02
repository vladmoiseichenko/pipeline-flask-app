pipeline {
  environment {
    registry = "748376254287.dkr.ecr.us-east-1.amazonaws.com/repo"
    registryCredential = "jenkins-aws-beanstalk"
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
    stage('Deploy Image') {
      steps {
        script {
          docker.withRegistry('', registryCredential) {
            dockerImage.push()
          }
        }
      }
    }
  }
}