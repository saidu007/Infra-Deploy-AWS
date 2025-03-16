pipeline {
	agent any
	tools {
	terraform 'terraform'
	{
	
	stages {
		stage('Git checkout') {
			steps {
			check out scm
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
