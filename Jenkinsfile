pipeline {
   agent any

   stages {
    stage('Build') {
     steps {
            echo 'Building...'
            npm config rm proxy
            npm config rm proxy --global
            npm config rm https-proxy
            npm config rm https-proxy --global
            npm config rm registry
            npm config set registry http://registry.npmjs.org
            config set strict-ssl false
            yarn install
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


