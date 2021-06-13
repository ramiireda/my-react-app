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
    stage('Upload Artifacts') {
     steps {
            echo 'Uploading...'
            sh'cd /var/jenkins_home/workspace/react-app-pipeline/build && zip -r my-react-app-${BUILD_ID}.zip *'
            sh'curl -u jenkins:AP6hjjyWS6Ngm8a692iEvRk6TVa -T my-react-app-${BUILD_ID}.zip "https://icvs.jfrog.io/artifactory/icvs-generic-local/my-react-app-${BUILD_ID}.zip"'
     }
     }
       
           stage('send email') {
     steps {
            echo 'sending email...'
            emailext body: '''$PROJECT_NAME - Build # $BUILD_NUMBER - $BUILD_STATUS:

            Check console output at $BUILD_URL to view the results.''', subject: '$PROJECT_NAME - Build # $BUILD_NUMBER - $BUILD_STATUS!', to: 'ramy.r.kamel@gmail.com'     
            }
  }
 }
}
