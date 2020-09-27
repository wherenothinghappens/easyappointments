pipeline {
        
    agent none

    environment {
        COMPOSE_PROJECT_NAME = "${env.JOB_NAME}-${env.BUILD_ID}"
        // REGISTRY = [“Manage Jenkins -> Configure System -> Global properties option”]
        // SONARQUBE_URL = [“Manage Jenkins -> Configure System -> Global properties option”]
    }

    stages {

        stage('Running Tests') {
                
            agent any

            steps{

                echo sh(script: 'env|sort', returnStdout: true)

                    
                sh  '''

                '''
            
            }
        }
    }
    
    post {

        always {
            node('master'){
                
                sh  '''
            
                '''
            }
        }
    }
}

