pipeline {
    agent any

    stages {

        stage('Clone Repo') {
            steps {
                git 'https://github.com/ashishh-81/chat-devops-project.git'
            }
        }

        stage('Terraform') {
            steps {
                bat '''
                cd terraform
                terraform init
                terraform apply -auto-approve
                '''
            }
        }

        stage('Ansible Deploy') {
            steps {
                bat '''
                cd ansible
                ansible-playbook -i inventory playbook.yml
                '''
            }
        }
    }
}