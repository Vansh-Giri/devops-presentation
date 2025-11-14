pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("jenkins-static-site")
                }
            }
        }

        stage('Run Container') {
            steps {
                script {
                    bat 'docker rm -f static-container || true'
                    bat 'docker run -d -p 9090:80 --name static-container jenkins-static-site'
                }
            }
        }

        stage('Verify Deployment') {
            steps {
                script {
                    bat 'ping 127.0.0.1 -n 3 > nul'
                    bat 'powershell -Command "(Invoke-WebRequest http://localhost:9090).StatusCode"'
                }
            }
        }
    }

    post {
        success {
            echo '🚀 Website deployed successfully using Docker!'
        }
        failure {
            echo '❌ Deployment failed!'
        }
    }
}
