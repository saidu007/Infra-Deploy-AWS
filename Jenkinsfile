pipeline {
    agent any
    tools {
        terraform 'terraform' // Tool installation name for Terraform
    }
    stages {
        stage('Git checkout') {
            steps {
               git branch: 'main', credentialsId: 'Git-credentials', url: 'https://github.com/saidu007/Infra-Deploy-AWS.git'
            }
        }
        stage('Terraform Init') {
            steps {
                sh "terraform init"
            }
        }
       /* stage('Terraform Plan') {
            steps {
                sh "terraform plan"
            }
        }
        stage('Terraform Apply') {
            steps {
                sh "terraform apply --auto-approve"
            }
        } */
    }
}
