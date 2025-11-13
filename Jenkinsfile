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
                    // Stop old container
                    sh 'docker rm -f static-container || true'

                    // Start new container
                    sh 'docker run -d -p 8080:80 --name static-container jenkins-static-site'
                }
            }
        }

        stage('Verify Deployment') {
            steps {
                script {
                    sh "sleep 3"
                    sh "curl -I http://localhost:8080"
                }
            }
        }
    }

    post {
        success {
            echo '🚀 Static website deployed using Docker!'
        }
        failure {
            echo '❌ Deployment failed!'
        }
    }
}
