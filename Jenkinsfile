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
                    // Stop old container (Windows batch equivalent)
                    bat 'docker rm -f static-container || true'

                    // Run new container
                    bat 'docker run -d -p 8080:80 --name static-container jenkins-static-site'
                }
            }
        }

        stage('Verify Deployment') {
            steps {
                script {
                    // Sleep on Windows
                    bat 'ping 127.0.0.1 -n 3 > nul'

                    // Check site using PowerShell curl (Invoke-WebRequest)
                    bat 'powershell -Command "(Invoke-WebRequest http://localhost:8080).StatusCode"'
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
