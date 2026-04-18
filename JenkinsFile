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
                sh '''
                cd terraform
                terraform init
                terraform apply -auto-approve
                '''
            }
        }

        stage('Ansible Deploy') {
            steps {
                sh '''
                cd ansible
                ansible-playbook -i inventory playbook.yml
                '''
            }
        }
    }
}