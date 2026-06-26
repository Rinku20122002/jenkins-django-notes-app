@Library('shared-lib-2') _
pipeline{
    agent{ label 'worker1'}
    stages{
        stage("Code clone"){
            steps{
                script{
                    clone("https://github.com/Rinku20122002/jenkins-django-notes-app.git" , "main")
                }
            }
        }
        stage("Build Stage"){
            steps{
                script{
                    docker_build("django-notes", "latest", "01182001")
                }
            }
        }
        stage("Vulnerability Scan (Trivy)"){
            steps{
                echo "Scanning Docker Image for Security Vulnerabilities..."
                sh 'trivy image latest/django-notes:01182001 || true'
            }
        }  
                
        stage("Push to DockerHub"){
            steps{
                script{
                    docker_push("django-notes", "latest")
                }
            }      
        }
        stage("Deployment Stage"){
            steps{
                echo "This is deploing the code"
                sh '''
                    docker compose down || true
                    docker compose up -d
                    '''
            }
        }
    }
}
