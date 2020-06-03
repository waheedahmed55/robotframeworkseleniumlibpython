pipeline {
    agent any
    stages {
         stage('Clean Remove Old Files') {
            steps {
              dir ('Report.zip') {
                 deleteDir()
        }
    }
}
        stage('Download Dependencies') {
            steps {
                bat'''
                cd robotframeworkautomation
                pip install -r Requirements.txt
                '''
            }
        }
        stage('Run Smoke tests') {
            steps {
                bat'''
                dir
                cd robotframeworkautomation
                robot -d "Reports" TestCases/Smoke/*.robot
                '''
            }
        }
        stage('Run Functional tests') {
            steps {
                bat'''
                dir
                cd robotframeworkautomation
                robot -d "Reports" TestCases/Functional/*.robot
                '''
            }
        }
        stage('Zip reports') {
            steps {
                zip zipFile: 'Report.zip', archive: false, dir: 'robotframeworkautomation\\Reports'
            }
        }
    }
    post {
        always {
            emailext attachLog: true,
                attachmentsPattern: 'Report.zip',
                body: "${currentBuild.currentResult}: Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}\n More info at: ${env.BUILD_URL}",
                recipientProviders: [[$class: 'DevelopersRecipientProvider'], [$class: 'RequesterRecipientProvider']],
                subject: "Jenkins Build ${currentBuild.currentResult}: Job ${env.JOB_NAME}",
                to: 'waheedahmed55@gmail.com'
        }
    }
}

