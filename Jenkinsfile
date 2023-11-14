pipeline {
  environment {
    registry = "omarouederni/tp-kube"
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/omaroued/tp-devops.git'
      }
    }
    stage('Building image') {
      steps{
        script {
          docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
     stage('Pushing to DockerHub') {
      steps {
        script {
           def image = docker.image(registry + ":$BUILD_NUMBER")
           image.push()
        }
      }
    }
    stage('Deploy to Kubernetes') {
      steps {
        script {
          sh "kubectl config use-context minikube"

          sh """
          kubectl set image deployment/nestjs-app nestjs-app=${registry}:${BUILD_NUMBER} 
          """
        }
      }
    }
  }
}