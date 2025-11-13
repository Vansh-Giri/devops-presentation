pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo 'Pulling code from repository...'
                checkout scm
            }
        }

        stage('Build') {
            steps {
                echo 'Validating website files...'
                bat 'dir'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying to local folder...'
                bat 'deploy.bat'
            }
        }

        stage('Verify') {
            steps {
                echo 'Checking if deployment succeeded...'
                bat 'if exist C:\\inetpub\\wwwroot\\index.html (echo Deployment Verified!) else (echo Deployment Failed!)'
            }
        }
    }

    post {
        success {
            echo '✅ Website deployed successfully!'
        }
        failure {
            echo '❌ Pipeline failed!'
        }
    }
}
