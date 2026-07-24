pipeline {
	agent any
	
	triggers {
		pollSCM('H/2 * * * *')
	}

	stages {
		stage('Checkout') {
			steps {
				checkout scm
			}
		}
		
		stage('Build Docker Image') {
			steps {
				sh 'docker build -t my-local-app:latest .'
			}
		}

		stage('Terraform Init & Apply') {
			steps {
				sh 'terraform init'
				sh 'terraform apply -auto-approve'
			}
		}
	}
}
