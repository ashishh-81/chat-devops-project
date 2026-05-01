pipeline {
    agent any

    stages {

        stage('Clone Repo') {
            steps {
                git branch: 'main', url: 'https://github.com/ashishh-81/chat-devops-project.git'
            }
        }

        stage('Terraform') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'aws-creds',
                    usernameVariable: 'AWS_ACCESS_KEY_ID',
                    passwordVariable: 'AWS_SECRET_ACCESS_KEY'
                )]) {
                    withEnv(['AWS_DEFAULT_REGION=ap-south-1']) {
                        bat '''
                        cd terraform
                        terraform init
                        terraform apply -auto-approve
                        '''
                    }
                }
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