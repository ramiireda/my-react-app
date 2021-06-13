pipeline {
   agent any

   stages {
    stage('install dependencies') {
     steps {
            echo 'installing dependencies...'
            sh'yarn install'
     }
   }

    stage('Build') {
     steps {
            echo 'Building...'
            sh'npm run build'
     }
   }
   
   stage('Test') {
     steps {
            echo 'Testing...'
            sh'npm test'
     }
   }
   stage('Deploy') {
     steps {
            echo 'Deploying...'
            sh'sudo docker build -t nginx-img .'
            sh'sudo docker stop nginx || true'            
            sh'sudo docker rm nginx || true'            
            sh'sudo docker run --rm --name nginx -it -d -p 8888:8888 nginx-img'
     }
   }
  }
 }


