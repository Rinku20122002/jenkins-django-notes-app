@Library("shared") _
pipeline {
    agent {
        label 'worker'
    }
    stages {
        stage('Code') {
            steps {
                echo 'Cloning repository...'
                git url: 'https://github.com/Rinku20122002/jenkins-django-notes-app.git', branch: 'main'
                echo 'Code cloned successfully'
            }
        }
        stage('Build') {
            steps {
                script{
                    docker_build("notes-app", "latest", "01182001")
                    echo 'Code build successfully.'
                }
            }
        }
        stage('Push to DockerHub') {
            steps {
                script{
                    docker_push("notes-app", "latest", "01182001")
                }
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying application...'

                sh ''' 
                docker compose down || true
                docker compose up -d
                '''
            }
        }
    }
}
