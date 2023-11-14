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
          sh  "docker build -t $registry:$BUILD_NUMBER ."
        }
      }
    }
     stage('Pushing to DockerHub') {
      steps {
        script {
             sh "docker push $registry:$BUILD_NUMBER"        
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