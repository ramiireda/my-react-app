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
            sh'sudo docker stop react-container && sudo docker rm react-container ||  true'
            sh'sudo docker run --rm --name react-container -it -d -p 8888:8888 react-img'
     }
   }
  }
 }


