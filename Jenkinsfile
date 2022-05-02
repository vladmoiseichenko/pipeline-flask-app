pipeline {
    environment {
        AWS_ACCOUNT_ID="748376254287"
        AWS_DEFAULT_REGION="us-east-1" 748376254287.dkr.ecr.us-east-1.amazonaws.com/repo
        IMAGE_REPO_NAME="repo"
        REPOSITORY_URI = "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}"

        tag = "hello-app" + ":$BUILD_NUMBER"
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
    }
}









// docker tag app:1 748376254287.dkr.ecr.us-east-1.amazonaws.com/repo:1
// docker images
// docker push 748376254287.dkr.ecr.us-east-1.amazonaws.com/repo:1