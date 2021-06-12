pipeline {
   agent any

   stages {
    stage('Build') {
     steps {
            echo 'Building...'
            sh'npm config rm proxy'
            sh'RUN npm config rm proxy --global'
            sh'RUN npm config rm https-proxy'
            sh'RUN npm config rm https-proxy --global'
            sh'RUN npm config rm registry'
            sh'RUN npm config set registry http://registry.npmjs.org'
            sh'RUN npm config set strict-ssl false'
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


