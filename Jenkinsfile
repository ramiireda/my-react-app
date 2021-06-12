pipeline {
   agent any

   stages {
    stage('Build') {
     steps {
            echo 'Building...'
            sh'npm config rm proxy'
            sh'npm config rm proxy --global'
            sh'npm config rm https-proxy'
            sh'npm config rm https-proxy --global'
            sh'npm config rm registry'
            sh'npm config set registry http://registry.npmjs.org'
            sh'config set strict-ssl false'
            sh'yarn install'
     }
   }
   
   stage('Test') {
     steps {
            echo 'Testing...'
     }
   }
   stage('Deploy') {
     steps {
            echo 'Deploying...'
            sh'sudo docker run --rm --name react-container -it -d -p 8888:8888 react-img'
     }
   }
  }
 }


