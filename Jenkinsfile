pipeline {
   agent any

   stages {
    stage('Build') {
     steps {
            echo 'Building...'
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


