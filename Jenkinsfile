pipeline {
	agent any
	tools {
	terraform 'terraform'
	{
	
	stages {
		stage('Git checkout') {
			steps {
			git credentialsId: 'Git-credentials', url: 'https://github.com/saidu007/Infra-Deploy-AWS.git'
			}
		}
		stage('Terraform init') {
			steps {
			sh ("terraform init")
			}
		}
		stage('plan') {
			steps {
			sh ("terraform plan")
			}
		}
		stage('Terraform init') {
			steps {
			sh ("terraform apply --auto-approve")
			}
		}
		} //stages closing
	} //pipeline closing
