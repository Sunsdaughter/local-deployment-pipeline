pipeline {
    agent any

    options {
        skipDefaultCheckout(true)
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Verify Tools') {
            steps {
                sh 'docker --version'
                sh 'terraform -version'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t local-pipeline-app:latest .'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }

        stage('Verify Deployment') {
            steps {
                sh 'docker ps --filter name=local-pipeline-app-container'
            }
        }
    }
}
